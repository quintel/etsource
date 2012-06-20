require 'spec_helper'

describe "untitled" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2030, use_fce: false) do
      move_slider 198, -53.5       # policy_sustainability_co2_emissions
      move_slider 335, 1.5       # households_number_of_inhabitants
      move_slider 203, 1.5       # households_electricity_demand_per_person
      move_slider 336, 2.0       # households_insulation_level_old_houses
      move_slider 337, 3.5       # households_insulation_level_new_houses
      move_slider 333, 0.0       # households_heating_gas_combi_heater_share
      move_slider 48, 15.0       # households_heating_solar_thermal_panels_share
      move_slider 375, 29.6       # households_heating_heat_pump_with_ts_share
      move_slider 339, 0.6       # households_heating_heat_pump_add_on_share
      move_slider 338, 39.8       # households_heating_heat_pump_ground_share
      move_slider 582, 0.2       # households_heating_district_heating_network_share
      move_slider 446, 5.3       # households_hot_water_gas_fired_heater_share
      move_slider 421, 15.7       # households_hot_water_heat_network_share
      move_slider 420, 48.1       # households_hot_water_heat_pump_ground_share
      move_slider 348, 40.7       # households_hot_water_solar_water_heater_share
      move_slider 444, 10.2       # households_hot_water_biomass_heater_share
      move_slider 344, 33.3       # households_heating_geothermal_share
      move_slider 341, 66.7       # households_heating_heat_network_share
      move_slider 351, 67.6       # households_cooling_heat_pump_ground_share
      move_slider 353, 32.4       # households_cooling_airconditioning_share
      move_slider 354, 8.4       # households_cooking_gas_share
      move_slider 357, 67.6       # households_cooking_induction_share
      move_slider 361, 39.3       # households_efficiency_washing_machine
      move_slider 359, 42.6       # households_efficiency_dish_washer
      move_slider 6, 50.7       # households_efficiency_fridge_freezer
      move_slider 362, 53.7       # households_efficiency_dryer
      move_slider 363, 54.1       # households_efficiency_television
      move_slider 364, 53.1       # households_efficiency_computer_media
      move_slider 360, 54.1       # households_efficiency_vacuum_cleaner
      move_slider 412, 55.0       # households_efficiency_other
      move_slider 245, 0.0       # households_lighting_incandescent_share
      move_slider 43, 0.0       # households_lighting_low_energy_light_bulb_share
      move_slider 44, 100.0       # households_lighting_light_emitting_diode_share
      move_slider 366, 31.5       # households_behavior_standby_killer_turn_off_appliances
      move_slider 368, 31.5       # households_behavior_turn_off_the_light
      move_slider 370, 31.5       # households_behavior_close_windows_turn_off_heating
      move_slider 371, 33.3       # households_efficiency_low_temperature_washing
      move_slider 47, 79.6       # households_market_penetration_solar_panels
      move_slider 374, 0.0       # households_cooling_heat_pump_with_ts_share
      move_slider 352, 0.0       # households_cooling_gas_fired_heat_pump_share
      move_slider 377, 1.0       # buildings_electricity_per_student_employee
      move_slider 381, 2.5       # buildings_insulation_level
      move_slider 382, 3.4       # not found
      move_slider 383, 0.0       # buildings_heating_gas_fired_heater_share
      move_slider 394, 75.0       # buildings_heating_heat_pump_with_ts_share
      move_slider 390, 0.0       # buildings_heating_gas_fired_heat_pump_share
      move_slider 387, 0.0       # buildings_heating_electric_heater_share
      move_slider 389, 13.0       # buildings_heating_solar_thermal_panels_share
      move_slider 409, 0.0       # buildings_heating_oil_fired_heater_share
      move_slider 386, 0.0       # buildings_heating_small_gas_chp_share
      move_slider 388, 12.0       # buildings_heating_heat_network_share
      move_slider 392, 75.0       # buildings_cooling_heat_pump_with_ts_share
      move_slider 393, 25.0       # buildings_cooling_airconditioning_share
      move_slider 397, 40.7       # buildings_waste_heat_recovery
      move_slider 398, 2.5       # buildings_appliances_efficiency
      move_slider 400, 0.0       # buildings_lighting_fluorescent_tube_conventional_share
      move_slider 401, 0.0       # buildings_lighting_fluorescent_tube_high_performance_share
      move_slider 402, 100.0       # buildings_lighting_led_tube_share
      move_slider 403, 40.7       # buildings_lighting_motion_detection
      move_slider 404, 39.8       # buildings_lighting_daylight_dependent_control
      move_slider 405, 83.3       # buildings_market_penetration_solar_panels
      move_slider 146, 45.4       # transport_cars_electric_share
      move_slider 147, 18.5       # transport_cars_diesel_share
      move_slider 159, 34.3       # transport_trucks_electric_share
      move_slider 158, 44.1       # transport_trucks_diesel_share
      move_slider 240, 21.6       # transport_trucks_compressed_gas_share
      move_slider 171, 2.0       # transport_efficiency_electric_vehicles
      move_slider 328, 2.0       # transport_efficiency_combustion_engine_trucks
      move_slider 186, 2.0       # transport_efficiency_combustion_engine_cars
      move_slider 188, 2.0       # transport_efficiency_airplanes
      move_slider 187, 2.0       # transport_efficiency_ships
      move_slider 241, 2.0       # transport_efficiency_trains
      move_slider 213, 1.0       # industry_electricity_demand
      move_slider 205, -1.0       # industry_non_energetic_oil_demand
      move_slider 202, -1.0       # industry_non_energetic_other_demand
      move_slider 169, 1.5       # industry_efficiency_electricity
      move_slider 170, 1.5       # industry_heat_from_fuels
      move_slider 216, 0.0       # industry_heating_gas_fired_heater_share
      move_slider 219, 56.0       # industry_heating_biomass_fired_heater_share
      move_slider 217, 0.0       # industry_heating_oil_fired_heater_share
      move_slider 218, 0.0       # industry_heating_coal_fired_heater_share
      move_slider 326, 44.0       # industry_heating_combined_heat_power_share
      move_slider 324, 213.2       # industry_number_of_biomass_chp
      move_slider 208, 34.0       # policy_cost_total_energy_cost
      move_slider 11, 65.0       # costs_oil
      move_slider 58, 65.0       # costs_gas
      move_slider 57, 65.0       # costs_coal
      move_slider 59, 65.0       # costs_biomass
      move_slider 18, 10.0       # investment_costs_combustion_coal_plant
      move_slider 19, 10.0       # investment_costs_combustion_biomass_plant
      move_slider 231, 10.0       # investment_costs_combustion_waste_incinerator
      move_slider 16, 10.0       # investment_costs_combustion_gas_plant
      move_slider 137, 650.0       # costs_co2
      move_slider 138, 33.0       # costs_co2_free_allocation
      move_slider 121, 22.0       # om_costs_nuclear_nuclear_plant
      move_slider 14, -40.0       # investment_costs_wind_offshore
      move_slider 12, -5.0       # investment_costs_wind_onshore
      move_slider 133, -50.0       # investment_costs_solar_solar_panels
      move_slider 246, 0.0       # agriculture_heating_gas_fired_heater_share
      move_slider 223, 0.0       # agriculture_heating_oil_fired_heater_share
      move_slider 225, 0.0       # agriculture_heating_biomass_fired_heater_share
      move_slider 227, 0.0       # agriculture_heating_heat_pump_with_ts_share
      move_slider 228, 50.9       # agriculture_heating_geothermal_share
      move_slider 327, 49.1       # agriculture_heating_combined_heat_power_share
      move_slider 423, 75.0       # transport_planes_fossil_fuel_share
      move_slider 424, 25.0       # transport_planes_bio_ethanol_share
      move_slider 425, 0.0       # transport_ships_diesel_share
      move_slider 426, 100.0       # transport_ships_bio_diesel_share
      move_slider 265, 5093.1       # number_of_wind_offshore
      move_slider 263, 800.0       # number_of_wind_onshore_land
      move_slider 1, 0.7       # households_replacement_of_existing_houses
      move_slider 180, 5.0       # om_costs_combustion_gas_plant
      move_slider 181, 5.0       # om_costs_combustion_oil_plant
      move_slider 182, 5.0       # om_costs_combustion_coal_plant
      move_slider 183, 5.0       # om_costs_combustion_biomass_plant
      move_slider 232, 5.0       # om_costs_combustion_waste_incinerator
      move_slider 234, 40.5       # policy_sustainability_renewable_percentage
      move_slider 250, 1.5       # number_of_pulverized_coal
      move_slider 259, 0.0       # number_of_nuclear_3rd_gen
      move_slider 292, 75.0       # transport_diesel_share
      move_slider 293, 25.0       # transport_biodiesel_share
      move_slider 322, 0.0       # industry_number_of_gas_chp
      move_slider 148, 18.5       # transport_cars_gasoline_share
      move_slider 238, 17.6       # transport_cars_lpg_share
      move_slider 239, 0.0       # transport_cars_compressed_gas_share
    end
  end

  after :all do
    print_comparison('localhost') if ENV["LOCALHOST"]
    print_comparison('beta') if ENV["BETA"]
  end

  describe "gqueries" do
      
    it "dashboard_bio_footprint" do
      the_present.should be_within(0.224, some_tolerance)
      the_future.should  be_within(3.332, some_tolerance)
      the_relative_increase.should be_within(1384.3, some_tolerance)
      the_absolute_increase.should be_within(3.1, some_tolerance)
    end


      
    it "dashboard_employment" do
      the_present.should be_within(29409.913, some_tolerance)
      the_future.should  be_within(134619.153, some_tolerance)
      the_relative_increase.should be_within(357.7, some_tolerance)
      the_absolute_increase.should be_within(105209.2, some_tolerance)
    end


      
    it "dashboard_energy_demand_primary_of_final" do
      the_present.should be_within(3461730879704.038, some_tolerance)
      the_future.should  be_within(2462707337617.602, some_tolerance)
      the_relative_increase.should be_within(-28.9, some_tolerance)
      the_absolute_increase.should be_within(-999023542086.4, some_tolerance)
    end


      
    it "dashboard_energy_import_netto" do
      the_present.should be_within(0.294, some_tolerance)
      the_future.should  be_within(0.629, some_tolerance)
      the_relative_increase.should be_within(113.9, some_tolerance)
      the_absolute_increase.should be_within(0.3, some_tolerance)
    end


      
    it "dashboard_reduction_of_co2_emissions_versus_1990" do
      the_present.should be_within(0.084, some_tolerance)
      the_future.should  be_within(-0.719, some_tolerance)
      the_relative_increase.should be_within(-952.0, some_tolerance)
      the_absolute_increase.should be_within(-0.8, some_tolerance)
    end


      
    it "dashboard_renewability" do
      the_present.should be_within(0.033, some_tolerance)
      the_future.should  be_within(0.662, some_tolerance)
      the_relative_increase.should be_within(1932.0, some_tolerance)
      the_absolute_increase.should be_within(0.6, some_tolerance)
    end


      
    it "dashboard_security_of_supply" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "dashboard_share_of_renewable_electricity" do
      the_present.should be_within(0.098, some_tolerance)
      the_future.should  be_within(1.247, some_tolerance)
      the_relative_increase.should be_within(1175.4, some_tolerance)
      the_absolute_increase.should be_within(1.1, some_tolerance)
    end


      
    it "dashboard_total_costs" do
      the_present.should be_within(48.437, some_tolerance)
      the_future.should  be_within(55.203, some_tolerance)
      the_relative_increase.should be_within(14.0, some_tolerance)
      the_absolute_increase.should be_within(6.8, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_agriculture" do
      the_present.should be_within(2109325263.244, some_tolerance)
      the_future.should  be_within(2054868807.496, some_tolerance)
      the_relative_increase.should be_within(-2.6, some_tolerance)
      the_absolute_increase.should be_within(-54456455.7, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_buildings" do
      the_present.should be_within(5346359830.651, some_tolerance)
      the_future.should  be_within(3248705710.964, some_tolerance)
      the_relative_increase.should be_within(-39.2, some_tolerance)
      the_absolute_increase.should be_within(-2097654119.7, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_households" do
      the_present.should be_within(7813038899.502, some_tolerance)
      the_future.should  be_within(5735945474.25, some_tolerance)
      the_relative_increase.should be_within(-26.6, some_tolerance)
      the_absolute_increase.should be_within(-2077093425.3, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_industry_and_energy" do
      the_present.should be_within(23647581507.799, some_tolerance)
      the_future.should  be_within(33764115274.375, some_tolerance)
      the_relative_increase.should be_within(42.8, some_tolerance)
      the_absolute_increase.should be_within(10116533766.6, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_other" do
      the_present.should be_within(1444370733.371, some_tolerance)
      the_future.should  be_within(2390314270.246, some_tolerance)
      the_relative_increase.should be_within(65.5, some_tolerance)
      the_absolute_increase.should be_within(945943536.9, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_transport" do
      the_present.should be_within(8076663885.401, some_tolerance)
      the_future.should  be_within(8009428248.709, some_tolerance)
      the_relative_increase.should be_within(-0.8, some_tolerance)
      the_absolute_increase.should be_within(-67235636.7, some_tolerance)
    end


      
    it "dashboard_total_costs_per_household" do
      the_present.should be_within(6590.563, some_tolerance)
      the_future.should  be_within(7511.175, some_tolerance)
      the_relative_increase.should be_within(14.0, some_tolerance)
      the_absolute_increase.should be_within(920.6, some_tolerance)
    end


      
    it "turk_number_of_households" do
      the_present.should be_within(7349500.0, some_tolerance)
      the_future.should  be_within(7349500.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_coal" do
      the_present.should be_within(4525.868, some_tolerance)
      the_future.should  be_within(4525.868, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_collective_heatpump_water_water_ts_electricity" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(6999.524, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(6999.5, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_combined_network_gas" do
      the_present.should be_within(6036264.993, some_tolerance)
      the_future.should  be_within(1150057.801, some_tolerance)
      the_relative_increase.should be_within(-80.9, some_tolerance)
      the_absolute_increase.should be_within(-4886207.2, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_crude_oil" do
      the_present.should be_within(91365.959, some_tolerance)
      the_future.should  be_within(91365.959, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_district_heating_steam_hot_water" do
      the_present.should be_within(100978.019, some_tolerance)
      the_future.should  be_within(3696.003, some_tolerance)
      the_relative_increase.should be_within(-96.3, some_tolerance)
      the_absolute_increase.should be_within(-97282.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_electricity" do
      the_present.should be_within(129397.747, some_tolerance)
      the_future.should  be_within(129397.747, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_heatpump_air_water_network_gas" do
      the_present.should be_within(0.712, some_tolerance)
      the_future.should  be_within(0.712, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_heatpump_ground_water_electricity" do
      the_present.should be_within(5506.287, some_tolerance)
      the_future.should  be_within(2925101.0, some_tolerance)
      the_relative_increase.should be_within(53022.9, some_tolerance)
      the_absolute_increase.should be_within(2919594.7, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_micro_chp_network_gas" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_network_gas" do
      the_present.should be_within(670698.346, some_tolerance)
      the_future.should  be_within(670698.346, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_wood_pellets" do
      the_present.should be_within(187980.942, some_tolerance)
      the_future.should  be_within(187980.942, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


  end
end