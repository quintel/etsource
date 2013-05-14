module ETSource

# EnergyUnit is a lightweight container to convert one unit to the other.
#
# Example:
#   EnergyUnit.new(400, :pj).to_unit(:twh)
#   => 121
#
class EnergyUnit

  JOULES = {
    toe:  41.868 * 10**9,
    ktoe: 41.868 * 10**12,

    kwh:   3.600 * 10**6,
    twh:   3.600 * 10**15,

    mj:    1.000 * 10**9,
    tj:    1.000 * 10**12,
    pj:    1.000 * 10**15
  }

  attr_reader :unit, :value

  def initialize(value, unit)
    @value = value
    @unit  = unit
  end

  # Returns a Float for the energy value for that particular unit.
  def to_unit(unit)
    raise UnknownUnitError.new(unit) unless JOULES[unit]
    joule / JOULES[unit]
  end

  #######
  private
  #######

  # Returns the energy content in Joule.
  def joule
    JOULES[unit] * value
  end

end

end
