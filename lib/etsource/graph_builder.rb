module ETSource
  class GraphBuilder
    # Public: Creates a Turbine::Graph containing all the nodes in the
    # ETSource files, and sets up the edges between them.
    #
    # Each node has a "model" property containing the ActiveDocument instance.
    def self.build
      new.graph
    end

    # Extracts data about a link from the raw link string.
    LINK_RE = /
      (?<child>[\w_]+)-          # Child node key
      \([^)]+\)\s                # Carrier key (ignored)
      (?<reversed><)?            # Arrow indicating a reversed link?
      --\s(?<type>\w)\s-->?\s    # Link type and arrow
      \((?<carrier>[^)]+)\)-     # Carrier key
      (?<parent>[\w_]+)          # Parent node key
    /xi

    # Public: The graph, built by GraphBuilder.
    #
    # Returns a Turbine::Graph containing the nodes and edges defined in the
    # source files.
    def graph
      if @graph.nodes.empty?
        build_nodes!
        establish_edges!
      end

      @graph
    end

    #######
    private
    #######

    # Internal: Creates a new GraphBuilder. Use GraphBuilder.build rather than
    # creating this yourself.
    #
    # Returns a GraphBuilder.
    def initialize
      @nodes    = Collection.new(Node.all)
      @carriers = Collection.new(Carrier.all)
      @graph    = Turbine::Graph.new
    end

    # Internal: Adds the ActiveDocument nodes to the Turbine graph.
    #
    # Returns nothing.
    def build_nodes!
      @nodes.each do |node|
        @graph.add(Turbine::Node.new(node.key, model: node))
      end
    end

    # Internal: Reads the source files to set up the edges between each node.
    #
    # Returns nothing.
    def establish_edges!
      dir = ETSource.data_dir.join('topology')

      self.class.foreach_edge(dir) do |edge, *, filename|
        begin
          self.class.establish_edge(edge, @graph, @nodes, @carriers)
        rescue InvalidLinkError => ex
          # Add information about which file contained the offending link.
          ex.message.gsub!(/$/, " (in file #{ filename })")
          raise ex
        end
      end
    end

    # Public: Given a path to a directory, yields an array of links for each
    # "links" file in that directory. Does not recurse into subdirectories.
    #
    # directory - Path to a directory in which there are ".links" files.
    #
    # For example:
    #
    #   ETSource::Util.foreach_edge(path) do |links, filename|
    #     links # => [ "...", "..." ]
    #   end
    #
    # Returns nothing.
    def self.foreach_edge(directory)
      Dir["#{ ETSource.data_dir.join('topology') }/*.links"].map do |filename|
        File.foreach(filename) do |line, *rest|
          yield(line.strip, *rest, filename) if line.match(/\S/)
        end
      end

      nil
    end

    # Internal: Given a single +edge+, sets up the edge between the two
    # nodes specified.
    #
    # edge - The string containing information about the edge.
    #
    # Returns the edge.
    def self.establish_edge(edge, graph, nodes, carriers)
      unless data = LINK_RE.match(edge)
        raise InvalidLinkError.new(edge)
      end

      type = case data['type']
        when 's' then :share
        when 'f' then :flexible
        when 'c' then :constant
        when 'd' then :dependent
        when 'i' then :inverse_flexible
      end

      parent  = nodes.find(data['parent'])
      child   = nodes.find(data['child'])

      props   = { type: type, reversed: ! data['reversed'].nil? }
      carrier = carriers.find(data['carrier'])

      raise UnknownLinkNodeError.new(edge, data['parent'])     if parent.nil?
      raise UnknownLinkNodeError.new(edge, data['child'])      if child.nil?

      raise UnknownLinkTypeError.new(edge, data['type'])       if type.nil?
      raise UnknownLinkCarrierError.new(edge, data['carrier']) if carrier.nil?

      graph.node(parent.key).connect_to(
        graph.node(child.key), carrier.key, props)
    end
  end # GraphBuilder
end # ETSource
