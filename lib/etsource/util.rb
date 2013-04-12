module ETSource
  module Util

    # Links ------------------------------------------------------------------

    # Extracts data about a link from the raw link string.
    LINK_RE = /
      (?<child>[\w_]+)-          # Child node key
      \([^)]+\)\s                # Carrier key (ignored)
      (?<reversed><)?            # Arrow indicating a reversed link?
      --\s(?<type>\w)\s-->?\s    # Link type and arrow
      \((?<carrier>[^)]+)\)-     # Carrier key
      (?<parent>[\w_]+)          # Parent node key
    /xi

    # Public: Given a path to a directory, yields an array of links for each
    # "links" file in that directory. Does not recurse into subdirectories.
    #
    # directory - Path to a directory in which there are ".links" files.
    #
    # For example:
    #
    #   ETSource::Util.foreach_link(path) do |links, filename|
    #     links # => [ "...", "..." ]
    #   end
    #
    # Returns nothing.
    def self.foreach_link(directory)
      Dir["#{ directory }/*.links"].map do |filename|
        File.foreach(filename) do |line, *rest|
          yield(line.strip, *rest, filename) if line.match(/\S/)
        end
      end

      nil
    end

    # Public: Given an array of nodes, sets up Turbine edges between them in
    # accordance with the +links+ strings held in the nodes.
    #
    # links - An array containing all the link definitions (as strings).
    # nodes - An array containing zero or more Nodes.
    #
    # Returns nothing.
    def self.establish_links!(nodes, links)
      links.each { |link| establish_link(link, nodes) }
      nil
    end

    # Internal: Given a string defining a link, sets up a Turbine::Edge
    # between the nodes.
    #
    # link  - The raw link definition string.
    # nodes - All the nodes defined in the graph.
    #
    # Raises Turbine::DuplicateEdgeError if the edge already exists.
    #
    # Returns the edge which was created.
    def self.establish_link(link, nodes)
      data = LINK_RE.match(link)

      raise InvalidLinkError.new(link) if data.nil?

      type = case data['type']
        when 's' then :share
        when 'f' then :flexible
        when 'c' then :constant
        when 'd' then :dependent
        when 'i' then :inverse_flexible
      end

      parent  = nodes.detect { |other| other.key == data['parent'] }
      child   = nodes.detect { |other| other.key == data['child'] }

      props   = { type: type, reversed: ! data['reversed'].nil? }
      carrier = Carrier.find(data['carrier'])

      raise UnknownLinkNodeError.new(link, data['parent'])     if parent.nil?
      raise UnknownLinkNodeError.new(link, data['child'])      if child.nil?

      raise UnknownLinkTypeError.new(link, data['type'])       if type.nil?
      raise UnknownLinkCarrierError.new(link, data['carrier']) if carrier.nil?

      e = parent.turbine.connect_to(child.turbine, carrier.key, props)
    end

  end # Util
end # ETSource
