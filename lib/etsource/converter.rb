module ETSource

class Converter < ActiveDocument

  attr_accessor :sector,
                :use,
                :energy_balance_group,
                :has_loss,
                :in_slots,
                :out_slots,
                :availability,
                :average_effective_output_of_nominal_capacity_over_lifetime,
                :co2_free,
                :demand_expected_value,
                :electrical_efficiency_when_using_coal,
                :electrical_efficiency_when_using_wood_pellets,
                :forecasting_error,
                :full_load_hours,
                :households_supplied_per_unit,
                :land_use_per_unit,
                :part_ets,
                :part_load_efficiency_penalty,
                :part_load_operating_point,
                :variability,
                :electricity_output_capacity,
                :heat_output_capacity

  FILE_SUFFIX = 'ad'
  DIRECTORY   = 'converters'

end

end
