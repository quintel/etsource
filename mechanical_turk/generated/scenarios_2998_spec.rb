require 'spec_helper'

describe "untitled" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2050, use_fce: false) do
      move_slider 203, 0.4       # households_electricity_demand_per_person
      move_slider 204, 0.2       # households_cooling_demand_per_person
      move_slider 335, 0.2       # households_number_of_inhabitants
      move_slider 372, 0.0       # households_heat_demand_per_person
      move_slider 373, 0.2       # households_hot_water_demand_per_person
      move_slider 1, 0.3       # households_replacement_of_existing_houses
      move_slider 336, 2.0       # households_insulation_level_old_houses
      move_slider 337, 4.0       # households_insulation_level_new_houses
      move_slider 6, 53.4       # households_efficiency_fridge_freezer
      move_slider 359, 44.6       # households_efficiency_dish_washer
      move_slider 360, 46.4       # households_efficiency_vacuum_cleaner
      move_slider 361, 45.9       # households_efficiency_washing_machine
      move_slider 362, 53.8       # households_efficiency_dryer
      move_slider 363, 45.6       # households_efficiency_television
      move_slider 364, 45.6       # households_efficiency_computer_media
      move_slider 412, 45.6       # households_efficiency_other
      move_slider 366, 50.0       # households_behavior_standby_killer_turn_off_appliances
      move_slider 368, 50.0       # households_behavior_turn_off_the_light
      move_slider 370, 50.0       # households_behavior_close_windows_turn_off_heating
      move_slider 371, 50.0       # households_efficiency_low_temperature_washing
      move_slider 376, 0.2       # buildings_number_of_buildings
      move_slider 377, 0.5       # buildings_electricity_per_student_employee
      move_slider 378, 0.0       # buildings_heat_per_employee_student
      move_slider 408, 0.0       # buildings_cooling_per_student_employee
      move_slider 381, 2.0       # buildings_insulation_level
      move_slider 382, 3.0       # not found
      move_slider 398, 5.0       # buildings_appliances_efficiency
      move_slider 141, 0.5       # transport_cars
      move_slider 142, 0.5       # transport_trucks
      move_slider 143, 1.0       # transport_trains
      move_slider 144, 0.0       # transport_domestic_flights
      move_slider 145, 0.5       # transport_inland_navigation
      move_slider 171, 2.0       # transport_efficiency_electric_vehicles
      move_slider 186, 2.0       # transport_efficiency_combustion_engine_cars
      move_slider 187, 0.5       # transport_efficiency_ships
      move_slider 188, 0.5       # transport_efficiency_airplanes
      move_slider 241, 0.5       # transport_efficiency_trains
      move_slider 328, 0.5       # transport_efficiency_combustion_engine_trucks
      move_slider 202, -0.5       # industry_non_energetic_other_demand
      move_slider 205, -0.5       # industry_non_energetic_oil_demand
      move_slider 213, 0.5       # industry_electricity_demand
      move_slider 214, 0.5       # industry_heat_demand
      move_slider 169, 1.2       # industry_efficiency_electricity
      move_slider 170, 1.2       # industry_heat_from_fuels
      move_slider 220, 0.5       # agriculture_electricity_demand
      move_slider 221, 0.0       # agriculture_heat_demand
      move_slider 11, 100.0       # costs_oil
      move_slider 57, 100.0       # costs_coal
      move_slider 58, 100.0       # costs_gas
      move_slider 59, 100.0       # costs_biomass
      move_slider 12, -37.0       # investment_costs_wind_onshore
      move_slider 14, -64.0       # investment_costs_wind_offshore
      move_slider 133, -78.0       # investment_costs_solar_solar_panels
      move_slider 134, 0.0       # investment_costs_solar_concentrated_solar_power
      move_slider 247, -50.0       # investment_costs_earth_geothermal_electricity
      move_slider 137, 300.0       # costs_co2
      move_slider 138, 0.0       # costs_co2_free_allocation
      move_slider 198, -99.0       # policy_sustainability_co2_emissions
      move_slider 234, 99.0       # policy_sustainability_renewable_percentage
      move_slider 178, 500.0       # policy_area_onshore_land
      move_slider 179, 100.0       # policy_area_onshore_coast
      move_slider 233, 1700.0       # policy_area_offshore
      move_slider 193, 266.7       # policy_area_roofs_for_solar_panels
      move_slider 194, 75.0       # policy_area_land_for_solar_panels
      move_slider 195, 75.0       # policy_area_land_for_csp
      move_slider 206, 50.0       # policy_dependence_max_dependence
      move_slider 212, 25.0       # policy_dependence_max_electricity_dependence
      move_slider 208, 100.0       # policy_cost_total_energy_cost
      move_slider 207, 100.0       # policy_cost_electricity_cost
      move_slider 43, 1.3       # households_lighting_low_energy_light_bulb_share
      move_slider 44, 86.1       # households_lighting_light_emitting_diode_share
      move_slider 47, 100.0       # households_market_penetration_solar_panels
      move_slider 48, 0.0       # households_heating_solar_thermal_panels_share
      move_slider 51, 0.0       # households_heating_micro_chp_share
      move_slider 52, 0.0       # households_heating_electric_heater_share
      move_slider 146, 90.0       # transport_cars_electric_share
      move_slider 147, 2.2       # transport_cars_diesel_share
      move_slider 148, 1.6       # transport_cars_gasoline_share
      move_slider 157, 4.0       # transport_trucks_gasoline_share
      move_slider 158, 2.75       # transport_trucks_diesel_share
      move_slider 159, 87.95       # transport_trucks_electric_share
      move_slider 217, 0.0       # industry_heating_oil_fired_heater_share
      move_slider 218, 0.0       # industry_heating_coal_fired_heater_share
      move_slider 219, 100.0       # industry_heating_biomass_fired_heater_share
      move_slider 223, 0.0       # agriculture_heating_oil_fired_heater_share
      move_slider 225, 54.36666666666665       # agriculture_heating_biomass_fired_heater_share
      move_slider 227, 40.50000000000002       # agriculture_heating_heat_pump_with_ts_share
      move_slider 228, 5.033333333333335       # agriculture_heating_geothermal_share
      move_slider 229, 1.0       # other_electricity_demand
      move_slider 230, -2.0       # other_heat_demand
      move_slider 238, 0.0       # transport_cars_lpg_share
      move_slider 239, 6.2       # transport_cars_compressed_gas_share
      move_slider 240, 5.3       # transport_trucks_compressed_gas_share
      move_slider 242, 0.0       # households_heating_small_gas_chp_share
      move_slider 248, 0.0       # households_heating_oil_fired_heater_share
      move_slider 250, 0.0       # number_of_pulverized_coal
      move_slider 251, 0.0       # number_of_pulverized_coal_ccs
      move_slider 253, 0.0       # number_of_coal_iggc
      move_slider 254, 0.0       # number_of_coal_igcc_ccs
      move_slider 255, 0.0       # number_of_coal_oxyfuel_ccs
      move_slider 256, 1.0       # number_of_gas_conventional
      move_slider 257, 2.0       # number_of_gas_ccgt
      move_slider 258, 0.0       # number_of_oil_fired_plant
      move_slider 259, 0.06375013076155234       # number_of_nuclear_3rd_gen
      move_slider 261, 0.0       # number_of_co_firing_coal
      move_slider 262, 0.0       # not found
      move_slider 263, 2309.2       # number_of_wind_onshore_land
      move_slider 264, 490.0       # number_of_wind_onshore_coast
      move_slider 265, 4219.8       # number_of_wind_offshore
      move_slider 266, 6.6       # number_of_hydro_river
      move_slider 267, 0.0       # number_of_hydro_mountain
      move_slider 268, 0.0       # not found
      move_slider 270, 100.0       # number_of_geothermal_electric
      move_slider 271, 0.0       # number_of_waste_incinerator
      move_slider 298, 150.6       # number_of_solar_pv_plants
      move_slider 299, 34.6       # number_of_concentrated_solar_power
      move_slider 315, 0.0       # number_of_coal_conventional
      move_slider 316, 0.0       # number_of_coal_lignite
      move_slider 317, 0.0       # households_heating_gas_fired_heat_pump_share
      move_slider 321, 31.680000000000007       # other_number_of_small_gas_chp
      move_slider 322, 13.1       # industry_number_of_gas_chp
      move_slider 323, 78.3       # not found
      move_slider 324, 177.4       # industry_number_of_biomass_chp
      move_slider 325, 300.88       # agriculture_number_of_small_gas_chp
      move_slider 326, 0.0       # industry_heating_combined_heat_power_share
      move_slider 327, 0.1       # agriculture_heating_combined_heat_power_share
      move_slider 338, 12.5       # households_heating_heat_pump_ground_share
      move_slider 339, 15.8       # households_heating_heat_pump_add_on_share
      move_slider 340, 27.300000000000004       # households_heating_pellet_stove_share
      move_slider 341, 0.0       # households_heating_heat_network_share
      move_slider 343, 45.76271186440678       # households_heating_biomass_chp_share
      move_slider 344, 54.23728813559322       # households_heating_geothermal_share
      move_slider 346, 0.0       # households_hot_water_gas_water_heater_share
      move_slider 347, 6.4       # households_hot_water_electric_boiler_share
      move_slider 348, 0.0       # households_hot_water_solar_water_heater_share
      move_slider 349, 0.0       # not found
      move_slider 351, 32.800000000000004       # households_cooling_heat_pump_ground_share
      move_slider 352, 0.0       # households_cooling_gas_fired_heat_pump_share
      move_slider 354, 0.0       # households_cooking_gas_share
      move_slider 355, 34.0       # households_cooking_electric_share
      move_slider 356, 17.0       # households_cooking_halogen_share
      move_slider 357, 49.0       # households_cooking_induction_share
      move_slider 374, 3.1       # households_cooling_heat_pump_with_ts_share
      move_slider 375, 3.1       # households_heating_heat_pump_with_ts_share
      move_slider 384, 0.0       # not found
      move_slider 385, 16.604000000000003       # buildings_heating_biomass_chp_share
      move_slider 386, 1.9000000000000001       # buildings_heating_small_gas_chp_share
      move_slider 387, 6.1000000000000005       # buildings_heating_electric_heater_share
      move_slider 388, 0.09999999999999826       # buildings_heating_heat_network_share
      move_slider 389, 11.696000000000002       # buildings_heating_solar_thermal_panels_share
      move_slider 390, 0.0       # buildings_heating_gas_fired_heat_pump_share
      move_slider 391, 0.0       # buildings_cooling_gas_fired_heat_pump_share
      move_slider 392, 35.2       # buildings_cooling_heat_pump_with_ts_share
      move_slider 393, 64.8       # buildings_cooling_airconditioning_share
      move_slider 394, 35.20000000000001       # buildings_heating_heat_pump_with_ts_share
      move_slider 395, 2.5       # buildings_ventilation_rate
      move_slider 396, 10.0       # buildings_recirculation
      move_slider 397, 43.9       # buildings_waste_heat_recovery
      move_slider 400, 7.4       # buildings_lighting_fluorescent_tube_conventional_share
      move_slider 401, 39.6       # buildings_lighting_fluorescent_tube_high_performance_share
      move_slider 402, 53.0       # buildings_lighting_led_tube_share
      move_slider 403, 50.0       # buildings_lighting_motion_detection
      move_slider 404, 50.0       # buildings_lighting_daylight_dependent_control
      move_slider 405, 100.0       # buildings_market_penetration_solar_panels
      move_slider 406, 28.400000000000002       # buildings_heating_biomass_fired_heater_share
      move_slider 409, 0.0       # buildings_heating_oil_fired_heater_share
      move_slider 411, 0.0       # households_heating_coal_fired_heater_share
      move_slider 413, 0.0       # number_of_nuclear_conventional
      move_slider 416, 1.0       # number_of_gas_ccgt_ccs
      move_slider 488, 100.0       # green_gas_total_share
      move_slider 489, 0.0       # natural_gas_total_share
      move_slider 246, 0.0       # agriculture_heating_gas_fired_heater_share
      move_slider 353, 64.10000000000001       # households_cooling_airconditioning_share
      move_slider 383, 0.0       # buildings_heating_gas_fired_heater_share
      move_slider 333, 0.0       # households_heating_gas_combi_heater_share
      move_slider 245, 12.6       # households_lighting_incandescent_share
      move_slider 216, 0.0       # industry_heating_gas_fired_heater_share
      move_slider 296, 0.0       # not found
      move_slider 297, 100.0       # not found
      move_slider 292, 0.0       # transport_diesel_share
      move_slider 293, 100.0       # transport_biodiesel_share
      move_slider 294, 0.0       # transport_gasoline_share
      move_slider 295, 100.0       # transport_bio_ethanol_share
      move_slider 428, 0.0       # transport_trains_diesel_share
      move_slider 425, 0.0       # transport_ships_diesel_share
      move_slider 423, 0.0       # transport_planes_fossil_fuel_share
      move_slider 424, 100.0       # transport_planes_bio_ethanol_share
      move_slider 418, 3.666666666666668       # not found
      move_slider 419, 0.0       # not found
      move_slider 420, 38.1       # households_hot_water_heat_pump_ground_share
      move_slider 421, 0.0       # households_hot_water_heat_network_share
      move_slider 435, 0.0       # households_hot_water_oil_fired_heater_share
      move_slider 426, 100.0       # transport_ships_bio_diesel_share
      move_slider 429, 100.0       # transport_trains_electric_share
      move_slider 427, 0.0       # transport_trains_coal_share
      move_slider 422, 0.0       # number_of_lignite_chp
      move_slider 441, 0.0       # households_heating_gas_fired_heater_share
      move_slider 446, 0.0       # households_hot_water_gas_fired_heater_share
      move_slider 444, 55.5       # households_hot_water_biomass_heater_share
      move_slider 445, 0.0       # households_hot_water_micro_chp_share
      move_slider 439, 0.0       # households_hot_water_fuel_cell_share
      move_slider 443, 0.0       # households_hot_water_coal_fired_heater_hotwater_share
      move_slider 436, 0.0       # households_cooking_biomass_share
      move_slider 431, 0.0       # number_of_biomass_fired_heater_district
      move_slider 285, 197.0       # not found
      move_slider 414, 1010479.0       # number_of_biomass_fired_heater_fixed
      move_slider 286, 78.0       # not found
      move_slider 289, 1163554.0       # number_of_electric_heat_pump_fixed
      move_slider 291, 652.0       # number_of_geothermal_fixed
      move_slider 290, 18855.0       # number_of_solar_water_heater_fixed
      move_slider 272, 197.0       # number_of_biomass_chp_fixed
      move_slider 313, 22222.0       # number_of_solar_pv_roofs_fixed
      move_slider 551, 0.0       # number_of_central_coal_chp
      move_slider 277, 0.0       # number_of_decentral_coal_chp_fixed
      move_slider 276, 0.0       # number_of_large_gas_chp
      move_slider 275, 491.3       # number_of_small_chp_fixed
      move_slider 274, 0.0       # number_of_micro_chp_fixed
      move_slider 582, 41.300000000000004       # households_heating_district_heating_network_share
    end
  end

  after :all do
    print_comparison('localhost') if ENV["LOCALHOST"]
    print_comparison('beta') if ENV["BETA"]
  end

  describe "gqueries" do
      
    it "dashboard_bio_footprint" do
      the_present.should be_within(0.224, some_tolerance)
      the_future.should  be_within(5.268, some_tolerance)
      the_relative_increase.should be_within(2246.8, some_tolerance)
      the_absolute_increase.should be_within(5.0, some_tolerance)
    end


      
    it "dashboard_employment" do
      the_present.should be_within(29409.913, some_tolerance)
      the_future.should  be_within(163106.56, some_tolerance)
      the_relative_increase.should be_within(454.6, some_tolerance)
      the_absolute_increase.should be_within(133696.6, some_tolerance)
    end


      
    it "dashboard_energy_demand_primary_of_final" do
      the_present.should be_within(3461730879704.038, some_tolerance)
      the_future.should  be_within(2393675724813.902, some_tolerance)
      the_relative_increase.should be_within(-30.9, some_tolerance)
      the_absolute_increase.should be_within(-1068055154890.1, some_tolerance)
    end


      
    it "dashboard_energy_import_netto" do
      the_present.should be_within(0.294, some_tolerance)
      the_future.should  be_within(0.809, some_tolerance)
      the_relative_increase.should be_within(175.2, some_tolerance)
      the_absolute_increase.should be_within(0.5, some_tolerance)
    end


      
    it "dashboard_reduction_of_co2_emissions_versus_1990" do
      the_present.should be_within(0.084, some_tolerance)
      the_future.should  be_within(-0.994, some_tolerance)
      the_relative_increase.should be_within(-1277.5, some_tolerance)
      the_absolute_increase.should be_within(-1.1, some_tolerance)
    end


      
    it "dashboard_renewability" do
      the_present.should be_within(0.033, some_tolerance)
      the_future.should  be_within(0.994, some_tolerance)
      the_relative_increase.should be_within(2953.7, some_tolerance)
      the_absolute_increase.should be_within(1.0, some_tolerance)
    end


      
    it "dashboard_security_of_supply" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "dashboard_share_of_renewable_electricity" do
      the_present.should be_within(0.098, some_tolerance)
      the_future.should  be_within(1.493, some_tolerance)
      the_relative_increase.should be_within(1426.9, some_tolerance)
      the_absolute_increase.should be_within(1.4, some_tolerance)
    end


      
    it "dashboard_total_costs" do
      the_present.should be_within(48.437, some_tolerance)
      the_future.should  be_within(62.921, some_tolerance)
      the_relative_increase.should be_within(29.9, some_tolerance)
      the_absolute_increase.should be_within(14.5, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_agriculture" do
      the_present.should be_within(2109325263.244, some_tolerance)
      the_future.should  be_within(3065986299.23, some_tolerance)
      the_relative_increase.should be_within(45.4, some_tolerance)
      the_absolute_increase.should be_within(956661036.0, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_buildings" do
      the_present.should be_within(5346359830.651, some_tolerance)
      the_future.should  be_within(3463166531.834, some_tolerance)
      the_relative_increase.should be_within(-35.2, some_tolerance)
      the_absolute_increase.should be_within(-1883193298.8, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_households" do
      the_present.should be_within(7813038899.502, some_tolerance)
      the_future.should  be_within(8735367011.127, some_tolerance)
      the_relative_increase.should be_within(11.8, some_tolerance)
      the_absolute_increase.should be_within(922328111.6, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_industry_and_energy" do
      the_present.should be_within(23647581507.799, some_tolerance)
      the_future.should  be_within(41584502905.717, some_tolerance)
      the_relative_increase.should be_within(75.9, some_tolerance)
      the_absolute_increase.should be_within(17936921397.9, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_other" do
      the_present.should be_within(1444370733.371, some_tolerance)
      the_future.should  be_within(1269360789.803, some_tolerance)
      the_relative_increase.should be_within(-12.1, some_tolerance)
      the_absolute_increase.should be_within(-175009943.6, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_transport" do
      the_present.should be_within(8076663885.401, some_tolerance)
      the_future.should  be_within(4802279915.244, some_tolerance)
      the_relative_increase.should be_within(-40.5, some_tolerance)
      the_absolute_increase.should be_within(-3274383970.2, some_tolerance)
    end


      
    it "dashboard_total_costs_per_household" do
      the_present.should be_within(6590.563, some_tolerance)
      the_future.should  be_within(8561.217, some_tolerance)
      the_relative_increase.should be_within(29.9, some_tolerance)
      the_absolute_increase.should be_within(1970.7, some_tolerance)
    end


      
    it "turk_number_of_households" do
      the_present.should be_within(7349500.0, some_tolerance)
      the_future.should  be_within(7349500.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_coal" do
      the_present.should be_within(4525.868, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-4525.9, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_collective_heatpump_water_water_ts_electricity" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(733.058, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(733.1, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_combined_network_gas" do
      the_present.should be_within(6036264.993, some_tolerance)
      the_future.should  be_within(1161221.0, some_tolerance)
      the_relative_increase.should be_within(-80.8, some_tolerance)
      the_absolute_increase.should be_within(-4875044.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_crude_oil" do
      the_present.should be_within(91365.959, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-91366.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_district_heating_steam_hot_water" do
      the_present.should be_within(100978.019, some_tolerance)
      the_future.should  be_within(716551.753, some_tolerance)
      the_relative_increase.should be_within(609.6, some_tolerance)
      the_absolute_increase.should be_within(615573.7, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_electricity" do
      the_present.should be_within(129397.747, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-129397.7, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_heatpump_air_water_network_gas" do
      the_present.should be_within(0.712, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-0.7, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_heatpump_ground_water_electricity" do
      the_present.should be_within(5506.287, some_tolerance)
      the_future.should  be_within(918687.5, some_tolerance)
      the_relative_increase.should be_within(16584.3, some_tolerance)
      the_absolute_increase.should be_within(913181.2, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_micro_chp_network_gas" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_network_gas" do
      the_present.should be_within(670698.346, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-670698.3, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_wood_pellets" do
      the_present.should be_within(187980.942, some_tolerance)
      the_future.should  be_within(2006413.5, some_tolerance)
      the_relative_increase.should be_within(967.3, some_tolerance)
      the_absolute_increase.should be_within(1818432.6, some_tolerance)
    end


  end
end