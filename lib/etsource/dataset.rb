module ETSource
  class Dataset
    include ActiveDocument

    DIRECTORY = 'datasets'

    # General Attributes
    attribute :country,                  String
    attribute :area,                     String
    attribute :id,                       Integer
    attribute :entity,                   String
    attribute :parent_id,                Integer
    attribute :updated_at,               Time

    # Flags
    attribute :has_agriculture,          Boolean, default: true
    attribute :has_buildings,            Boolean, default: true
    attribute :has_coastline,            Boolean, default: true
    attribute :has_cold_network,         Boolean, default: false
    attribute :has_climate,              Boolean, default: true
    attribute :has_electricity_storage,  Boolean, default: true
    attribute :has_employment,           Boolean, default: true
    attribute :has_fce,                  Boolean, default: true
    attribute :has_industry,             Boolean, default: true
    attribute :has_lignite,              Boolean, default: false
    attribute :has_merit_order,          Boolean, default: true
    attribute :has_metal,                Boolean, default: true
    attribute :has_mountains,            Boolean, default: true
    attribute :has_old_technologies,     Boolean, default: false
    attribute :has_other,                Boolean, default: true
    attribute :has_solar_csp,            Boolean, default: false
    attribute :use_network_calculations, Boolean, default: true

    # Numeric Data
    [ :annual_infrastructure_cost_electricity,
      :annual_infrastructure_cost_gas,
      :areable_land,
      :available_land,
      :capacity_buffer_decentral_in_mj_s,
      :capacity_buffer_in_mj_s,
      :co2_emission_1990,
      :co2_emission_2009,
      :co2_emission_electricity_1990,
      :co2_percentage_free,
      :coast_line,
      :current_electricity_demand_in_mj,
      :economic_multiplier,
      :el_export_capacity,
      :employment_fraction_production,
      :employment_local_fraction,
      :export_electricity_primary_demand_factor,
      :heat_recovery,
      :import_electricity_primary_demand_factor,
      :insulation_level_existing_houses,
      :insulation_level_new_houses,
      :insulation_level_buildings,
      :km_per_car,
      :km_per_truck,
      :land_available_for_solar,
      :market_share_daylight_control,
      :market_share_motion_detection,
      :number_households,
      :number_inhabitants,
      :offshore_suitable_for_wind,
      :onshore_suitable_for_wind,
      :percentage_of_new_houses,
      :recirculation,
      :roof_surface_available_pv,
      :roof_surface_available_pv_buildings,
      :ventilation_rate,
      :number_of_existing_households
    ].each do |name|
      attribute name, Float
    end

    # Returns the Energy Balance for this area/dataset.
    def energy_balance
      @energy_balance ||= EnergyBalance.find(area)
    end

    # Public: Retrieves the ShareData for the file whose name matches +key+.
    #
    # key - The name of the shares file to load.
    #
    # Returns a ShareData.
    def shares(key)
      key = key.to_sym

      @shares      ||= Hash.new
      @shares[key] ||= ShareData.new(self, key)
    end

    # Public: Path to the directory in which the dataset specific data is
    # stored.
    #
    # Returns a Pathname.
    def path
      ETSource.data_dir.join(DIRECTORY).join(key.to_s)
    end

  end # Dataset
end # ETSource
