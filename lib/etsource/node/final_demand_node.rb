module ETSource

# FinalDemandNodes have access to the EnergyBalance
class FinalDemandNode < DemandNode

  attr_accessor :energy_balance_use
  attr_accessor :energy_balance_carrier

  def energy_balance(area = :nl)
    eb = EnergyBalance.new(area)
    eb.get(energy_balance_use, energy_balance_carrier)
  end

  # -------------------------- Validations -----------------------------------

  validate :energy_balance_use,     presence: true, numericality: true
  validate :energy_balance_carrier, presence: true, numericality: true

end

end
