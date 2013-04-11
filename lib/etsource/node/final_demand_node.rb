module ETSource

  # FinalDemandNode has access to the EnergyBalance through the
  # energy_balance_query.
  class FinalDemandNode < DemandNode

    attribute :query, String

    # returns the preset demand for this node based on the outcome of the query
    # in the context of the +area_code+
    def demand(area_code)
      dataset = Dataset.find(area_code)
      Runtime.new(dataset).execute(query)
    end

    validates_presence_of(:query)

  end

end
