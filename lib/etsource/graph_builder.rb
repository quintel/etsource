module ETSource
  class GraphBuilder
    # Public: Creates a Turbine::Graph containing all the nodes in the
    # ETSource files, and sets up the edges between them.
    #
    # Each node has a "model" property containing the ActiveDocument instance.
    def self.build
      new.graph
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
    def initialize
      @nodes    = Collection.new(Node.all)
      @edges    = Collection.new(Edge.all)
      @carriers = Collection.new(Carrier.all)
      @graph    = Turbine::Graph.new
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

      props   = { type: edge.type, reversed: edge.reversed? }
      carrier = carriers.find(edge.carrier)

      raise UnknownLinkNodeError.new(edge, edge.supplier)   if parent.nil?
      raise UnknownLinkNodeError.new(edge, edge.consumer)   if child.nil?
      raise UnknownLinkCarrierError.new(edge, edge.carrier) if carrier.nil?

      graph.node(parent.key).connect_to(
        graph.node(child.key), carrier.key, props)
    end
  end # GraphBuilder
end # ETSource
