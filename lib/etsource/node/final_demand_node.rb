module ETSource

  # FinalDemandNode has access to the EnergyBalance through the
  # energy_balance_query.
  class FinalDemandNode < DemandNode

    attr_accessor :query

    # returns the preset demand for this node based on the outcome of the query
    # in the context of the +dataset+
    def preset_demand(dataset)
      Runtime.new(dataset).execute(query)
    end

    validates_presence_of(:query)

  end

end
