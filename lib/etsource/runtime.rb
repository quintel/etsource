require 'rubel'

module ETSource

  class Runtime < ::Rubel::Base

    # EnergyBalance: takes a value from the EnergyBalance
    # @params[use]
    # TODO: Deal with area dependency.
    def EB(use, carrier)
      eb = EnergyBalance.new
      eb.get(use, carrier)
    end

  end

end
