require 'spec_helper'

describe "untitled" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2030, use_fce: false) do
      move_slider 198, -45.0       # policy_sustainability_co2_emissions
      move_slider 336, 2.0       # households_insulation_level_old_houses
      move_slider 337, 4.0       # households_insulation_level_new_houses
      move_slider 359, 57.2       # households_efficiency_dish_washer
      move_slider 6, 76.2       # households_efficiency_fridge_freezer
      move_slider 361, 61.9       # households_efficiency_washing_machine
      move_slider 362, 65.0       # households_efficiency_dryer
      move_slider 363, 50.4       # households_efficiency_television
      move_slider 364, 48.5       # households_efficiency_computer_media
      move_slider 360, 50.4       # households_efficiency_vacuum_cleaner
      move_slider 412, 50.4       # households_efficiency_other
      move_slider 370, 50.0       # households_behavior_close_windows_turn_off_heating
      move_slider 371, 50.0       # households_efficiency_low_temperature_washing
      move_slider 47, 30.6       # households_market_penetration_solar_panels
      move_slider 333, 69.1       # households_heating_gas_combi_heater_share
      move_slider 51, 10.2       # households_heating_micro_chp_share
      move_slider 338, 12.0       # households_heating_heat_pump_ground_share
      move_slider 441, 0.0       # households_heating_gas_fired_heater_share
      move_slider 446, 89.3       # households_hot_water_gas_fired_heater_share
      move_slider 346, 0.0       # households_hot_water_gas_water_heater_share
      move_slider 347, 8.3       # households_hot_water_electric_boiler_share
      move_slider 354, 51.3       # households_cooking_gas_share
      move_slider 355, 15.7       # households_cooking_electric_share
      move_slider 357, 25.0       # households_cooking_induction_share
      move_slider 245, 8.3       # households_lighting_incandescent_share
      move_slider 43, 44.5       # households_lighting_low_energy_light_bulb_share
      move_slider 44, 47.2       # households_lighting_light_emitting_diode_share
      move_slider 203, 0.5       # households_electricity_demand_per_person
      move_slider 1, 1.0       # households_replacement_of_existing_houses
      move_slider 170, 2.0       # industry_heat_from_fuels
      move_slider 169, 1.1       # industry_efficiency_electricity
      move_slider 216, 27.2       # industry_heating_gas_fired_heater_share
      move_slider 219, 12.0       # industry_heating_biomass_fired_heater_share
      move_slider 326, 34.3       # industry_heating_combined_heat_power_share
      move_slider 217, 23.1       # industry_heating_oil_fired_heater_share
      move_slider 146, 24.1       # transport_cars_electric_share
      move_slider 147, 23.1       # transport_cars_diesel_share
      move_slider 159, 5.6       # transport_trucks_electric_share
      move_slider 158, 94.4       # transport_trucks_diesel_share
      move_slider 171, 1.0       # transport_efficiency_electric_vehicles
      move_slider 186, 1.0       # transport_efficiency_combustion_engine_cars
      move_slider 250, 0.0       # number_of_pulverized_coal
      move_slider 251, 4.0       # number_of_pulverized_coal_ccs
      move_slider 551, 0.0       # number_of_central_coal_chp
      move_slider 256, 0.0       # number_of_gas_conventional
      move_slider 257, 9.7       # number_of_gas_ccgt
      move_slider 261, 4.0       # number_of_co_firing_coal
      move_slider 263, 3160.8       # number_of_wind_onshore_land
      move_slider 265, 3500.0       # number_of_wind_offshore
      move_slider 292, 75.0       # transport_diesel_share
      move_slider 293, 25.0       # transport_biodiesel_share
      move_slider 423, 89.8       # transport_planes_fossil_fuel_share
      move_slider 424, 10.2       # transport_planes_bio_ethanol_share
      move_slider 425, 89.8       # transport_ships_diesel_share
      move_slider 426, 10.2       # transport_ships_bio_diesel_share
      move_slider 489, 84.3       # natural_gas_total_share
      move_slider 488, 15.7       # green_gas_total_share
      move_slider 208, 47.0       # policy_cost_total_energy_cost
      move_slider 11, 25.0       # costs_oil
      move_slider 58, 25.0       # costs_gas
      move_slider 57, 15.0       # costs_coal
      move_slider 59, 25.0       # costs_biomass
      move_slider 137, 500.0       # costs_co2
      move_slider 138, 32.0       # costs_co2_free_allocation
      move_slider 14, -25.0       # investment_costs_wind_offshore
      move_slider 127, -10.0       # om_costs_wind_offshore
      move_slider 234, 36.3       # policy_sustainability_renewable_percentage
      move_slider 381, 1.5       # buildings_insulation_level
      move_slider 382, 2.5       # not found
      move_slider 405, 20.4       # buildings_market_penetration_solar_panels
      move_slider 400, 29.6       # buildings_lighting_fluorescent_tube_conventional_share
      move_slider 402, 20.4       # buildings_lighting_led_tube_share
      move_slider 401, 50.0       # buildings_lighting_fluorescent_tube_high_performance_share
      move_slider 403, 40.7       # buildings_lighting_motion_detection
      move_slider 376, -0.5       # buildings_number_of_buildings
      move_slider 246, 0.0       # agriculture_heating_gas_fired_heater_share
      move_slider 225, 50.0       # agriculture_heating_biomass_fired_heater_share
      move_slider 223, 0.0       # agriculture_heating_oil_fired_heater_share
      move_slider 227, 0.0       # agriculture_heating_heat_pump_with_ts_share
      move_slider 228, 5.6       # agriculture_heating_geothermal_share
      move_slider 327, 44.4       # agriculture_heating_combined_heat_power_share
    end
  end

  after :all do
    print_comparison('localhost') if ENV["LOCALHOST"]
    print_comparison('beta') if ENV["BETA"]
  end

  describe "gqueries" do
      
    it "dashboard_bio_footprint" do
      the_present.should be_within(0.224, some_tolerance)
      the_future.should  be_within(2.086, some_tolerance)
      the_relative_increase.should be_within(829.3, some_tolerance)
      the_absolute_increase.should be_within(1.9, some_tolerance)
    end


      
    it "dashboard_employment" do
      the_present.should be_within(29409.913, some_tolerance)
      the_future.should  be_within(51255.01, some_tolerance)
      the_relative_increase.should be_within(74.3, some_tolerance)
      the_absolute_increase.should be_within(21845.1, some_tolerance)
    end


      
    it "dashboard_energy_demand_primary_of_final" do
      the_present.should be_within(3461730879704.038, some_tolerance)
      the_future.should  be_within(2682929431083.27, some_tolerance)
      the_relative_increase.should be_within(-22.5, some_tolerance)
      the_absolute_increase.should be_within(-778801448620.8, some_tolerance)
    end


      
    it "dashboard_energy_import_netto" do
      the_present.should be_within(0.294, some_tolerance)
      the_future.should  be_within(0.701, some_tolerance)
      the_relative_increase.should be_within(138.5, some_tolerance)
      the_absolute_increase.should be_within(0.4, some_tolerance)
    end


      
    it "dashboard_reduction_of_co2_emissions_versus_1990" do
      the_present.should be_within(0.084, some_tolerance)
      the_future.should  be_within(-0.433, some_tolerance)
      the_relative_increase.should be_within(-613.4, some_tolerance)
      the_absolute_increase.should be_within(-0.5, some_tolerance)
    end


      
    it "dashboard_renewability" do
      the_present.should be_within(0.033, some_tolerance)
      the_future.should  be_within(0.28, some_tolerance)
      the_relative_increase.should be_within(759.2, some_tolerance)
      the_absolute_increase.should be_within(0.2, some_tolerance)
    end


      
    it "dashboard_security_of_supply" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "dashboard_share_of_renewable_electricity" do
      the_present.should be_within(0.098, some_tolerance)
      the_future.should  be_within(1.143, some_tolerance)
      the_relative_increase.should be_within(1068.9, some_tolerance)
      the_absolute_increase.should be_within(1.0, some_tolerance)
    end


      
    it "dashboard_total_costs" do
      the_present.should be_within(48.437, some_tolerance)
      the_future.should  be_within(49.617, some_tolerance)
      the_relative_increase.should be_within(2.4, some_tolerance)
      the_absolute_increase.should be_within(1.2, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_agriculture" do
      the_present.should be_within(2109325263.244, some_tolerance)
      the_future.should  be_within(2757299648.978, some_tolerance)
      the_relative_increase.should be_within(30.7, some_tolerance)
      the_absolute_increase.should be_within(647974385.7, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_buildings" do
      the_present.should be_within(5346359830.651, some_tolerance)
      the_future.should  be_within(5179400838.312, some_tolerance)
      the_relative_increase.should be_within(-3.1, some_tolerance)
      the_absolute_increase.should be_within(-166958992.3, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_households" do
      the_present.should be_within(7813038899.502, some_tolerance)
      the_future.should  be_within(5867614355.925, some_tolerance)
      the_relative_increase.should be_within(-24.9, some_tolerance)
      the_absolute_increase.should be_within(-1945424543.6, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_industry_and_energy" do
      the_present.should be_within(23647581507.799, some_tolerance)
      the_future.should  be_within(26013999811.495, some_tolerance)
      the_relative_increase.should be_within(10.0, some_tolerance)
      the_absolute_increase.should be_within(2366418303.7, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_other" do
      the_present.should be_within(1444370733.371, some_tolerance)
      the_future.should  be_within(1834088382.265, some_tolerance)
      the_relative_increase.should be_within(27.0, some_tolerance)
      the_absolute_increase.should be_within(389717648.9, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_transport" do
      the_present.should be_within(8076663885.401, some_tolerance)
      the_future.should  be_within(7964324549.776, some_tolerance)
      the_relative_increase.should be_within(-1.4, some_tolerance)
      the_absolute_increase.should be_within(-112339335.6, some_tolerance)
    end


      
    it "dashboard_total_costs_per_household" do
      the_present.should be_within(6590.563, some_tolerance)
      the_future.should  be_within(6751.034, some_tolerance)
      the_relative_increase.should be_within(2.4, some_tolerance)
      the_absolute_increase.should be_within(160.5, some_tolerance)
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
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_combined_network_gas" do
      the_present.should be_within(6036264.993, some_tolerance)
      the_future.should  be_within(5080880.626, some_tolerance)
      the_relative_increase.should be_within(-15.8, some_tolerance)
      the_absolute_increase.should be_within(-955384.4, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_crude_oil" do
      the_present.should be_within(91365.959, some_tolerance)
      the_future.should  be_within(91365.959, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_district_heating_steam_hot_water" do
      the_present.should be_within(100978.019, some_tolerance)
      the_future.should  be_within(57384.984, some_tolerance)
      the_relative_increase.should be_within(-43.2, some_tolerance)
      the_absolute_increase.should be_within(-43593.0, some_tolerance)
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
      the_future.should  be_within(881940.0, some_tolerance)
      the_relative_increase.should be_within(15917.0, some_tolerance)
      the_absolute_increase.should be_within(876433.7, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_micro_chp_network_gas" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(749649.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(749649.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_network_gas" do
      the_present.should be_within(670698.346, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-670698.3, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_wood_pellets" do
      the_present.should be_within(187980.942, some_tolerance)
      the_future.should  be_within(187980.942, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


  end
end