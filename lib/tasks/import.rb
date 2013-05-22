namespace :import do
  # Returns a hash where each key is the name of the sector, and the value is
  # an array containing all the nodes in that sector.
  def nodes_by_sector
    nodes = YAML.load_file(ETSource.root.join('topology/export.graph'))
    nodes = nodes.with_indifferent_access

    Dir.glob('datasets/nl/graph/**.yml').each do |file|
      YAML.load_file(file).each do |key, properties|
        nodes[key].merge!(properties) if nodes[key]
      end
    end

    nodes.group_by { |key, data| data['sector'] || 'nosector' }
  end

  # Given a node key and its data, determines which subclass of Node should
  # be used.
  def node_subclass(key, data)
    return ETSource::FinalDemandNode if key.to_s.match(/final_demand/)
    return ETSource::DemandNode      if key.to_s.match(/demand/)

    out_slots, in_slots = data['slots'].partition { |s| s.match(/^\(/) }
    in_slots.map!  { |slot| match = slot.match(/\((.*)\)/) ; match[1] }
    out_slots.map! { |slot| match = slot.match(/\((.*)\)/) ; match[1] }

    if ((in_slots - ['loss']) - (out_slots - ['loss'])).any?
      # A node is a converter if it outputs energy in a different carrier than
      # it received; the exception being loss which we ignore.
      ETSource::Converter
    else
      ETSource::Node
    end
  end

  # Returns a hash containing all the queries defined in the data/import CSVs.
  # Includes queries for nodes, edges, and slots.
  def queries
    @queries ||= begin
      queries = {}

      Pathname.glob(ETSource.data_dir.join('import/**/*.csv')).each do |path|
        data = CSV.table(path).select do |row|
          row[:status].nil? || row[:status] == 'necessary'
        end

        data.each do |row|
          if row[:converter_key]
            key = row[:converter_key].to_sym
          else
            key = ETSource::Edge.key(row[:from], row[:to], row[:carrier])
          end

          queries[key] = row[:query]
        end
      end

      queries
    end
  end

  # Used to nicely format the progress of an import.
  #
  # Create a new Import run with a message indicating the "type of thing"
  # being imported, and wrap each imported thing in Runner#item. For example:
  #
  #   runner = ImportRun.new('nodes')
  #   nodes.each { |node| runner.item { process node } }
  #   runner.finish
  #
  # The class will catch any RuntimeErrors which are raised, and report all
  # the failures at the end (when you call +finish+).
  class ImportRun
    def initialize(message)
      @message = message
      @errors  = []
      @printed = false
    end

    # Wrap each single imported item in this method, to record the success or
    # failure.
    def item
      unless @printed
        # Print the initial message if this is the first item to be imported.
        print "Processing #{ @message }: "
        @printed = true
      end

      yield
      print Term::ANSIColor.green { '.' }
    rescue RuntimeError => ex
      print Term::ANSIColor.red { '!' }
      @errors.push(ex)
    end

    # Prints out error messages, if there were any.
    def finish
      puts '' ; puts ''
      @errors.each { |error| puts error.message }
      puts '' if @errors.any?
    end
  end # ImportRun

  # --------------------------------------------------------------------------

  # Loads ETSource.
  task :setup do
    $LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + '/..'))

    require 'fileutils'
    require 'etsource'
    require 'term/ansicolor'
    require 'active_support/core_ext/hash/indifferent_access'
  end # task :setup

  desc <<-DESC
    Import nodes from the old format to ActiveDocument.

    Reads the legacy export.graph file and the "nl" dataset, and creates
    new-style ActiveDocument files for each node.

    This starts by *deleting* everything in data/nodes on the assumption that
    there are no hand-made changes.
  DESC
  task nodes: :setup do
    include ETSource

    # Wipe out *everything* in the nodes directory; rather than simply
    # overwriting existing files, since some may have new naming conventions
    # since the previous import.
    FileUtils.rm_rf(ETSource::Node.directory)

    runner = ImportRun.new('nodes')

    nodes_by_sector.each do |sector, nodes|
      nodes.each do |key, data|
        runner.item do
          unless data['slots']
            raise RuntimeError.new("Node #{ key.inspect } has no slots?!")
          end

          klass = node_subclass(key, data)

          # Split the original slots array into two, containing the outgoing
          # and incoming slots respectively. This is done by recognising that
          # outgoing slots begin with the carrier key in (brackets).
          out_slots, in_slots = data['slots'].partition { |s| s.match(/^\(/) }

          data[:in_slots]  = in_slots.map  { |s| s.match(/\((.*)\)/)[1] }
          data[:out_slots] = out_slots.map { |s| s.match(/\((.*)\)/)[1] }

          data.delete('links')
          data.delete('slots')

          data[:query] = queries[key.to_sym] if queries.key?(key.to_sym)
          data[:path]  = "#{ sector }/#{ key }"

          node = klass.new(data).tap { |n| n.save(false) }

          raise InvalidDocumentError.new(node) unless node.valid?
        end
      end
    end

    runner.finish
  end # task :nodes

  desc <<-DESC
    Import edges from the old format to ActiveDocument.

    This starts by *deleting* everything in data/edges on the assumption that
    there are no hand-made changes.
  DESC
  task edges: :setup do
    include ETSource

    # Wipe out *everything* in the edges directory; rather than simply
    # overwriting existing files, since some may have new naming conventions
    # since the previous import.
    FileUtils.rm_rf(Edge.directory)

    link_re = /
      (?<consumer>[\w_]+)-       # Child node key
      \([^)]+\)\s                # Carrier key (ignored)
      (?<reversed><)?            # Arrow indicating a reversed link?
      --\s(?<type>\w)\s-->?\s    # Link type and arrow
      \((?<carrier>[^)]+)\)-     # Carrier key
      (?<supplier>[\w_]+)        # Parent node key
    /xi

    runner = ImportRun.new('edges')

    nodes_by_sector.each do |sector, nodes|
      sector_dir = Edge.directory.join(sector)
      edges      = nodes.map { |key, node| node['links'] }.flatten.compact

      edges.each do |link|
        runner.item do
          data = link_re.match(link)

          type = case data[:type]
            when 's' then :share
            when 'f' then :flexible
            when 'c' then :constant
            when 'd' then :dependent
            when 'i' then :inverse_flexible
          end

          # We currently have to construct the full path manually since Edge
          # does not (yet) account for the sector.
          key   = Edge.key(data[:consumer], data[:supplier], data[:carrier])
          path  = sector_dir.join(key.to_s)

          props = { path: path, type: type, reversed: ! data[:reversed].nil? }

          if queries.key?(key.to_sym)
            # For the moment, assume shares are technology shares.
            props[:sets]  = :parent_share
            props[:query] = queries[key.to_sym] if queries.key?(key.to_sym)
          end

          edge = Edge.new(props).tap { |e| e.save(false) }

          raise InvalidDocumentError.new(edge) unless edge.valid?
        end
      end
    end # nodes_by_sector.each

    runner.finish
  end # task :edges

  task all: ['import:nodes', 'import:edges'] do
  end # task :all
end # namespace :import

desc 'Import edges and nodes from the old format to ActiveDocument'
task import: ['import:all']
