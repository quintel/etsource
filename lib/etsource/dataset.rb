module ETSource
  class Dataset < ActiveDocument

    DIRECTORY = 'data/datasets'

    attr_accessor :annual_infrastructure_cost_electricity,
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
                  :country,
                  :current_electricity_demand_in_mj,
                  :economic_multiplier,
                  :el_export_capacity,
                  :employment_fraction_production,
                  :employment_local_fraction,
                  :entity,
                  :export_electricity_primary_demand_factor,
                  :has_agriculture,
                  :has_buildings,
                  :has_coastline,
                  :has_cold_network,
                  :has_climate,
                  :has_employment,
                  :has_fce,
                  :has_industry,
                  :has_lignite,
                  :has_merit_order,
                  :has_metal,
                  :has_mountains,
                  :has_old_technologies,
                  :has_other,
                  :has_solar_csp,
                  :heat_recovery,
                  :id,
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
                  :parent_id,
                  :percentage_of_new_houses,
                  :recirculation,
                  :roof_surface_available_pv,
                  :roof_surface_available_pv_buildings,
                  :updated_at,
                  :use_network_calculations,
                  :ventilation_rate,
                  :area,
                  :number_of_existing_households

    # Returns the Energy Balance for this area/dataset.
    def energy_balance
      @energy_balance ||= EnergyBalance.find(area)
    end

  end
end
