module ETSource

# FinalDemandNodes have access to the EnergyBalance
class FinalDemandNode < DemandNode

  attr_accessor :energy_balance_use
  attr_accessor :energy_balance_carrier

  def energy_balance
    eb = EnergyBalance.new # TODO: This has to be optimized
    eb.get(energy_balance_use, energy_balance_carrier)
  end

  # validations

  validate :energy_balance_use,     presence: true, numericality: true
  validate :energy_balance_carrier, presence: true, numericality: true
end

end
