module ETSource

  class Node
    include ActiveDocument

    DIRECTORY = 'data/nodes'

    attribute :sector,               String
    attribute :use,                  String
    attribute :has_loss,             Boolean
    attribute :energy_balance_group, String

    attribute :in_slots,             Set[String]
    attribute :out_slots,            Set[String]

    # Numeric attributes.
    [ :availability,
      :co2_free,
      :demand_expected_value,
      :forecasting_error,
      :full_load_hours,
      :households_supplied_per_unit,
      :land_use_per_unit,
      :part_ets,
      :part_load_efficiency_penalty,
      :part_load_operating_point,
      :variability,
      :electricity_output_capacity,
      :heat_output_capacity,
      :preset_demand,
      :expected_demand,
      :average_effective_output_of_nominal_capacity_over_lifetime
    ].each do |name|
      attribute name, Float
    end

    # Deprecated: Since a few months ago, electrical efficiency arrives as
    # separate attributes from the CSVs, but is converted into a hash by the
    # xls2yml script.
    attribute :electrical_efficiency_when_using_coal, Float
    attribute :electrical_efficiency_when_using_wood_pellets, Float

  end # Node
end # ETSource
