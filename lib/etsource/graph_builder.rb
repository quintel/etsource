module ETSource
  class GraphBuilder
    # Public: Creates a Turbine::Graph containing all the nodes in the
    # ETSource files, and sets up the edges between them.
    #
    # Each node has a "model" property containing the ActiveDocument instance.
    def self.build(sector = nil)
      new(sector).graph
    end

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
    def initialize(sector = nil)
      @nodes    = Collection.new(Node.all.select(&filter(sector)))
      @carriers = Collection.new(Carrier.all)
      @graph    = Turbine::Graph.new

      edges = if sector
        Edge.all.select do |edge|
          # For the moment, we test the sector of the node on each end of the
          # edge, rather than the namespace of the edge; edges currently use
          # the same namespace as the parent node. Because of this, testing
          # only the namespace would raise a DocumentNotFoundError when trying
          # to connect "bridge" edges which cross from one sector to another.
          @nodes.key?(edge.supplier) && @nodes.key?(edge.consumer)
        end
      else
        Edge.all
      end

      @edges = Collection.new(edges)
    end

    # Internal: Adds the ActiveDocument nodes to the Turbine graph.
    #
    # Returns nothing.
    def build_nodes!
      @nodes.sort_by(&:key).each do |node|
        @graph.add(Turbine::Node.new(node.key, model: node))
      end
    end

    # Internal: Reads the source files to set up the edges between each node.
    #
    # Returns nothing.
    def establish_edges!
      @edges.sort_by(&:key).each do |edge|
        self.class.establish_edge(edge, @graph, @nodes, @carriers)
      end
    end

    # Internal: Given a single +edge+, sets up the edge between the two
    # nodes specified.
    #
    # edge - An Edge (ActiveDocument) instance.
    #
    # Returns the Turbine::Edge which was created.
    def self.establish_edge(edge, graph, nodes, carriers)
      parent  = nodes.find(edge.supplier)
      child   = nodes.find(edge.consumer)

      props   = { type: edge.type, reversed: edge.reversed?, model: edge }
      carrier = carriers.find(edge.carrier)

      graph.node(parent.key).connect_to(
        graph.node(child.key), carrier.key, props)
    end

    # Internal: Given a sector, returns a lambda which can be used to filter
    # the edges and nodes so that only those in the sector are selected.
    #
    # sector - The sector name as a string.
    #
    # Returns a lambda.
    def filter(sector)
      if sector
        regex = /^#{ Regexp.escape(sector.to_s) }\.?/
        ->(el) { el.ns.match(regex) }
      else
        ->(el) { true }
      end
    end
  end # GraphBuilder
end # ETSource
