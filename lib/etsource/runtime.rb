require 'rubel'

module ETSource

  class Runtime < ::Rubel::Base

    attr_reader :dataset

    def initialize(dataset)
      @dataset = dataset
      super()
    end

    def energy_balance
      @energy_balance ||= EnergyBalance.find(dataset.key)
    end

    # EnergyBalance: takes a value from the EnergyBalance for the
    # current dataset
    def EB(use, carrier)
      energy_balance.get(use, carrier)
    end

  end

end
