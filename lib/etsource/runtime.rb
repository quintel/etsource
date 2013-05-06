module ETSource
  class Runtime < ::Rubel::Base
    attr_reader :dataset

    # Creates a new runtime in the +context+ of a dataset.
    def initialize(dataset, graph)
      @dataset = dataset
      @graph   = graph
      super()
    end

    # Public: Executes a query. This is idential to Rubel's +execute+ method
    # except that we remove the "rescue" block since it unnecessarily catches
    # and re-raises errors with the generic RuntimeError and truncates
    # backtraces.
    #
    # Returns the result of the query.
    def execute(query)
      if query.is_a?(::String)
        query = sanitized_proc(query)
      end

      instance_exec(&query)
    end

    alias query execute

    # Query Functions --------------------------------------------------------

    # takes a value from the EnergyBalance for the current Dataset.
    def EB(use, carrier)
      energy_balance.get(use, carrier)
    end

    # Gets a property from the current Area.
    def AREA(property)
      dataset.send(property)
    end

    # Public: Retrieves a share value identified by the given key.
    #
    # file_key  - The name of the file in which to find the share value, minus
    #             the ".csv" extension.
    # attribute - The name of the attribute to be extracted from the share
    #             file.
    #
    # For example, retrieving the gasoline share from trucks.csv.
    #
    #   SHARE(:trucks, :gasoline)
    #
    # Returns a Numeric, or raises NoSuchShareError if the file or attribute
    # do not exist.
    def SHARE(file_key, attribute)
      dataset.shares(file_key).get(attribute)
    end

    # Public: Given keys to look up a node or edge, retrieves the demand
    # attribute of the object.
    #
    # *keys - Keys used to identify the node or edge.
    #
    # Returns a numeric.
    def DEMAND(*keys)
      lookup(*keys).get(:demand)
    end

    #######
    private
    #######

    # Helpers ----------------------------------------------------------------

    # Internal: The EnergyBalance data for the datasets region.
    #
    # Returns an EnergyBalance.
    def energy_balance
      dataset.energy_balance
    end

    # Internal: Retrieves a Node by it's key, or an edge by the key of the
    # parent node, child node, and carrier.
    #
    # keys* - One or more keys.
    #
    # Returns the Turbine::Node or Turbine::Edge. Raises
    def lookup(*keys)
      keys = keys.map(&:to_sym)

      if keys.one?
        # A single key looks up a node by its key.
        @graph.node(keys.first) || raise(UnknownNodeError.new(keys.first))
      elsif keys.length == 3
        # Three keys looks up an edge by its parent and child node keys, and
        # the name of the carrier.

        # Assert that both nodes exist.
        parent = lookup(keys[0])
        child  = lookup(keys[1])

        parent.out_edges(keys.last).detect do |edge|
          edge.to.key == keys[1]
        end || raise(UnknownEdgeError.new(keys))
      else
        # Any other number of keys is invalid.
        raise InvalidLookupError.new(keys)
      end
    end

  end # Runtime
end # ETSource
