module ETSource
  # Acts as a controller for building the fully-calculated ETSource graph.
  #
  # Loads the graph structure and attributes from the source files, calculates
  # the Rubel-based attributes, triggers the Refinery calculations, and
  # returns to results to you.
  class Runner
    attr_reader :dataset

    # Public: Creates a new Runner.
    #
    # Returns a Runner.
    def initialize(dataset)
      @dataset = dataset
    end

    # Public: Calculates the graph.
    #
    # I feel like this should be a separate class, but for the sake of
    # temporary simplicity, I'm going to put it in a method.
    #
    # Returns the calculated Graph.
    def calculate
      graph.nodes.each do |node|
        calculate_rubel_attribute(node, :demand)

        node.out_edges.each do |edge|
          calculate_rubel_attribute(edge, :child_share)
        end
      end

      graph
    end

    # Public: The Turbine::Graph which represents the structure of the graph
    # as defined in the source files.
    #
    # Returns a Turbine::Graph.
    def graph
      @graph ||= GraphBuilder.build
    end

    # Public: The runtime used by the Runner to calculate Rubel attributes.
    #
    # Returns an ETSource::Runtime.
    def runtime
      @runtime ||= Runtime.new(dataset, graph)
    end

    #######
    private
    #######

    # Internal: Given an +element+ and +attribute+ name, if the element has a
    # "query" attribute, that query will be run with Rubel at the resulting
    # values set to +attribute+.
    #
    # For example
    #
    #    calculate_rubel_attribute(node, :demand)
    #
    # Returns nothing.
    def calculate_rubel_attribute(element, attribute)
      model = element.get(:model)

      if model.respond_to?(:query) && ! model.query.nil?
        element.set(attribute, runtime.execute(model.query))
      end
    end

  end # Runner
end # ETSource
