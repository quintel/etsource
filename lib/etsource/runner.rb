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
        model = node.get(:model)

        if model.respond_to?(:query) && ! model.query.nil?
          node.set(:demand, runtime.execute(model.query))
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
  end # Runner
end # ETSource
