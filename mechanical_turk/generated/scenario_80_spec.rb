require 'spec_helper'

describe "untitled" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2030, use_fce: false) do
      move_slider 198, -45.0       # policy_sustainability_co2_emissions
      move_slider 335, 0.0       # households_number_of_inhabitants
      move_slider 372, 0.0       # households_heat_demand_per_person
      move_slider 204, 0.1       # households_cooling_demand_per_person
      move_slider 1, 0.5       # households_replacement_of_existing_houses
      move_slider 336, 1.5       # households_insulation_level_old_houses
      move_slider 337, 6.0       # households_insulation_level_new_houses
      move_slider 333, 2.0       # households_heating_gas_combi_heater_share
      move_slider 582, 10.0       # households_heating_district_heating_network_share
      move_slider 338, 20.0       # households_heating_heat_pump_ground_share
      move_slider 51, 20.0       # households_heating_micro_chp_share
      move_slider 48, 15.0       # households_heating_solar_thermal_panels_share
      move_slider 52, 0.0       # households_heating_electric_heater_share
      move_slider 339, 20.0       # households_heating_heat_pump_add_on_share
      move_slider 366, 20.0       # households_behavior_standby_killer_turn_off_appliances
      move_slider 368, 20.0       # households_behavior_turn_off_the_light
      move_slider 370, 10.0       # households_behavior_close_windows_turn_off_heating
      move_slider 371, 10.0       # households_efficiency_low_temperature_washing
      move_slider 245, 0.0       # households_lighting_incandescent_share
      move_slider 44, 69.4       # households_lighting_light_emitting_diode_share
      move_slider 43, 30.6       # households_lighting_low_energy_light_bulb_share
      move_slider 359, 70.0       # households_efficiency_dish_washer
      move_slider 6, 70.0       # households_efficiency_fridge_freezer
      move_slider 361, 70.0       # households_efficiency_washing_machine
      move_slider 362, 70.0       # households_efficiency_dryer
      move_slider 363, 70.0       # households_efficiency_television
      move_slider 364, 70.0       # households_efficiency_computer_media
      move_slider 360, 70.0       # households_efficiency_vacuum_cleaner
      move_slider 412, 70.0       # households_efficiency_other
      move_slider 143, 5.0       # transport_trains
      move_slider 141, 0.0       # transport_cars
      move_slider 145, 2.0       # transport_inland_navigation
      move_slider 142, 0.0       # transport_trucks
      move_slider 146, 80.0       # transport_cars_electric_share
      move_slider 147, 0.0       # transport_cars_diesel_share
      move_slider 148, 5.4       # transport_cars_gasoline_share
      move_slider 239, 10.0       # transport_cars_compressed_gas_share
      move_slider 159, 40.0       # transport_trucks_electric_share
      move_slider 158, 50.0       # transport_trucks_diesel_share
      move_slider 240, 10.0       # transport_trucks_compressed_gas_share
      move_slider 428, 0.0       # transport_trains_diesel_share
      move_slider 429, 100.0       # transport_trains_electric_share
      move_slider 241, 3.0       # transport_efficiency_trains
      move_slider 187, 1.0       # transport_efficiency_ships
      move_slider 186, 2.0       # transport_efficiency_combustion_engine_cars
      move_slider 171, 2.0       # transport_efficiency_electric_vehicles
      move_slider 213, 1.0       # industry_electricity_demand
      move_slider 214, 1.0       # industry_heat_demand
      move_slider 205, -2.0       # industry_non_energetic_oil_demand
      move_slider 169, 3.0       # industry_efficiency_electricity
      move_slider 170, 3.0       # industry_heat_from_fuels
      move_slider 216, 0.0       # industry_heating_gas_fired_heater_share
      move_slider 219, 30.0       # industry_heating_biomass_fired_heater_share
      move_slider 217, 0.0       # industry_heating_oil_fired_heater_share
      move_slider 326, 70.0       # industry_heating_combined_heat_power_share
      move_slider 218, 0.0       # industry_heating_coal_fired_heater_share
      move_slider 324, 24.1       # industry_number_of_biomass_chp
      move_slider 322, 170.8       # industry_number_of_gas_chp
      move_slider 220, -1.0       # agriculture_electricity_demand
      move_slider 221, -1.0       # agriculture_heat_demand
      move_slider 246, 0.0       # agriculture_heating_gas_fired_heater_share
      move_slider 223, 0.0       # agriculture_heating_oil_fired_heater_share
      move_slider 228, 60.0       # agriculture_heating_geothermal_share
      move_slider 225, 0.0       # agriculture_heating_biomass_fired_heater_share
      move_slider 227, 0.0       # agriculture_heating_heat_pump_with_ts_share
      move_slider 327, 40.0       # agriculture_heating_combined_heat_power_share
      move_slider 230, -1.0       # other_heat_demand
      move_slider 381, 2.0       # buildings_insulation_level
      move_slider 382, 3.0       # not found
      move_slider 383, 50.0       # buildings_heating_gas_fired_heater_share
      move_slider 389, 13.0       # buildings_heating_solar_thermal_panels_share
      move_slider 388, 15.0       # buildings_heating_heat_network_share
      move_slider 387, 0.0       # buildings_heating_electric_heater_share
      move_slider 394, 10.2       # buildings_heating_heat_pump_with_ts_share
      move_slider 392, 28.7       # buildings_cooling_heat_pump_with_ts_share
      move_slider 393, 44.4       # buildings_cooling_airconditioning_share
      move_slider 391, 26.9       # buildings_cooling_gas_fired_heat_pump_share
      move_slider 400, 52.8       # buildings_lighting_fluorescent_tube_conventional_share
      move_slider 401, 0.0       # buildings_lighting_fluorescent_tube_high_performance_share
      move_slider 402, 47.2       # buildings_lighting_led_tube_share
      move_slider 208, 47.0       # policy_cost_total_energy_cost
      move_slider 185, 5.0       # costs_uranium
      move_slider 11, 200.0       # costs_oil
      move_slider 57, 100.0       # costs_coal
      move_slider 58, 150.0       # costs_gas
      move_slider 59, 100.0       # costs_biomass
      move_slider 137, 500.0       # costs_co2
      move_slider 138, 0.0       # costs_co2_free_allocation
      move_slider 247, -20.0       # investment_costs_earth_geothermal_electricity
      move_slider 133, -50.0       # investment_costs_solar_solar_panels
      move_slider 114, -15.0       # investment_costs_water_river
      move_slider 12, -20.0       # investment_costs_wind_onshore
      move_slider 14, -35.0       # investment_costs_wind_offshore
      move_slider 136, 25.0       # investment_costs_nuclear_nuclear_plant
      move_slider 405, 60.0       # buildings_market_penetration_solar_panels
      move_slider 47, 65.0       # households_market_penetration_solar_panels
      move_slider 250, 0.0       # number_of_pulverized_coal
      move_slider 253, 0.0       # number_of_coal_iggc
      move_slider 551, 0.0       # number_of_central_coal_chp
      move_slider 259, 0.0       # number_of_nuclear_3rd_gen
      move_slider 261, 0.0       # number_of_co_firing_coal
      move_slider 263, 2500.0       # number_of_wind_onshore_land
      move_slider 264, 800.0       # number_of_wind_onshore_coast
      move_slider 265, 3000.0       # number_of_wind_offshore
      move_slider 266, 5.0       # number_of_hydro_river
      move_slider 270, 3.0       # number_of_geothermal_electric
      move_slider 298, 2.0       # number_of_solar_pv_plants
      move_slider 271, 5.0       # number_of_waste_incinerator
      move_slider 431, 3.0       # number_of_biomass_fired_heater_district
      move_slider 292, 100.0       # transport_diesel_share
      move_slider 293, 0.0       # transport_biodiesel_share
      move_slider 294, 100.0       # transport_gasoline_share
      move_slider 295, 0.0       # transport_bio_ethanol_share
      move_slider 423, 95.0       # transport_planes_fossil_fuel_share
      move_slider 424, 5.0       # transport_planes_bio_ethanol_share
      move_slider 425, 70.0       # transport_ships_diesel_share
      move_slider 426, 30.0       # transport_ships_bio_diesel_share
      move_slider 489, 98.0       # natural_gas_total_share
      move_slider 488, 2.0       # green_gas_total_share
      move_slider 561, 100.0       # electricity_natural_gas_share
      move_slider 581, 0.0       # electricity_oil_share_in_gas_production
      move_slider 256, 0.0       # number_of_gas_conventional
      move_slider 257, 0.0       # number_of_gas_ccgt
      move_slider 276, 2.0       # number_of_large_gas_chp
      move_slider 203, 2.0       # households_electricity_demand_per_person
      move_slider 234, 36.3       # policy_sustainability_renewable_percentage
      move_slider 446, 42.9       # households_hot_water_gas_fired_heater_share
      move_slider 420, 20.0       # households_hot_water_heat_pump_ground_share
      move_slider 445, 20.0       # households_hot_water_micro_chp_share
      move_slider 421, 10.0       # households_hot_water_heat_network_share
      move_slider 346, 0.0       # households_hot_water_gas_water_heater_share
      move_slider 348, 50.0       # households_hot_water_solar_water_heater_share
      move_slider 344, 20.0       # households_heating_geothermal_share
      move_slider 341, 80.0       # households_heating_heat_network_share
      move_slider 325, 3023.5810810810817       # agriculture_number_of_small_gas_chp
    end
  end

  after :all do
    print_comparison('localhost') if ENV["LOCALHOST"]
    print_comparison('beta') if ENV["BETA"]
  end

  describe "gqueries" do
      
    it "dashboard_bio_footprint" do
      the_present.should be_within(0.281, some_tolerance)
      the_future.should  be_within(0.771, some_tolerance)
      the_relative_increase.should be_within(174.3, some_tolerance)
      the_absolute_increase.should be_within(0.5, some_tolerance)
    end
      
    it "dashboard_employment" do
      the_present.should be_within(28439.961, some_tolerance)
      the_future.should  be_within(61572.508, some_tolerance)
      the_relative_increase.should be_within(116.5, some_tolerance)
      the_absolute_increase.should be_within(33132.5, some_tolerance)
    end
      
    it "dashboard_energy_demand_primary_of_final" do
      the_present.should be_within(3459160381069.281, some_tolerance)
      the_future.should  be_within(2028602448876.474, some_tolerance)
      the_relative_increase.should be_within(-41.4, some_tolerance)
      the_absolute_increase.should be_within(-1430557932192.8, some_tolerance)
    end
      
    it "dashboard_energy_import_netto" do
      the_present.should be_within(0.293, some_tolerance)
      the_future.should  be_within(0.545, some_tolerance)
      the_relative_increase.should be_within(85.7, some_tolerance)
      the_absolute_increase.should be_within(0.3, some_tolerance)
    end
      
    it "dashboard_reduction_of_co2_emissions_versus_1990" do
      the_present.should be_within(0.089, some_tolerance)
      the_future.should  be_within(-0.601, some_tolerance)
      the_relative_increase.should be_within(-776.9, some_tolerance)
      the_absolute_increase.should be_within(-0.7, some_tolerance)
    end
      
    it "dashboard_renewability" do
      the_present.should be_within(0.031, some_tolerance)
      the_future.should  be_within(0.356, some_tolerance)
      the_relative_increase.should be_within(1063.9, some_tolerance)
      the_absolute_increase.should be_within(0.3, some_tolerance)
    end
      
    it "dashboard_security_of_supply" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.681, some_tolerance)
      the_relative_increase.should be_within(224812570.0, some_tolerance)
      the_absolute_increase.should be_within(0.7, some_tolerance)
    end
      
    it "dashboard_share_of_renewable_electricity" do
      the_present.should be_within(0.093, some_tolerance)
      the_future.should  be_within(0.865, some_tolerance)
      the_relative_increase.should be_within(827.3, some_tolerance)
      the_absolute_increase.should be_within(0.8, some_tolerance)
    end
      
    it "dashboard_total_costs" do
      the_present.should be_within(42.855, some_tolerance)
      the_future.should  be_within(52.452, some_tolerance)
      the_relative_increase.should be_within(22.4, some_tolerance)
      the_absolute_increase.should be_within(9.6, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_agriculture" do
      the_present.should be_within(1867394895.285, some_tolerance)
      the_future.should  be_within(1577808570.202, some_tolerance)
      the_relative_increase.should be_within(-15.5, some_tolerance)
      the_absolute_increase.should be_within(-289586325.1, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_buildings" do
      the_present.should be_within(4733155777.388, some_tolerance)
      the_future.should  be_within(6687426461.649, some_tolerance)
      the_relative_increase.should be_within(41.3, some_tolerance)
      the_absolute_increase.should be_within(1954270684.3, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_households" do
      the_present.should be_within(6890174832.378, some_tolerance)
      the_future.should  be_within(7066339148.801, some_tolerance)
      the_relative_increase.should be_within(2.6, some_tolerance)
      the_absolute_increase.should be_within(176164316.4, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_industry_and_energy" do
      the_present.should be_within(20935307495.242, some_tolerance)
      the_future.should  be_within(28762567006.635, some_tolerance)
      the_relative_increase.should be_within(37.4, some_tolerance)
      the_absolute_increase.should be_within(7827259511.4, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_other" do
      the_present.should be_within(1278707737.206, some_tolerance)
      the_future.should  be_within(2088386386.764, some_tolerance)
      the_relative_increase.should be_within(63.3, some_tolerance)
      the_absolute_increase.should be_within(809678649.6, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_transport" do
      the_present.should be_within(7150305916.942, some_tolerance)
      the_future.should  be_within(6269346108.811, some_tolerance)
      the_relative_increase.should be_within(-12.3, some_tolerance)
      the_absolute_increase.should be_within(-880959808.1, some_tolerance)
    end
      
    it "dashboard_total_costs_per_household" do
      the_present.should be_within(5831.015, some_tolerance)
      the_future.should  be_within(7136.795, some_tolerance)
      the_relative_increase.should be_within(22.4, some_tolerance)
      the_absolute_increase.should be_within(1305.8, some_tolerance)
    end
      
    it "turk_number_of_households" do
      the_present.should be_within(nil, some_tolerance)
      the_future.should  be_within(nil, some_tolerance)
      the_relative_increase.should be_within(nil, some_tolerance)
      the_absolute_increase.should be_within(nil, some_tolerance)
    end
      
    it "turk_number_of_households_space_heater_coal" do
      the_present.should be_within(4524.173, some_tolerance)
      the_future.should  be_within(4524.173, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "turk_number_of_households_space_heater_collective_heatpump_water_water_ts_electricity" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "turk_number_of_households_space_heater_combined_network_gas" do
      the_present.should be_within(6036756.75, some_tolerance)
      the_future.should  be_within(2720315.082, some_tolerance)
      the_relative_increase.should be_within(-54.9, some_tolerance)
      the_absolute_increase.should be_within(-3316441.7, some_tolerance)
    end
      
    it "turk_number_of_households_space_heater_crude_oil" do
      the_present.should be_within(91331.746, some_tolerance)
      the_future.should  be_within(91331.746, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "turk_number_of_households_space_heater_district_heating_steam_hot_water" do
      the_present.should be_within(100503.531, some_tolerance)
      the_future.should  be_within(182943.317, some_tolerance)
      the_relative_increase.should be_within(82.0, some_tolerance)
      the_absolute_increase.should be_within(82439.8, some_tolerance)
    end
      
    it "turk_number_of_households_space_heater_electricity" do
      the_present.should be_within(129349.292, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-129349.3, some_tolerance)
    end
      
    it "turk_number_of_households_space_heater_heatpump_air_water_network_gas" do
      the_present.should be_within(1.475, some_tolerance)
      the_future.should  be_within(1.475, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "turk_number_of_households_space_heater_heatpump_ground_water_electricity" do
      the_present.should be_within(5504.225, some_tolerance)
      the_future.should  be_within(1469900.0, some_tolerance)
      the_relative_increase.should be_within(26604.9, some_tolerance)
      the_absolute_increase.should be_within(1464395.8, some_tolerance)
    end
      
    it "turk_number_of_households_space_heater_micro_chp_network_gas" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "turk_number_of_households_space_heater_network_gas" do
      the_present.should be_within(nil, some_tolerance)
      the_future.should  be_within(nil, some_tolerance)
      the_relative_increase.should be_within(nil, some_tolerance)
      the_absolute_increase.should be_within(nil, some_tolerance)
    end
      
    it "turk_number_of_households_space_heater_wood_pellets" do
      the_present.should be_within(nil, some_tolerance)
      the_future.should  be_within(nil, some_tolerance)
      the_relative_increase.should be_within(nil, some_tolerance)
      the_absolute_increase.should be_within(nil, some_tolerance)
    end
  end
end