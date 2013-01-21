module ETSource

  # FinalDemandNode has access to the EnergyBalance through the
  # energy_balance_query.
  class FinalDemandNode < DemandNode

    attr_accessor :query

    # TODO: optimize for performance
    def preset_demand
      Runtime.new.execute(query)
    end

    validates_presence_of(:query)

  end

end
