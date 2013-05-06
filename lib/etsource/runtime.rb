require 'rubel'

module ETSource
  class Runtime < ::Rubel::Base

    attr_reader :dataset

    # Creates a new runtime in the +context+ of a dataset.
    def initialize(dataset, graph)
      @dataset = dataset
      @graph   = graph
      super()
    end

    def energy_balance
      dataset.energy_balance
    end

    # ------------------ QUERY FUNCTIONS -------------------------------------

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

  end # Runtime
end # ETSource
