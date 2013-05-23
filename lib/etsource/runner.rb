module ETSource
  # Acts as a controller for building the fully-calculated ETSource graph.
  #
  # Loads the graph structure and attributes from the source files, calculates
  # the Rubel-based attributes, triggers the Refinery calculations, and
  # returns to results to you.
  class Runner
    attr_reader :dataset, :sector

    # Creates a Refinery catalyst which, given the initial Refinery graph,
    # will set the share values for any slots where a share is explicitly
    # specified, or calculated through a Rubel query.
    #
    # It expects to be called with a lambda telling the catalyst how to run
    # the Rubel query.
    #
    #   SetSlotShares.call(->(query) { runtime.execute(query) })
    #   # => #<TheRefineryCatalyst ...>
    #
    # Returns a lambda.
    SetSlotShares = ->(perform) do
      ->(refinery) do
        Slot.all.each do |model|
          node = refinery.node(model.node)
          slot = node.slots.public_send(model.direction, model.carrier)

          if model.query
            slot.set(:share, perform.call(model.query))
          elsif model.share
            slot.set(:share, model.share)
          end
        end

        refinery
      end
    end # SetSlotShares

    # Public: Creates a new Runner.
    #
    # Returns a Runner.
    def initialize(dataset, sector = nil)
      @dataset = dataset
      @sector  = sector
    end

    # Public: Calculates the graph.
    #
    # I feel like this should be a separate class, but for the sake of
    # temporary simplicity, I'm going to put it in a method.
    #
    # Returns the calculated Graph.
    def calculate
      Refinery::Reactor.new(
        Refinery::Catalyst::Calculators,
        Refinery::Catalyst::Validation
      ).run(refinery_graph)
    end

    # Public: The Turbine::Graph which represents the structure of the graph
    # as defined in the source files.
    #
    # Returns a Turbine::Graph.
    def graph
      @graph ||= GraphBuilder.build(sector)
    end

    # Public: Returns the Refinery graph which the Runner uses to calculate
    # missing attributes.
    #
    # Returns a Turbine::Graph.
    def refinery_graph
      @refinery ||= begin
        graph.nodes.each do |node|
          calculate_rubel_attribute(node, :demand)

          node.out_edges.each do |edge|
            calculate_rubel_attribute(edge, edge.get(:model).sets)
          end
        end

        Refinery::Reactor.new(
          Refinery::Catalyst::FromTurbine,
          SetSlotShares.call(method(:query))
        ).run(graph)
      end
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
        element.set(attribute, query(model.query))
      end
    end

    def query(string)
      runtime.execute(string)
    rescue RuntimeError => ex
      ex.message.gsub!(/$/, " (executing: #{ string.inspect })")
      raise ex
    end

  end # Runner
end # ETSource
