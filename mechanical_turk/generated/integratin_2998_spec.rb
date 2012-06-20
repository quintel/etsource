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
      
    it "1990_in_co2_emissions" do
      the_present.should be_within(151.2, some_tolerance)
      the_future.should  be_within(151.2, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "1990_in_co2_emissions_corrected_for_import" do
      the_present.should be_within(151.2, some_tolerance)
      the_future.should  be_within(151.2, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


          it "actual_1990_in_co2_emissions_table" do
      the_value.should be_within(151.2, some_tolerance)
    end

          it "actual_2010_in_co2_emissions_table" do
      the_value.should be_within(165.372, some_tolerance)
    end

          it "actual_20xx_in_co2_emissions_table" do
      the_value.should be_within(0.881, some_tolerance)
    end

          it "actual_co2_emitted_in_co2_emissions_waterfall" do
      the_value.should be_within(0.881, some_tolerance)
    end

          it "all_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(108.328, some_tolerance)
    end

      
    it "ambient_cold_in_source_of_cooling_in_buildings" do
      the_present.should be_within(39.937, some_tolerance)
      the_future.should  be_within(32.014, some_tolerance)
      the_relative_increase.should be_within(-19.8, some_tolerance)
      the_absolute_increase.should be_within(-7.9, some_tolerance)
    end


      
    it "ambient_cold_in_source_of_cooling_in_households" do
      the_present.should be_within(8.004, some_tolerance)
      the_future.should  be_within(9.012, some_tolerance)
      the_relative_increase.should be_within(12.6, some_tolerance)
      the_absolute_increase.should be_within(1.0, some_tolerance)
    end


      
    it "ambient_heat_in_effect_of_insulation_in_households2" do
      the_present.should be_within(0.271, some_tolerance)
      the_future.should  be_within(30.592, some_tolerance)
      the_relative_increase.should be_within(11200.0, some_tolerance)
      the_absolute_increase.should be_within(30.3, some_tolerance)
    end


      
    it "ambient_heat_in_source_of_heat_and_electricity_used_in_households" do
      the_present.should be_within(1.094, some_tolerance)
      the_future.should  be_within(67.162, some_tolerance)
      the_relative_increase.should be_within(6039.9, some_tolerance)
      the_absolute_increase.should be_within(66.1, some_tolerance)
    end


      
    it "ambient_heat_in_source_of_heat_in_agriculture" do
      the_present.should be_within(0.45, some_tolerance)
      the_future.should  be_within(41.728, some_tolerance)
      the_relative_increase.should be_within(9178.0, some_tolerance)
      the_absolute_increase.should be_within(41.3, some_tolerance)
    end


      
    it "ambient_heat_in_source_of_heat_in_buildings" do
      the_present.should be_within(1.447, some_tolerance)
      the_future.should  be_within(19.0, some_tolerance)
      the_relative_increase.should be_within(1213.1, some_tolerance)
      the_absolute_increase.should be_within(17.6, some_tolerance)
    end


      
    it "ambient_heat_in_source_of_heat_production" do
      the_present.should be_within(50.037, some_tolerance)
      the_future.should  be_within(164.452, some_tolerance)
      the_relative_increase.should be_within(228.7, some_tolerance)
      the_absolute_increase.should be_within(114.4, some_tolerance)
    end


      
    it "appliances_in_use_of_electricity_in_buildings" do
      the_present.should be_within(34.165, some_tolerance)
      the_future.should  be_within(5.167, some_tolerance)
      the_relative_increase.should be_within(-84.9, some_tolerance)
      the_absolute_increase.should be_within(-29.0, some_tolerance)
    end


          it "assigned_co2_emission_in_co2_emissions_waterfall" do
      the_value.should be_within(-0.0, some_tolerance)
    end

      
    it "bio_ethanol_in_use_of_transport_fuels" do
      the_present.should be_within(5.614, some_tolerance)
      the_future.should  be_within(11.055, some_tolerance)
      the_relative_increase.should be_within(96.9, some_tolerance)
      the_absolute_increase.should be_within(5.4, some_tolerance)
    end


          it "bio_fuels_agriculture_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "bio_fuels_agriculture_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "bio_fuels_buildings_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "bio_fuels_buildings_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "bio_fuels_households_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "bio_fuels_households_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "bio_fuels_industry_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "bio_fuels_industry_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "bio_fuels_other_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "bio_fuels_other_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "bio_fuels_transport_in_mekko_of_final_demand" do
      the_value.should be_within(25.27, some_tolerance)
    end

          it "bio_fuels_transport_in_mekko_of_primary_demand" do
      the_value.should be_within(25.27, some_tolerance)
    end

      
    it "biodiesel_in_use_of_transport_fuels" do
      the_present.should be_within(3.963, some_tolerance)
      the_future.should  be_within(14.215, some_tolerance)
      the_relative_increase.should be_within(258.7, some_tolerance)
      the_absolute_increase.should be_within(10.3, some_tolerance)
    end


          it "biomass_agriculture_in_mekko_of_final_demand" do
      the_value.should be_within(68.447, some_tolerance)
    end

          it "biomass_agriculture_in_mekko_of_primary_demand" do
      the_value.should be_within(75.81, some_tolerance)
    end

          it "biomass_buildings_in_mekko_of_final_demand" do
      the_value.should be_within(22.747, some_tolerance)
    end

          it "biomass_buildings_in_mekko_of_primary_demand" do
      the_value.should be_within(32.476, some_tolerance)
    end

          it "biomass_conversion_in_fuel_chain_emissions" do
      the_value.should be_within(0.029, some_tolerance)
    end

          it "biomass_households_in_mekko_of_final_demand" do
      the_value.should be_within(128.023, some_tolerance)
    end

          it "biomass_households_in_mekko_of_primary_demand" do
      the_value.should be_within(187.566, some_tolerance)
    end

          it "biomass_in_future_energy_imports" do
      the_value.should be_within(1649.604, some_tolerance)
    end

      
    it "biomass_in_source_of_electricity_production" do
      the_present.should be_within(17.28, some_tolerance)
      the_future.should  be_within(136.412, some_tolerance)
      the_relative_increase.should be_within(689.4, some_tolerance)
      the_absolute_increase.should be_within(119.1, some_tolerance)
    end


          it "biomass_industry_in_mekko_of_final_demand" do
      the_value.should be_within(501.822, some_tolerance)
    end

          it "biomass_industry_in_mekko_of_primary_demand" do
      the_value.should be_within(1032.663, some_tolerance)
    end

          it "biomass_other_in_mekko_of_final_demand" do
      the_value.should be_within(0.82, some_tolerance)
    end

          it "biomass_other_in_mekko_of_primary_demand" do
      the_value.should be_within(8.835, some_tolerance)
    end

          it "biomass_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(16.382, some_tolerance)
    end

          it "biomass_plants_in_power_plant_properties" do
      the_value.should be_within(17.28, some_tolerance)
    end

          it "biomass_plants_investm_in_power_plant_properties" do
      the_value.should be_within(44254.051, some_tolerance)
    end

          it "biomass_plants_plants_in_power_plant_properties" do
      the_value.should be_within(347.829, some_tolerance)
    end

          it "biomass_plants_prod_in_power_plant_properties" do
      the_value.should be_within(136.412, some_tolerance)
    end

          it "biomass_transport_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "biomass_transport_in_mekko_of_primary_demand" do
      the_value.should be_within(28.008, some_tolerance)
    end

          it "biomass_value_in_present_energy_imports" do
      the_value.should be_within(58.622, some_tolerance)
    end

          it "bmu_wind_inland_in_expert_predictions" do
      the_value.should be_within(82.637, some_tolerance)
    end

          it "bmu_wind_offshore_in_expert_predictions" do
      the_value.should be_within(166.014, some_tolerance)
    end

      
    it "centrally_produced_electricity_in_source_of_heat_and_electricity_in_agriculture" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(29.965, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(30.0, some_tolerance)
    end


      
    it "centrally_produced_electricity_in_source_of_heat_and_electricity_in_industry" do
      the_present.should be_within(10.42, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-10.4, some_tolerance)
    end


      
    it "centrally_produced_electricity_in_source_of_heat_and_electricity_in_other_sector" do
      the_present.should be_within(1.44, some_tolerance)
      the_future.should  be_within(1.931, some_tolerance)
      the_relative_increase.should be_within(34.1, some_tolerance)
      the_absolute_increase.should be_within(0.5, some_tolerance)
    end


      
    it "centrally_produced_in_source_of_electricity_in_buildings" do
      the_present.should be_within(114.0, some_tolerance)
      the_future.should  be_within(6.611, some_tolerance)
      the_relative_increase.should be_within(-94.2, some_tolerance)
      the_absolute_increase.should be_within(-107.4, some_tolerance)
    end


      
    it "centrally_produced_in_source_of_electricity_in_households" do
      the_present.should be_within(88.93, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-88.9, some_tolerance)
    end


      
    it "chp_electricity_in_source_of_heat_and_electricity_in_agriculture" do
      the_present.should be_within(43.92, some_tolerance)
      the_future.should  be_within(4.371, some_tolerance)
      the_relative_increase.should be_within(-90.0, some_tolerance)
      the_absolute_increase.should be_within(-39.5, some_tolerance)
    end


      
    it "chp_electricity_in_source_of_heat_and_electricity_in_other_sector" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.213, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.2, some_tolerance)
    end


      
    it "chp_fossil_electricity_in_source_of_heat_and_electricity_in_industry" do
      the_present.should be_within(60.807, some_tolerance)
      the_future.should  be_within(0.712, some_tolerance)
      the_relative_increase.should be_within(-98.8, some_tolerance)
      the_absolute_increase.should be_within(-60.1, some_tolerance)
    end


      
    it "chp_fossil_heat_in_source_of_heat_and_electricity_in_industry" do
      the_present.should be_within(114.858, some_tolerance)
      the_future.should  be_within(1.345, some_tolerance)
      the_relative_increase.should be_within(-98.8, some_tolerance)
      the_absolute_increase.should be_within(-113.5, some_tolerance)
    end


      
    it "chp_heat_in_source_of_heat_and_electricity_in_agriculture" do
      the_present.should be_within(53.416, some_tolerance)
      the_future.should  be_within(5.316, some_tolerance)
      the_relative_increase.should be_within(-90.0, some_tolerance)
      the_absolute_increase.should be_within(-48.1, some_tolerance)
    end


      
    it "chp_heat_in_source_of_heat_and_electricity_in_other_sector" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.202, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.2, some_tolerance)
    end


      
    it "chp_renewable_electricity_in_source_of_heat_and_electricity_in_industry" do
      the_present.should be_within(4.713, some_tolerance)
      the_future.should  be_within(117.847, some_tolerance)
      the_relative_increase.should be_within(2400.7, some_tolerance)
      the_absolute_increase.should be_within(113.1, some_tolerance)
    end


      
    it "chp_renewable_heat_in_source_of_heat_and_electricity_in_industry" do
      the_present.should be_within(8.252, some_tolerance)
      the_future.should  be_within(207.04, some_tolerance)
      the_relative_increase.should be_within(2409.1, some_tolerance)
      the_absolute_increase.should be_within(198.8, some_tolerance)
    end


      
    it "chps_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(-176.4, some_tolerance)
      the_future.should  be_within(-145.784, some_tolerance)
      the_relative_increase.should be_within(-17.4, some_tolerance)
      the_absolute_increase.should be_within(30.6, some_tolerance)
    end


      
    it "chps_in_source_of_electricity_in_buildings" do
      the_present.should be_within(5.76, some_tolerance)
      the_future.should  be_within(0.507, some_tolerance)
      the_relative_increase.should be_within(-91.2, some_tolerance)
      the_absolute_increase.should be_within(-5.3, some_tolerance)
    end


      
    it "cleaning_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(22.055, some_tolerance)
      the_future.should  be_within(13.906, some_tolerance)
      the_relative_increase.should be_within(-36.9, some_tolerance)
      the_absolute_increase.should be_within(-8.1, some_tolerance)
    end


      
    it "co2_emission_exported_electricity_in_co2_emissions_with_import_and_export" do
      the_present.should be_within(1.407, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-1.4, some_tolerance)
    end


      
    it "co2_emission_imported_electricity_in_co2_emissions_with_import_and_export" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "co2_emission_in_co2_emissions" do
      the_present.should be_within(163.966, some_tolerance)
      the_future.should  be_within(0.881, some_tolerance)
      the_relative_increase.should be_within(-99.5, some_tolerance)
      the_absolute_increase.should be_within(-163.1, some_tolerance)
    end


      
    it "co2_emission_in_co2_emissions_corrected_for_import" do
      the_present.should be_within(163.966, some_tolerance)
      the_future.should  be_within(0.881, some_tolerance)
      the_relative_increase.should be_within(-99.5, some_tolerance)
      the_absolute_increase.should be_within(-163.1, some_tolerance)
    end


      
    it "co2_emission_local_production_in_co2_emissions_with_import_and_export" do
      the_present.should be_within(163.966, some_tolerance)
      the_future.should  be_within(0.881, some_tolerance)
      the_relative_increase.should be_within(-99.5, some_tolerance)
      the_absolute_increase.should be_within(-163.1, some_tolerance)
    end


      
    it "co2_emission_rights_in_breakdown_converter_costs" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "co2_emission_rights_in_breakdown_electricity_costs" do
      the_present.should be_within(0.054, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-0.1, some_tolerance)
    end


      
    it "co2_emission_rights_in_breakdown_electricity_costs_corrected_for_electricity_imbalance" do
      the_present.should be_within(0.052, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-0.1, some_tolerance)
    end


      
    it "co2_emission_rights_in_breakdown_heating_costs" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


          it "coal_agriculture_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "coal_agriculture_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "coal_buildings_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "coal_buildings_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "coal_conversion_in_fuel_chain_emissions" do
      the_value.should be_within(92.684, some_tolerance)
    end

          it "coal_extraction_in_fuel_chain_emissions" do
      the_value.should be_within(3.837, some_tolerance)
    end

          it "coal_households_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "coal_households_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "coal_in_future_energy_imports" do
      the_value.should be_within(61.616, some_tolerance)
    end

      
    it "coal_in_heating_heat_network" do
      the_present.should be_within(84.293, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-84.3, some_tolerance)
    end


      
    it "coal_in_source_of_electricity_production" do
      the_present.should be_within(99.324, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-99.3, some_tolerance)
    end


      
    it "coal_in_use_of_transport_fuels" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


          it "coal_industry_in_mekko_of_final_demand" do
      the_value.should be_within(47.168, some_tolerance)
    end

          it "coal_industry_in_mekko_of_primary_demand" do
      the_value.should be_within(57.331, some_tolerance)
    end

          it "coal_other_in_mekko_of_final_demand" do
      the_value.should be_within(3.526, some_tolerance)
    end

          it "coal_other_in_mekko_of_primary_demand" do
      the_value.should be_within(4.286, some_tolerance)
    end

          it "coal_power_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "coal_power_plants_in_power_plant_properties" do
      the_value.should be_within(99.324, some_tolerance)
    end

          it "coal_power_plants_investment_in_power_plant_properties" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "coal_power_plants_number_of_plants_in_power_plant_properties" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "coal_power_plants_prod_in_power_plant_properties" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "coal_transport_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "coal_transport_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "coal_transportation_in_fuel_chain_emissions" do
      the_value.should be_within(0.374, some_tolerance)
    end

          it "coal_treatment_in_fuel_chain_emissions" do
      the_value.should be_within(0.74, some_tolerance)
    end

          it "coal_value_in_present_energy_imports" do
      the_value.should be_within(332.651, some_tolerance)
    end

      
    it "coastal_in_targeted_area_use_for_wind_turbines" do
      the_present.should be_within(0.146, some_tolerance)
      the_future.should  be_within(22.173, some_tolerance)
      the_relative_increase.should be_within(15038.4, some_tolerance)
      the_absolute_increase.should be_within(22.0, some_tolerance)
    end


      
    it "collective_chps_in_source_of_electricity_in_households" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(22.134, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(22.1, some_tolerance)
    end


          it "conventional_in_comparison_of_demand_micro_chp_versus_conventional" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "cooking_from_biomass_in_source_of_cooking_in_households" do
      the_present.should be_within(0.007, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-0.0, some_tolerance)
    end


      
    it "cooking_from_electricity_in_source_of_cooking_in_households" do
      the_present.should be_within(4.447, some_tolerance)
      the_future.should  be_within(11.599, some_tolerance)
      the_relative_increase.should be_within(160.9, some_tolerance)
      the_absolute_increase.should be_within(7.2, some_tolerance)
    end


      
    it "cooking_from_gas_in_source_of_cooking_in_households" do
      the_present.should be_within(10.846, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-10.8, some_tolerance)
    end


      
    it "cooking_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(4.447, some_tolerance)
      the_future.should  be_within(11.599, some_tolerance)
      the_relative_increase.should be_within(160.9, some_tolerance)
      the_absolute_increase.should be_within(7.2, some_tolerance)
    end


      
    it "cooling_demand_in_effect_of_insulation_in_households" do
      the_present.should be_within(10.672, some_tolerance)
      the_future.should  be_within(11.559, some_tolerance)
      the_relative_increase.should be_within(8.3, some_tolerance)
      the_absolute_increase.should be_within(0.9, some_tolerance)
    end


      
    it "cooling_demand_in_use_of_final_demand_in_buildings" do
      the_present.should be_within(51.347, some_tolerance)
      the_future.should  be_within(39.003, some_tolerance)
      the_relative_increase.should be_within(-24.0, some_tolerance)
      the_absolute_increase.should be_within(-12.3, some_tolerance)
    end


      
    it "cooling_demand_in_use_of_final_demand_in_households" do
      the_present.should be_within(2.668, some_tolerance)
      the_future.should  be_within(2.548, some_tolerance)
      the_relative_increase.should be_within(-4.5, some_tolerance)
      the_absolute_increase.should be_within(-0.1, some_tolerance)
    end


      
    it "cooling_from_electricity_in_source_of_cooling_in_buildings" do
      the_present.should be_within(11.41, some_tolerance)
      the_future.should  be_within(6.989, some_tolerance)
      the_relative_increase.should be_within(-38.7, some_tolerance)
      the_absolute_increase.should be_within(-4.4, some_tolerance)
    end


      
    it "cooling_from_electricity_in_source_of_cooling_in_households" do
      the_present.should be_within(2.668, some_tolerance)
      the_future.should  be_within(2.548, some_tolerance)
      the_relative_increase.should be_within(-4.5, some_tolerance)
      the_absolute_increase.should be_within(-0.1, some_tolerance)
    end


      
    it "cooling_from_gas_in_source_of_cooling_in_buildings" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "cooling_from_gas_in_source_of_cooling_in_households" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "cooling_in_use_of_electricity_in_buildings" do
      the_present.should be_within(11.41, some_tolerance)
      the_future.should  be_within(6.989, some_tolerance)
      the_relative_increase.should be_within(-38.7, some_tolerance)
      the_absolute_increase.should be_within(-4.4, some_tolerance)
    end


      
    it "cooling_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(2.668, some_tolerance)
      the_future.should  be_within(2.548, some_tolerance)
      the_relative_increase.should be_within(-4.5, some_tolerance)
      the_absolute_increase.should be_within(-0.1, some_tolerance)
    end


      
    it "cost_of_capital_in_breakdown_converter_costs" do
      the_present.should be_within(0.076, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-0.1, some_tolerance)
    end


      
    it "cost_of_capital_in_breakdown_electricity_costs" do
      the_present.should be_within(1.72, some_tolerance)
      the_future.should  be_within(1.91, some_tolerance)
      the_relative_increase.should be_within(11.0, some_tolerance)
      the_absolute_increase.should be_within(0.2, some_tolerance)
    end


      
    it "cost_of_capital_in_breakdown_electricity_costs_corrected_for_electricity_imbalance" do
      the_present.should be_within(1.669, some_tolerance)
      the_future.should  be_within(1.287, some_tolerance)
      the_relative_increase.should be_within(-22.9, some_tolerance)
      the_absolute_increase.should be_within(-0.4, some_tolerance)
    end


      
    it "cost_of_capital_in_breakdown_heating_costs" do
      the_present.should be_within(1.342, some_tolerance)
      the_future.should  be_within(2.822, some_tolerance)
      the_relative_increase.should be_within(110.3, some_tolerance)
      the_absolute_increase.should be_within(1.5, some_tolerance)
    end


          it "costs_of_biomass_chp_in_overview_costs_of_electricity_production" do
      the_value.should be_within(325.749, some_tolerance)
    end

          it "costs_of_co_firing_coal_in_overview_costs_of_electricity_production" do
      the_value.should be_within(172.442, some_tolerance)
    end

          it "costs_of_coal_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(107.682, some_tolerance)
    end

          it "costs_of_coal_chp_in_overview_costs_of_electricity_production" do
      the_value.should be_within(110.414, some_tolerance)
    end

          it "costs_of_coal_conventional_in_overview_costs_of_electricity_production" do
      the_value.should be_within(117.322, some_tolerance)
    end

          it "costs_of_coal_igcc_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(109.295, some_tolerance)
    end

          it "costs_of_coal_igcc_in_overview_costs_of_electricity_production" do
      the_value.should be_within(113.202, some_tolerance)
    end

          it "costs_of_coal_lignite_in_overview_costs_of_electricity_production" do
      the_value.should be_within(78.445, some_tolerance)
    end

          it "costs_of_coal_oxyfuel_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(99.968, some_tolerance)
    end

          it "costs_of_coal_powder_in_overview_costs_of_electricity_production" do
      the_value.should be_within(96.582, some_tolerance)
    end

          it "costs_of_gas_ccgt_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(348.168, some_tolerance)
    end

          it "costs_of_gas_ccgt_in_overview_costs_of_electricity_production" do
      the_value.should be_within(284.018, some_tolerance)
    end

          it "costs_of_gas_chp_central_in_overview_costs_of_electricity_production" do
      the_value.should be_within(375.758, some_tolerance)
    end

          it "costs_of_gas_chp_industry_in_overview_costs_of_electricity_production" do
      the_value.should be_within(454.176, some_tolerance)
    end

          it "costs_of_gas_conventional_in_overview_costs_of_electricity_production" do
      the_value.should be_within(418.645, some_tolerance)
    end

          it "costs_of_gas_turbine_in_overview_costs_of_electricity_production" do
      the_value.should be_within(517.445, some_tolerance)
    end

          it "costs_of_geothermal_well_in_overview_costs_of_electricity_production" do
      the_value.should be_within(92.777, some_tolerance)
    end

          it "costs_of_hydro_mountain_in_overview_costs_of_electricity_production" do
      the_value.should be_within(28.446, some_tolerance)
    end

          it "costs_of_hydro_river_in_overview_costs_of_electricity_production" do
      the_value.should be_within(111.0, some_tolerance)
    end

          it "costs_of_nuclear_3rd_generation_in_overview_costs_of_electricity_production" do
      the_value.should be_within(49.998, some_tolerance)
    end

          it "costs_of_nuclear_conventional_in_overview_costs_of_electricity_production" do
      the_value.should be_within(42.791, some_tolerance)
    end

          it "costs_of_oil_plant_in_overview_costs_of_electricity_production" do
      the_value.should be_within(273.147, some_tolerance)
    end

          it "costs_of_solar_csp_in_overview_costs_of_electricity_production" do
      the_value.should be_within(606.167, some_tolerance)
    end

          it "costs_of_solar_pv_centrally_in_overview_costs_of_electricity_production" do
      the_value.should be_within(61.839, some_tolerance)
    end

          it "costs_of_solar_pv_on_roofs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(55.682, some_tolerance)
    end

          it "costs_of_waste_incinerator_in_overview_costs_of_electricity_production" do
      the_value.should be_within(113.763, some_tolerance)
    end

          it "costs_of_wind_coastal_in_overview_costs_of_electricity_production" do
      the_value.should be_within(54.114, some_tolerance)
    end

          it "costs_of_wind_inland_in_overview_costs_of_electricity_production" do
      the_value.should be_within(60.547, some_tolerance)
    end

          it "costs_of_wind_offshore_in_overview_costs_of_electricity_production" do
      the_value.should be_within(87.491, some_tolerance)
    end

          it "crude_oil_conversion_in_fuel_chain_emissions" do
      the_value.should be_within(75.5, some_tolerance)
    end

          it "crude_oil_extraction_in_fuel_chain_emissions" do
      the_value.should be_within(4.83, some_tolerance)
    end

          it "crude_oil_transportation_in_fuel_chain_emissions" do
      the_value.should be_within(0.88, some_tolerance)
    end

          it "crude_oil_treatment_in_fuel_chain_emissions" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "csp_in_targeted_area_use_for_solar_power" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.391, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.4, some_tolerance)
    end


      
    it "current_cost_electricity_network_in_annual_costs_of_infrastructure" do
      the_present.should be_within(1810000000.0, some_tolerance)
      the_future.should  be_within(1810000000.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "current_cost_gas_network_in_annual_costs_of_infrastructure" do
      the_present.should be_within(1452000000.0, some_tolerance)
      the_future.should  be_within(1452000000.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "depreciation_in_breakdown_converter_costs" do
      the_present.should be_within(0.084, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-0.1, some_tolerance)
    end


      
    it "depreciation_in_breakdown_electricity_costs" do
      the_present.should be_within(1.191, some_tolerance)
      the_future.should  be_within(2.854, some_tolerance)
      the_relative_increase.should be_within(139.7, some_tolerance)
      the_absolute_increase.should be_within(1.7, some_tolerance)
    end


      
    it "depreciation_in_breakdown_electricity_costs_corrected_for_electricity_imbalance" do
      the_present.should be_within(1.155, some_tolerance)
      the_future.should  be_within(1.923, some_tolerance)
      the_relative_increase.should be_within(66.4, some_tolerance)
      the_absolute_increase.should be_within(0.8, some_tolerance)
    end


      
    it "depreciation_in_breakdown_heating_costs" do
      the_present.should be_within(3.33, some_tolerance)
      the_future.should  be_within(5.684, some_tolerance)
      the_relative_increase.should be_within(70.7, some_tolerance)
      the_absolute_increase.should be_within(2.4, some_tolerance)
    end


      
    it "diesel_in_use_of_transport_fuels" do
      the_present.should be_within(278.767, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-278.8, some_tolerance)
    end


          it "diff_1990_in_co2_emissions_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "diff_2010_in_co2_emissions_table" do
      the_value.should be_within(-1.407, some_tolerance)
    end

          it "diff_20xx_in_co2_emissions_table" do
      the_value.should be_within(-0.0, some_tolerance)
    end

      
    it "electric_heaters_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(8.9, some_tolerance)
      the_future.should  be_within(11.575, some_tolerance)
      the_relative_increase.should be_within(30.1, some_tolerance)
      the_absolute_increase.should be_within(2.7, some_tolerance)
    end


      
    it "electric_vehicles_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(0.02, some_tolerance)
      the_future.should  be_within(105.875, some_tolerance)
      the_relative_increase.should be_within(529273.0, some_tolerance)
      the_absolute_increase.should be_within(105.9, some_tolerance)
    end


          it "electricity_agriculture_in_mekko_of_final_demand" do
      the_value.should be_within(34.336, some_tolerance)
    end

          it "electricity_buildings_in_mekko_of_final_demand" do
      the_value.should be_within(70.861, some_tolerance)
    end

      
    it "electricity_cars_in_use_of_final_demand_in_transport" do
      the_present.should be_within(0.02, some_tolerance)
      the_future.should  be_within(60.916, some_tolerance)
      the_relative_increase.should be_within(304479.2, some_tolerance)
      the_absolute_increase.should be_within(60.9, some_tolerance)
    end


      
    it "electricity_demand_excluding_heating_in_use_of_final_demand_in_households" do
      the_present.should be_within(80.926, some_tolerance)
      the_future.should  be_within(66.196, some_tolerance)
      the_relative_increase.should be_within(-18.2, some_tolerance)
      the_absolute_increase.should be_within(-14.7, some_tolerance)
    end


      
    it "electricity_demand_in_effect_of_insulation_in_buildings" do
      the_present.should be_within(120.0, some_tolerance)
      the_future.should  be_within(70.861, some_tolerance)
      the_relative_increase.should be_within(-40.9, some_tolerance)
      the_absolute_increase.should be_within(-49.1, some_tolerance)
    end


      
    it "electricity_demand_in_use_of_final_demand_in_buildings" do
      the_present.should be_within(106.762, some_tolerance)
      the_future.should  be_within(57.297, some_tolerance)
      the_relative_increase.should be_within(-46.3, some_tolerance)
      the_absolute_increase.should be_within(-49.5, some_tolerance)
    end


          it "electricity_households_in_mekko_of_final_demand" do
      the_value.should be_within(77.479, some_tolerance)
    end

      
    it "electricity_import_in_targeted_import_share" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.25, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.3, some_tolerance)
    end


      
    it "electricity_in_breakdown_of_total_costs" do
      the_present.should be_within(9.925, some_tolerance)
      the_future.should  be_within(14.88, some_tolerance)
      the_relative_increase.should be_within(49.9, some_tolerance)
      the_absolute_increase.should be_within(5.0, some_tolerance)
    end


      
    it "electricity_in_breakdown_of_total_costs_per_household" do
      the_present.should be_within(1350.438, some_tolerance)
      the_future.should  be_within(2024.56, some_tolerance)
      the_relative_increase.should be_within(49.9, some_tolerance)
      the_absolute_increase.should be_within(674.1, some_tolerance)
    end


          it "electricity_in_future_energy_imports" do
      the_value.should be_within(-195.476, some_tolerance)
    end

      
    it "electricity_in_source_of_heat_and_electricity_used_in_households" do
      the_present.should be_within(88.93, some_tolerance)
      the_future.should  be_within(77.479, some_tolerance)
      the_relative_increase.should be_within(-12.9, some_tolerance)
      the_absolute_increase.should be_within(-11.5, some_tolerance)
    end


      
    it "electricity_in_use_of_final_demand_in_agriculture" do
      the_present.should be_within(26.6, some_tolerance)
      the_future.should  be_within(34.336, some_tolerance)
      the_relative_increase.should be_within(29.1, some_tolerance)
      the_absolute_increase.should be_within(7.7, some_tolerance)
    end


      
    it "electricity_in_use_of_final_demand_in_industry" do
      the_present.should be_within(137.14, some_tolerance)
      the_future.should  be_within(103.296, some_tolerance)
      the_relative_increase.should be_within(-24.7, some_tolerance)
      the_absolute_increase.should be_within(-33.8, some_tolerance)
    end


      
    it "electricity_in_use_of_final_demand_in_other_sector" do
      the_present.should be_within(1.44, some_tolerance)
      the_future.should  be_within(2.144, some_tolerance)
      the_relative_increase.should be_within(48.9, some_tolerance)
      the_absolute_increase.should be_within(0.7, some_tolerance)
    end


          it "electricity_industry_in_mekko_of_final_demand" do
      the_value.should be_within(121.724, some_tolerance)
    end

          it "electricity_other_in_mekko_of_final_demand" do
      the_value.should be_within(2.144, some_tolerance)
    end

      
    it "electricity_trains_in_use_of_final_demand_in_transport" do
      the_present.should be_within(6.2, some_tolerance)
      the_future.should  be_within(8.135, some_tolerance)
      the_relative_increase.should be_within(31.2, some_tolerance)
      the_absolute_increase.should be_within(1.9, some_tolerance)
    end


          it "electricity_transport_in_mekko_of_final_demand" do
      the_value.should be_within(114.009, some_tolerance)
    end

      
    it "electricity_trucks_in_use_of_final_demand_in_transport" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(44.959, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(45.0, some_tolerance)
    end


          it "electricity_value_in_present_energy_imports" do
      the_value.should be_within(-12.132, some_tolerance)
    end

      
    it "energy_import_in_targeted_import_share" do
      the_present.should be_within(0.294, some_tolerance)
      the_future.should  be_within(0.5, some_tolerance)
      the_relative_increase.should be_within(70.2, some_tolerance)
      the_absolute_increase.should be_within(0.2, some_tolerance)
    end


      
    it "energy_used_for_heat_in_households" do
      the_present.should be_within(10.615, some_tolerance)
      the_future.should  be_within(107.086, some_tolerance)
      the_relative_increase.should be_within(908.9, some_tolerance)
      the_absolute_increase.should be_within(96.5, some_tolerance)
    end


          it "eupvt_solar_panels_in_expert_predictions" do
      the_value.should be_within(nil, some_tolerance)
    end

          it "final_demand_greengas_agriculture_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "final_demand_greengas_buildings_in_gas_flow_to_sectors" do
      the_value.should be_within(17.891, some_tolerance)
    end

          it "final_demand_greengas_energy_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "final_demand_greengas_households_in_gas_flow_to_sectors" do
      the_value.should be_within(23.122, some_tolerance)
    end

          it "final_demand_greengas_industry_in_gas_flow_to_sectors" do
      the_value.should be_within(76.595, some_tolerance)
    end

          it "final_demand_greengas_other_in_gas_flow_to_sectors" do
      the_value.should be_within(25.931, some_tolerance)
    end

          it "final_demand_greengas_transport_in_gas_flow_to_sectors" do
      the_value.should be_within(18.959, some_tolerance)
    end

          it "final_demand_natural_gas_agriculture_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "final_demand_natural_gas_buildings_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "final_demand_natural_gas_energy_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "final_demand_natural_gas_households_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "final_demand_natural_gas_industry_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "final_demand_natural_gas_other_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "final_demand_natural_gas_transport_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "fossil_heat_in_source_of_heat_and_electricity_used_in_households" do
      the_present.should be_within(324.914, some_tolerance)
      the_future.should  be_within(24.672, some_tolerance)
      the_relative_increase.should be_within(-92.4, some_tolerance)
      the_absolute_increase.should be_within(-300.2, some_tolerance)
    end


      
    it "fossil_heat_in_source_of_heat_production" do
      the_present.should be_within(1096.493, some_tolerance)
      the_future.should  be_within(78.222, some_tolerance)
      the_relative_increase.should be_within(-92.9, some_tolerance)
      the_absolute_increase.should be_within(-1018.3, some_tolerance)
    end


      
    it "fossil_heat_in_use_of_final_demand_in_agriculture" do
      the_present.should be_within(94.573, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-94.6, some_tolerance)
    end


      
    it "fossil_heat_in_use_of_final_demand_in_industry" do
      the_present.should be_within(436.446, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-436.4, some_tolerance)
    end


      
    it "fossil_heat_in_use_of_final_demand_in_other_sector" do
      the_present.should be_within(81.331, some_tolerance)
      the_future.should  be_within(36.249, some_tolerance)
      the_relative_increase.should be_within(-55.4, some_tolerance)
      the_absolute_increase.should be_within(-45.1, some_tolerance)
    end


      
    it "fridges_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(15.438, some_tolerance)
      the_future.should  be_within(9.142, some_tolerance)
      the_relative_increase.should be_within(-40.8, some_tolerance)
      the_absolute_increase.should be_within(-6.3, some_tolerance)
    end


      
    it "fuel_cars_in_use_of_final_demand_in_transport" do
      the_present.should be_within(351.992, some_tolerance)
      the_future.should  be_within(20.365, some_tolerance)
      the_relative_increase.should be_within(-94.2, some_tolerance)
      the_absolute_increase.should be_within(-331.6, some_tolerance)
    end


      
    it "fuel_cell_in_source_of_electricity_in_households" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "fuel_cost_in_breakdown_converter_costs" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "fuel_cost_in_breakdown_electricity_costs" do
      the_present.should be_within(6.328, some_tolerance)
      the_future.should  be_within(15.142, some_tolerance)
      the_relative_increase.should be_within(139.3, some_tolerance)
      the_absolute_increase.should be_within(8.8, some_tolerance)
    end


      
    it "fuel_cost_in_breakdown_electricity_costs_corrected_for_electricity_imbalance" do
      the_present.should be_within(6.141, some_tolerance)
      the_future.should  be_within(10.203, some_tolerance)
      the_relative_increase.should be_within(66.2, some_tolerance)
      the_absolute_increase.should be_within(4.1, some_tolerance)
    end


      
    it "fuel_cost_in_breakdown_heating_costs" do
      the_present.should be_within(9.53, some_tolerance)
      the_future.should  be_within(13.454, some_tolerance)
      the_relative_increase.should be_within(41.2, some_tolerance)
      the_absolute_increase.should be_within(3.9, some_tolerance)
    end


      
    it "fuel_domestic_flights_in_use_of_final_demand_in_transport" do
      the_present.should be_within(2.1, some_tolerance)
      the_future.should  be_within(1.8, some_tolerance)
      the_relative_increase.should be_within(-14.3, some_tolerance)
      the_absolute_increase.should be_within(-0.3, some_tolerance)
    end


      
    it "fuel_inland_navigation_in_use_of_final_demand_in_transport" do
      the_present.should be_within(6.6, some_tolerance)
      the_future.should  be_within(6.593, some_tolerance)
      the_relative_increase.should be_within(-0.1, some_tolerance)
      the_absolute_increase.should be_within(-0.0, some_tolerance)
    end


      
    it "fuel_trains_in_use_of_final_demand_in_transport" do
      the_present.should be_within(1.43, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-1.4, some_tolerance)
    end


      
    it "fuel_trucks_in_use_of_final_demand_in_transport" do
      the_present.should be_within(120.868, some_tolerance)
      the_future.should  be_within(15.552, some_tolerance)
      the_relative_increase.should be_within(-87.1, some_tolerance)
      the_absolute_increase.should be_within(-105.3, some_tolerance)
    end


      
    it "fuels_in_breakdown_of_total_costs" do
      the_present.should be_within(9.6, some_tolerance)
      the_future.should  be_within(1.572, some_tolerance)
      the_relative_increase.should be_within(-83.6, some_tolerance)
      the_absolute_increase.should be_within(-8.0, some_tolerance)
    end


      
    it "fuels_in_breakdown_of_total_costs_per_household" do
      the_present.should be_within(1306.209, some_tolerance)
      the_future.should  be_within(213.884, some_tolerance)
      the_relative_increase.should be_within(-83.6, some_tolerance)
      the_absolute_increase.should be_within(-1092.3, some_tolerance)
    end


          it "future_demand_in_source_of_electricity_in_buildings" do
      the_value.should be_within(70.861, some_tolerance)
    end

          it "future_demand_in_source_of_electricity_in_households" do
      the_value.should be_within(77.479, some_tolerance)
    end

          it "future_demand_in_source_of_electricity_production" do
      the_value.should be_within(425.463, some_tolerance)
    end

          it "future_peak_electricity_demand" do
      the_value.should be_within(12936.384, some_tolerance)
    end

          it "future_total_investment_costs_power_production_corrected_for_imbalance" do
      the_value.should be_within(97233444331.796, some_tolerance)
    end

          it "gas_agriculture_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "gas_agriculture_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "gas_buildings_in_mekko_of_final_demand" do
      the_value.should be_within(17.891, some_tolerance)
    end

          it "gas_buildings_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "gas_conversion_in_fuel_chain_emissions" do
      the_value.should be_within(55.279, some_tolerance)
    end

          it "gas_extraction_in_fuel_chain_emissions" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "gas_households_in_mekko_of_final_demand" do
      the_value.should be_within(23.122, some_tolerance)
    end

          it "gas_households_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "gas_in_future_energy_imports" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "gas_in_source_of_electricity_production" do
      the_present.should be_within(264.287, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-264.3, some_tolerance)
    end


          it "gas_industry_in_mekko_of_final_demand" do
      the_value.should be_within(76.595, some_tolerance)
    end

          it "gas_industry_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "gas_other_in_mekko_of_final_demand" do
      the_value.should be_within(25.931, some_tolerance)
    end

          it "gas_other_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "gas_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(3.907, some_tolerance)
    end

          it "gas_plants_in_power_plant_properties" do
      the_value.should be_within(264.446, some_tolerance)
    end

          it "gas_plants_investm_in_power_plant_properties" do
      the_value.should be_within(2965.903, some_tolerance)
    end

          it "gas_plants_prod_in_power_plant_properties" do
      the_value.should be_within(57.574, some_tolerance)
    end

          it "gas_power_plants_plants_in_power_plant_properties" do
      the_value.should be_within(358.726, some_tolerance)
    end

          it "gas_transport_in_mekko_of_final_demand" do
      the_value.should be_within(18.959, some_tolerance)
    end

          it "gas_transport_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "gas_transportation_in_fuel_chain_emissions" do
      the_value.should be_within(0.651, some_tolerance)
    end

          it "gas_treatment_in_fuel_chain_emissions" do
      the_value.should be_within(1.008, some_tolerance)
    end

          it "gas_value_in_present_energy_imports" do
      the_value.should be_within(-639.892, some_tolerance)
    end

      
    it "gasoline_in_use_of_transport_fuels" do
      the_present.should be_within(178.586, some_tolerance)
      the_future.should  be_within(0.082, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-178.5, some_tolerance)
    end


      
    it "geothermal_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(0.004, some_tolerance)
      the_future.should  be_within(0.201, some_tolerance)
      the_relative_increase.should be_within(4721.3, some_tolerance)
      the_absolute_increase.should be_within(0.2, some_tolerance)
    end


      
    it "geothermal_in_source_of_electricity_production" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "geothermal_in_source_of_heat_production" do
      the_present.should be_within(0.1, some_tolerance)
      the_future.should  be_within(39.799, some_tolerance)
      the_relative_increase.should be_within(39698.7, some_tolerance)
      the_absolute_increase.should be_within(39.7, some_tolerance)
    end


          it "greengas_agriculture_in_gas_use_for_electricity_production" do
      the_value.should be_within(11.829, some_tolerance)
    end

          it "greengas_agriculture_in_gas_versus_other_primary_energy" do
      the_value.should be_within(10.859, some_tolerance)
    end

          it "greengas_agriculture_in_mekko_of_primary_demand" do
      the_value.should be_within(10.818, some_tolerance)
    end

          it "greengas_buildings_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.181, some_tolerance)
    end

          it "greengas_buildings_in_gas_versus_other_primary_energy" do
      the_value.should be_within(18.306, some_tolerance)
    end

          it "greengas_buildings_in_mekko_of_primary_demand" do
      the_value.should be_within(18.237, some_tolerance)
    end

          it "greengas_conversion_in_fuel_chain_emissions" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "greengas_energy_in_gas_use_for_electricity_production" do
      the_value.should be_within(88.843, some_tolerance)
    end

          it "greengas_extraction_in_fuel_chain_emissions" do
      the_value.should be_within(17.827, some_tolerance)
    end

          it "greengas_households_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "greengas_households_in_gas_versus_other_primary_energy" do
      the_value.should be_within(23.154, some_tolerance)
    end

          it "greengas_households_in_mekko_of_primary_demand" do
      the_value.should be_within(23.067, some_tolerance)
    end

      
    it "greengas_in_gas_network_mix" do
      the_present.should be_within(0.981, some_tolerance)
      the_future.should  be_within(285.64, some_tolerance)
      the_relative_increase.should be_within(29006.6, some_tolerance)
      the_absolute_increase.should be_within(284.7, some_tolerance)
    end


      
    it "greengas_in_source_of_electricity_production" do
      the_present.should be_within(0.159, some_tolerance)
      the_future.should  be_within(57.574, some_tolerance)
      the_relative_increase.should be_within(36061.7, some_tolerance)
      the_absolute_increase.should be_within(57.4, some_tolerance)
    end


      
    it "greengas_in_use_of_transport_fuels" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(18.959, some_tolerance)
      the_relative_increase.should be_within(6845520.3, some_tolerance)
      the_absolute_increase.should be_within(19.0, some_tolerance)
    end


          it "greengas_industry_in_gas_use_for_electricity_production" do
      the_value.should be_within(21.572, some_tolerance)
    end

          it "greengas_industry_in_gas_versus_other_primary_energy" do
      the_value.should be_within(106.55, some_tolerance)
    end

          it "greengas_industry_in_mekko_of_primary_demand" do
      the_value.should be_within(106.149, some_tolerance)
    end

          it "greengas_other_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.577, some_tolerance)
    end

          it "greengas_other_in_gas_versus_other_primary_energy" do
      the_value.should be_within(26.795, some_tolerance)
    end

          it "greengas_other_in_mekko_of_primary_demand" do
      the_value.should be_within(26.694, some_tolerance)
    end

          it "greengas_to_electricity_production_agriculture_in_gas_flow_to_sectors" do
      the_value.should be_within(11.829, some_tolerance)
    end

          it "greengas_to_electricity_production_buildings_in_gas_flow_to_sectors" do
      the_value.should be_within(0.181, some_tolerance)
    end

          it "greengas_to_electricity_production_energy_in_gas_flow_to_sectors" do
      the_value.should be_within(88.843, some_tolerance)
    end

          it "greengas_to_electricity_production_households_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "greengas_to_electricity_production_industry_in_gas_flow_to_sectors" do
      the_value.should be_within(21.572, some_tolerance)
    end

          it "greengas_to_electricity_production_other_in_gas_flow_to_sectors" do
      the_value.should be_within(0.577, some_tolerance)
    end

          it "greengas_to_electricity_production_transport_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "greengas_transport_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "greengas_transport_in_gas_versus_other_primary_energy" do
      the_value.should be_within(39.547, some_tolerance)
    end

          it "greengas_transport_in_mekko_of_primary_demand" do
      the_value.should be_within(39.398, some_tolerance)
    end

          it "greengas_transportation_in_fuel_chain_emissions" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "greengas_treatment_in_fuel_chain_emissions" do
      the_value.should be_within(1.662, some_tolerance)
    end

      
    it "growth_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(227.41, some_tolerance)
      the_future.should  be_within(185.662, some_tolerance)
      the_relative_increase.should be_within(-18.4, some_tolerance)
      the_absolute_increase.should be_within(-41.7, some_tolerance)
    end


      
    it "heat_demand_buildings_in_effect_of_insulation_in_buildings" do
      the_present.should be_within(200.153, some_tolerance)
      the_future.should  be_within(130.084, some_tolerance)
      the_relative_increase.should be_within(-35.0, some_tolerance)
      the_absolute_increase.should be_within(-70.1, some_tolerance)
    end


      
    it "heat_demand_buildings_in_use_of_final_demand_in_buildings" do
      the_present.should be_within(144.11, some_tolerance)
      the_future.should  be_within(65.679, some_tolerance)
      the_relative_increase.should be_within(-54.4, some_tolerance)
      the_absolute_increase.should be_within(-78.4, some_tolerance)
    end


      
    it "heat_demand_including_electric_heating_in_effect_of_insulation_in_households" do
      the_present.should be_within(299.329, some_tolerance)
      the_future.should  be_within(172.503, some_tolerance)
      the_relative_increase.should be_within(-42.4, some_tolerance)
      the_absolute_increase.should be_within(-126.8, some_tolerance)
    end


      
    it "heat_demand_including_electric_heating_in_use_of_final_demand_in_households" do
      the_present.should be_within(299.329, some_tolerance)
      the_future.should  be_within(172.503, some_tolerance)
      the_relative_increase.should be_within(-42.4, some_tolerance)
      the_absolute_increase.should be_within(-126.8, some_tolerance)
    end


      
    it "heat_from_biomass_in_effect_of_insulation_in_households2" do
      the_present.should be_within(9.503, some_tolerance)
      the_future.should  be_within(77.969, some_tolerance)
      the_relative_increase.should be_within(720.5, some_tolerance)
      the_absolute_increase.should be_within(68.5, some_tolerance)
    end


      
    it "heat_from_biomass_in_source_of_heat_and_electricity_used_in_households" do
      the_present.should be_within(7.642, some_tolerance)
      the_future.should  be_within(42.629, some_tolerance)
      the_relative_increase.should be_within(457.8, some_tolerance)
      the_absolute_increase.should be_within(35.0, some_tolerance)
    end


      
    it "heat_from_biomass_in_source_of_heat_in_agriculture" do
      the_present.should be_within(0.744, some_tolerance)
      the_future.should  be_within(52.172, some_tolerance)
      the_relative_increase.should be_within(6914.9, some_tolerance)
      the_absolute_increase.should be_within(51.4, some_tolerance)
    end


      
    it "heat_from_biomass_in_source_of_heat_in_buildings" do
      the_present.should be_within(0.07, some_tolerance)
      the_future.should  be_within(29.865, some_tolerance)
      the_relative_increase.should be_within(42554.3, some_tolerance)
      the_absolute_increase.should be_within(29.8, some_tolerance)
    end


      
    it "heat_from_biomass_in_source_of_heat_in_industry" do
      the_present.should be_within(2.785, some_tolerance)
      the_future.should  be_within(401.458, some_tolerance)
      the_relative_increase.should be_within(14316.1, some_tolerance)
      the_absolute_increase.should be_within(398.7, some_tolerance)
    end


      
    it "heat_from_biomass_in_source_of_heat_production" do
      the_present.should be_within(15.76, some_tolerance)
      the_future.should  be_within(778.21, some_tolerance)
      the_relative_increase.should be_within(4837.8, some_tolerance)
      the_absolute_increase.should be_within(762.5, some_tolerance)
    end


      
    it "heat_from_biomass_in_use_of_final_demand_in_agriculture" do
      the_present.should be_within(0.744, some_tolerance)
      the_future.should  be_within(52.172, some_tolerance)
      the_relative_increase.should be_within(6914.9, some_tolerance)
      the_absolute_increase.should be_within(51.4, some_tolerance)
    end


      
    it "heat_from_biomass_in_use_of_final_demand_in_industry" do
      the_present.should be_within(3.464, some_tolerance)
      the_future.should  be_within(501.822, some_tolerance)
      the_relative_increase.should be_within(14385.9, some_tolerance)
      the_absolute_increase.should be_within(498.4, some_tolerance)
    end


      
    it "heat_from_biomass_in_use_of_final_demand_in_other_sector" do
      the_present.should be_within(2.392, some_tolerance)
      the_future.should  be_within(30.948, some_tolerance)
      the_relative_increase.should be_within(1193.9, some_tolerance)
      the_absolute_increase.should be_within(28.6, some_tolerance)
    end


      
    it "heat_from_chp_in_source_of_heat_in_agriculture" do
      the_present.should be_within(55.0, some_tolerance)
      the_future.should  be_within(0.096, some_tolerance)
      the_relative_increase.should be_within(-99.8, some_tolerance)
      the_absolute_increase.should be_within(-54.9, some_tolerance)
    end


      
    it "heat_from_chp_in_source_of_heat_in_industry" do
      the_present.should be_within(153.04, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-153.0, some_tolerance)
    end


      
    it "heat_from_chp_in_source_of_heat_production" do
      the_present.should be_within(231.775, some_tolerance)
      the_future.should  be_within(247.323, some_tolerance)
      the_relative_increase.should be_within(6.7, some_tolerance)
      the_absolute_increase.should be_within(15.5, some_tolerance)
    end


      
    it "heat_from_chp_in_use_of_final_demand_in_industry" do
      the_present.should be_within(153.04, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-153.0, some_tolerance)
    end


      
    it "heat_from_coal_in_source_of_heat_in_industry" do
      the_present.should be_within(18.072, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-18.1, some_tolerance)
    end


      
    it "heat_from_district_heating_in_source_of_heat_used_in_households" do
      the_present.should be_within(9.266, some_tolerance)
      the_future.should  be_within(61.697, some_tolerance)
      the_relative_increase.should be_within(565.8, some_tolerance)
      the_absolute_increase.should be_within(52.4, some_tolerance)
    end


      
    it "heat_from_electricity_in_effect_of_insulation_in_households2" do
      the_present.should be_within(5.441, some_tolerance)
      the_future.should  be_within(8.357, some_tolerance)
      the_relative_increase.should be_within(53.6, some_tolerance)
      the_absolute_increase.should be_within(2.9, some_tolerance)
    end


      
    it "heat_from_electricity_in_source_of_heat_in_buildings" do
      the_present.should be_within(1.828, some_tolerance)
      the_future.should  be_within(6.575, some_tolerance)
      the_relative_increase.should be_within(259.8, some_tolerance)
      the_absolute_increase.should be_within(4.7, some_tolerance)
    end


      
    it "heat_from_electricity_in_source_of_heat_production" do
      the_present.should be_within(28.376, some_tolerance)
      the_future.should  be_within(43.315, some_tolerance)
      the_relative_increase.should be_within(52.6, some_tolerance)
      the_absolute_increase.should be_within(14.9, some_tolerance)
    end


      
    it "heat_from_electricity_in_source_of_heat_used_in_households" do
      the_present.should be_within(5.441, some_tolerance)
      the_future.should  be_within(8.357, some_tolerance)
      the_relative_increase.should be_within(53.6, some_tolerance)
      the_absolute_increase.should be_within(2.9, some_tolerance)
    end


      
    it "heat_from_fossil_fuels_in_effect_of_insulation_in_households2" do
      the_present.should be_within(285.544, some_tolerance)
      the_future.should  be_within(22.121, some_tolerance)
      the_relative_increase.should be_within(-92.3, some_tolerance)
      the_absolute_increase.should be_within(-263.4, some_tolerance)
    end


      
    it "heat_from_fossil_fuels_in_source_of_district_heating_in_buildings" do
      the_present.should be_within(8.914, some_tolerance)
      the_future.should  be_within(0.013, some_tolerance)
      the_relative_increase.should be_within(-99.9, some_tolerance)
      the_absolute_increase.should be_within(-8.9, some_tolerance)
    end


      
    it "heat_from_fossil_fuels_in_source_of_district_heating_in_households" do
      the_present.should be_within(10.739, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-10.7, some_tolerance)
    end


      
    it "heat_from_fossil_fuels_in_source_of_heat_in_buildings" do
      the_present.should be_within(140.667, some_tolerance)
      the_future.should  be_within(3.258, some_tolerance)
      the_relative_increase.should be_within(-97.7, some_tolerance)
      the_absolute_increase.should be_within(-137.4, some_tolerance)
    end


      
    it "heat_from_fossil_fuels_in_source_of_heat_used_in_households" do
      the_present.should be_within(273.799, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-273.8, some_tolerance)
    end


      
    it "heat_from_gas_in_source_of_heat_in_agriculture" do
      the_present.should be_within(27.074, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-27.1, some_tolerance)
    end


      
    it "heat_from_gas_in_source_of_heat_in_industry" do
      the_present.should be_within(200.489, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-200.5, some_tolerance)
    end


      
    it "heat_from_oil_in_source_of_heat_in_agriculture" do
      the_present.should be_within(12.619, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-12.6, some_tolerance)
    end


      
    it "heat_from_oil_in_source_of_heat_in_industry" do
      the_present.should be_within(158.605, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-158.6, some_tolerance)
    end


      
    it "heat_from_renewables_in_source_of_district_heating_in_buildings" do
      the_present.should be_within(0.086, some_tolerance)
      the_future.should  be_within(4.089, some_tolerance)
      the_relative_increase.should be_within(4641.4, some_tolerance)
      the_absolute_increase.should be_within(4.0, some_tolerance)
    end


      
    it "heat_from_renewables_in_source_of_district_heating_in_households" do
      the_present.should be_within(0.621, some_tolerance)
      the_future.should  be_within(64.49, some_tolerance)
      the_relative_increase.should be_within(10281.7, some_tolerance)
      the_absolute_increase.should be_within(63.9, some_tolerance)
    end


      
    it "heat_from_renewables_in_source_of_heat_used_in_buildings" do
      the_present.should be_within(1.653, some_tolerance)
      the_future.should  be_within(56.342, some_tolerance)
      the_relative_increase.should be_within(3308.3, some_tolerance)
      the_absolute_increase.should be_within(54.7, some_tolerance)
    end


      
    it "heat_from_renewables_in_source_of_heat_used_in_households" do
      the_present.should be_within(10.823, some_tolerance)
      the_future.should  be_within(102.449, some_tolerance)
      the_relative_increase.should be_within(846.6, some_tolerance)
      the_absolute_increase.should be_within(91.6, some_tolerance)
    end


      
    it "heat_from_waste_in_source_of_heat_production" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_hot_water_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(12.45, some_tolerance)
      the_future.should  be_within(25.315, some_tolerance)
      the_relative_increase.should be_within(103.3, some_tolerance)
      the_absolute_increase.should be_within(12.9, some_tolerance)
    end


      
    it "heat_in_breakdown_of_total_costs" do
      the_present.should be_within(16.858, some_tolerance)
      the_future.should  be_within(24.653, some_tolerance)
      the_relative_increase.should be_within(46.2, some_tolerance)
      the_absolute_increase.should be_within(7.8, some_tolerance)
    end


      
    it "heat_in_breakdown_of_total_costs_per_household" do
      the_present.should be_within(2293.784, some_tolerance)
      the_future.should  be_within(3354.364, some_tolerance)
      the_relative_increase.should be_within(46.2, some_tolerance)
      the_absolute_increase.should be_within(1060.6, some_tolerance)
    end


          it "heat_in_future_energy_imports" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "heat_in_use_of_electricity_in_buildings" do
      the_present.should be_within(1.828, some_tolerance)
      the_future.should  be_within(6.575, some_tolerance)
      the_relative_increase.should be_within(259.8, some_tolerance)
      the_absolute_increase.should be_within(4.7, some_tolerance)
    end


          it "heat_value_in_present_energy_imports" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "heatpumps_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(0.063, some_tolerance)
      the_future.should  be_within(15.345, some_tolerance)
      the_relative_increase.should be_within(24173.9, some_tolerance)
      the_absolute_increase.should be_within(15.3, some_tolerance)
    end


      
    it "heavy_fuel_oil_in_use_of_transport_fuels" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "high_voltage_network_in_annual_costs_of_infrastructure" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(830642326.677, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(830642326.7, some_tolerance)
    end


          it "hot_water_agriculture_in_mekko_of_final_demand" do
      the_value.should be_within(0.096, some_tolerance)
    end

          it "hot_water_buildings_in_mekko_of_final_demand" do
      the_value.should be_within(4.102, some_tolerance)
    end

      
    it "hot_water_demand_in_use_of_final_demand_in_households" do
      the_present.should be_within(95.748, some_tolerance)
      the_future.should  be_within(112.343, some_tolerance)
      the_relative_increase.should be_within(17.3, some_tolerance)
      the_absolute_increase.should be_within(16.6, some_tolerance)
    end


      
    it "hot_water_from_district_heating_in_source_of_hot_water_in_households" do
      the_present.should be_within(2.238, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-2.2, some_tolerance)
    end


      
    it "hot_water_from_electricity_in_source_of_hot_water_in_households" do
      the_present.should be_within(7.036, some_tolerance)
      the_future.should  be_within(16.264, some_tolerance)
      the_relative_increase.should be_within(131.1, some_tolerance)
      the_absolute_increase.should be_within(9.2, some_tolerance)
    end


      
    it "hot_water_from_fossil_fuels_in_source_of_hot_water_in_households" do
      the_present.should be_within(85.482, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-85.5, some_tolerance)
    end


      
    it "hot_water_from_renewables_in_source_of_hot_water_in_households" do
      the_present.should be_within(0.991, some_tolerance)
      the_future.should  be_within(96.079, some_tolerance)
      the_relative_increase.should be_within(9592.3, some_tolerance)
      the_absolute_increase.should be_within(95.1, some_tolerance)
    end


          it "hot_water_households_in_mekko_of_final_demand" do
      the_value.should be_within(64.49, some_tolerance)
    end

          it "hot_water_industry_in_mekko_of_final_demand" do
      the_value.should be_within(208.814, some_tolerance)
    end

          it "hot_water_other_in_mekko_of_final_demand" do
      the_value.should be_within(4.212, some_tolerance)
    end

          it "hot_water_transport_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "hv_capacity_total_in_impact_on_electricity_grid" do
      the_value.should be_within(12600.35, some_tolerance)
    end

          it "hv_mv_capacity_total_in_impact_on_electricity_grid" do
      the_value.should be_within(42000.0, some_tolerance)
    end

          it "hv_mv_capacity_used_in_impact_on_electricity_grid" do
      the_value.should be_within(30000.0, some_tolerance)
    end

          it "hv_mv_costs_coefficient_in_impact_on_electricity_grid" do
      the_value.should be_within(53846.154, some_tolerance)
    end

          it "hv_mv_delta_peak_load_max_in_impact_on_electricity_grid" do
      the_value.should be_within(27644.052, some_tolerance)
    end

          it "hv_mv_networkcosts_in_impact_on_electricity_grid" do
      the_value.should be_within(842.372, some_tolerance)
    end

          it "hv_mv_required_expansion_in_impact_on_electricity_grid" do
      the_value.should be_within(15644.052, some_tolerance)
    end

      
    it "hv_net_in_additional_infrastructure_investments" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(12600.35, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(12600.4, some_tolerance)
    end


      
    it "hydro_in_source_of_electricity_production" do
      the_present.should be_within(0.36, some_tolerance)
      the_future.should  be_within(0.642, some_tolerance)
      the_relative_increase.should be_within(78.4, some_tolerance)
      the_absolute_increase.should be_within(0.3, some_tolerance)
    end


          it "imported_electricity_agriculture_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "imported_electricity_buildings_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "imported_electricity_households_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "imported_electricity_industry_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "imported_electricity_other_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "imported_electricity_transport_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "imported_heat_in_source_of_heat_production" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "insulation_savings_buildings_in_effect_of_insulation_in_buildings" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(86.722, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(86.7, some_tolerance)
    end


      
    it "insulation_savings_new_houses_in_effect_of_insulation_in_households" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(14.41, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(14.4, some_tolerance)
    end


      
    it "insulation_savings_old_houses_in_effect_of_insulation_in_households" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(92.586, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(92.6, some_tolerance)
    end


          it "investment_for_biomass_chp_in_overview_costs_of_electricity_production" do
      the_value.should be_within(2.06, some_tolerance)
    end

          it "investment_for_co_firing_coal_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.771, some_tolerance)
    end

          it "investment_for_coal_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(2.388, some_tolerance)
    end

          it "investment_for_coal_chp_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.683, some_tolerance)
    end

          it "investment_for_coal_conventional_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.987, some_tolerance)
    end

          it "investment_for_coal_igcc_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(2.59, some_tolerance)
    end

          it "investment_for_coal_igcc_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.928, some_tolerance)
    end

          it "investment_for_coal_lignite_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.284, some_tolerance)
    end

          it "investment_for_coal_oxyfuel_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(3.68, some_tolerance)
    end

          it "investment_for_coal_powder_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.5, some_tolerance)
    end

          it "investment_for_gas_ccgt_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.071, some_tolerance)
    end

          it "investment_for_gas_ccgt_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.759, some_tolerance)
    end

          it "investment_for_gas_chp_central_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.001, some_tolerance)
    end

          it "investment_for_gas_chp_industry_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.646, some_tolerance)
    end

          it "investment_for_gas_conventional_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.396, some_tolerance)
    end

          it "investment_for_gas_turbine_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.6, some_tolerance)
    end

          it "investment_for_geothermal_well_in_overview_costs_of_electricity_production" do
      the_value.should be_within(6.462, some_tolerance)
    end

          it "investment_for_hydro_mountain_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.236, some_tolerance)
    end

          it "investment_for_hydro_river_in_overview_costs_of_electricity_production" do
      the_value.should be_within(3.6, some_tolerance)
    end

          it "investment_for_nuclear_3rd_generation_in_overview_costs_of_electricity_production" do
      the_value.should be_within(3.452, some_tolerance)
    end

          it "investment_for_nuclear_conventional_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.939, some_tolerance)
    end

          it "investment_for_oil_plant_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.49, some_tolerance)
    end

          it "investment_for_solar_csp_in_overview_costs_of_electricity_production" do
      the_value.should be_within(3.5, some_tolerance)
    end

          it "investment_for_solar_pv_centrally_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.453, some_tolerance)
    end

          it "investment_for_solar_pv_on_roofs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.453, some_tolerance)
    end

          it "investment_for_waste_incinerator_in_overview_costs_of_electricity_production" do
      the_value.should be_within(5.245, some_tolerance)
    end

          it "investment_for_wind_coastal_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.877, some_tolerance)
    end

          it "investment_for_wind_inland_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.877, some_tolerance)
    end

          it "investment_for_wind_offshore_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.405, some_tolerance)
    end

      
    it "kerosine_in_use_of_transport_fuels" do
      the_present.should be_within(2.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-2.0, some_tolerance)
    end


      
    it "lighting_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(26.513, some_tolerance)
      the_future.should  be_within(18.79, some_tolerance)
      the_relative_increase.should be_within(-29.1, some_tolerance)
      the_absolute_increase.should be_within(-7.7, some_tolerance)
    end


      
    it "lighting_in_use_of_electricity_in_buildings" do
      the_present.should be_within(72.597, some_tolerance)
      the_future.should  be_within(52.13, some_tolerance)
      the_relative_increase.should be_within(-28.2, some_tolerance)
      the_absolute_increase.should be_within(-20.5, some_tolerance)
    end


      
    it "lighting_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(14.229, some_tolerance)
      the_future.should  be_within(4.39, some_tolerance)
      the_relative_increase.should be_within(-69.1, some_tolerance)
      the_absolute_increase.should be_within(-9.8, some_tolerance)
    end


          it "lignite_agriculture_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "lignite_buildings_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "lignite_households_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "lignite_industry_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "lignite_other_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "lignite_transport_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "low_voltage_network_in_annual_costs_of_infrastructure" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(179377207.581, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(179377207.6, some_tolerance)
    end


      
    it "lpg_in_use_of_transport_fuels" do
      the_present.should be_within(13.6, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-13.6, some_tolerance)
    end


          it "lv_capacity_total_in_impact_on_electricity_grid" do
      the_value.should be_within(74803.2, some_tolerance)
    end

          it "lv_capacity_used_in_impact_on_electricity_grid" do
      the_value.should be_within(23376.0, some_tolerance)
    end

          it "lv_costs_coefficient_in_impact_on_electricity_grid" do
      the_value.should be_within(457051.659, some_tolerance)
    end

          it "lv_delta_peak_load_max_in_impact_on_electricity_grid" do
      the_value.should be_within(48960.182, some_tolerance)
    end

      
    it "lv_mv_transformer_in_additional_infrastructure_investments" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(1522.259, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(1522.3, some_tolerance)
    end


      
    it "lv_net_in_additional_infrastructure_investments" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


          it "lv_networkcosts_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "lv_required_expansion_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "media_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(13.784, some_tolerance)
      the_future.should  be_within(8.479, some_tolerance)
      the_relative_increase.should be_within(-38.5, some_tolerance)
      the_absolute_increase.should be_within(-5.3, some_tolerance)
    end


      
    it "medium_voltage_network_in_annual_costs_of_infrastructure" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(954572211.522, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(954572211.5, some_tolerance)
    end


          it "merit_order_central_gas_chp_capacity_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "merit_order_central_gas_chp_full_load_hours_in_merit_order_table" do
      the_present.should be_within(846.1, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-846.1, some_tolerance)
    end


          it "merit_order_central_gas_chp_operating_costs_in_merit_order_table" do
      the_value.should be_within(355.822, some_tolerance)
    end

          it "merit_order_central_gas_chp_position_in_merit_order_table" do
      the_value.should be_within(1000.0, some_tolerance)
    end

          it "merit_order_central_gas_chp_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(846.1, some_tolerance)
    end

          it "merit_order_co_firing_coal_capacity_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "merit_order_co_firing_coal_full_load_hours_in_merit_order_table" do
      the_present.should be_within(2020.7, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-2020.7, some_tolerance)
    end


          it "merit_order_co_firing_coal_operating_costs_in_merit_order_table" do
      the_value.should be_within(145.983, some_tolerance)
    end

          it "merit_order_co_firing_coal_position_in_merit_order_table" do
      the_value.should be_within(1000.0, some_tolerance)
    end

          it "merit_order_co_firing_coal_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(2020.7, some_tolerance)
    end

          it "merit_order_coal_chp_capacity_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "merit_order_coal_chp_full_load_hours_in_merit_order_table" do
      the_present.should be_within(7530.1, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-7530.1, some_tolerance)
    end


          it "merit_order_coal_chp_operating_costs_in_merit_order_table" do
      the_value.should be_within(83.271, some_tolerance)
    end

          it "merit_order_coal_chp_position_in_merit_order_table" do
      the_value.should be_within(1000.0, some_tolerance)
    end

          it "merit_order_coal_chp_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(7530.1, some_tolerance)
    end

          it "merit_order_coal_conv_capacity_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "merit_order_coal_conv_full_load_hours_in_merit_order_table" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


          it "merit_order_coal_conv_operating_costs_in_merit_order_table" do
      the_value.should be_within(94.6, some_tolerance)
    end

          it "merit_order_coal_conv_position_in_merit_order_table" do
      the_value.should be_within(1000.0, some_tolerance)
    end

          it "merit_order_coal_conv_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "merit_order_coal_igcc_capacity_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "merit_order_coal_igcc_ccs_capacity_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "merit_order_coal_igcc_ccs_full_load_hours_in_merit_order_table" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


          it "merit_order_coal_igcc_ccs_operating_costs_in_merit_order_table" do
      the_value.should be_within(63.741, some_tolerance)
    end

          it "merit_order_coal_igcc_ccs_position_in_merit_order_table" do
      the_value.should be_within(1000.0, some_tolerance)
    end

          it "merit_order_coal_igcc_ccs_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "merit_order_coal_igcc_full_load_hours_in_merit_order_table" do
      the_present.should be_within(7884.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-7884.0, some_tolerance)
    end


          it "merit_order_coal_igcc_operating_costs_in_merit_order_table" do
      the_value.should be_within(74.616, some_tolerance)
    end

          it "merit_order_coal_igcc_position_in_merit_order_table" do
      the_value.should be_within(1000.0, some_tolerance)
    end

          it "merit_order_coal_igcc_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(7884.0, some_tolerance)
    end

          it "merit_order_coal_pwd_capacity_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "merit_order_coal_pwd_ccs_capacity_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "merit_order_coal_pwd_ccs_full_load_hours_in_merit_order_table" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


          it "merit_order_coal_pwd_ccs_operating_costs_in_merit_order_table" do
      the_value.should be_within(71.52, some_tolerance)
    end

          it "merit_order_coal_pwd_ccs_position_in_merit_order_table" do
      the_value.should be_within(1000.0, some_tolerance)
    end

          it "merit_order_coal_pwd_ccs_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "merit_order_coal_pwd_full_load_hours_in_merit_order_table" do
      the_present.should be_within(7706.3, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-7706.3, some_tolerance)
    end


          it "merit_order_coal_pwd_operating_costs_in_merit_order_table" do
      the_value.should be_within(74.219, some_tolerance)
    end

          it "merit_order_coal_pwd_position_in_merit_order_table" do
      the_value.should be_within(1000.0, some_tolerance)
    end

          it "merit_order_coal_pwd_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(7706.3, some_tolerance)
    end

          it "merit_order_gas_ccgt_capacity_in_merit_order_table" do
      the_value.should be_within(1440.0, some_tolerance)
    end

          it "merit_order_gas_ccgt_ccs_capacity_in_merit_order_table" do
      the_value.should be_within(565.25, some_tolerance)
    end

      
    it "merit_order_gas_ccgt_ccs_full_load_hours_in_merit_order_table" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(5117.1, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(5117.1, some_tolerance)
    end


          it "merit_order_gas_ccgt_ccs_operating_costs_in_merit_order_table" do
      the_value.should be_within(324.271, some_tolerance)
    end

          it "merit_order_gas_ccgt_ccs_position_in_merit_order_table" do
      the_value.should be_within(4.0, some_tolerance)
    end

          it "merit_order_gas_ccgt_ccs_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "merit_order_gas_ccgt_full_load_hours_in_merit_order_table" do
      the_present.should be_within(4892.6, some_tolerance)
      the_future.should  be_within(6283.0, some_tolerance)
      the_relative_increase.should be_within(28.4, some_tolerance)
      the_absolute_increase.should be_within(1390.4, some_tolerance)
    end


          it "merit_order_gas_ccgt_operating_costs_in_merit_order_table" do
      the_value.should be_within(269.934, some_tolerance)
    end

          it "merit_order_gas_ccgt_position_in_merit_order_table" do
      the_value.should be_within(2.0, some_tolerance)
    end

          it "merit_order_gas_ccgt_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(4892.6, some_tolerance)
    end

          it "merit_order_gas_conv_capacity_in_merit_order_table" do
      the_value.should be_within(712.0, some_tolerance)
    end

      
    it "merit_order_gas_conv_full_load_hours_in_merit_order_table" do
      the_present.should be_within(58.2, some_tolerance)
      the_future.should  be_within(5139.6, some_tolerance)
      the_relative_increase.should be_within(8730.9, some_tolerance)
      the_absolute_increase.should be_within(5081.4, some_tolerance)
    end


          it "merit_order_gas_conv_operating_costs_in_merit_order_table" do
      the_value.should be_within(392.453, some_tolerance)
    end

          it "merit_order_gas_conv_position_in_merit_order_table" do
      the_value.should be_within(5.0, some_tolerance)
    end

          it "merit_order_gas_conv_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(58.2, some_tolerance)
    end

          it "merit_order_gas_turbine_capacity_in_merit_order_table" do
      the_value.should be_within(192.531, some_tolerance)
    end

      
    it "merit_order_gas_turbine_full_load_hours_in_merit_order_table" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(4876.1, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(4876.1, some_tolerance)
    end


          it "merit_order_gas_turbine_operating_costs_in_merit_order_table" do
      the_value.should be_within(462.445, some_tolerance)
    end

          it "merit_order_gas_turbine_position_in_merit_order_table" do
      the_value.should be_within(6.0, some_tolerance)
    end

          it "merit_order_gas_turbine_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "merit_order_must_run_capacity_in_merit_order_table" do
      the_value.should be_within(16452.795, some_tolerance)
    end

      
    it "merit_order_must_run_full_load_hours_in_merit_order_table" do
      the_present.should be_within(4824.382, some_tolerance)
      the_future.should  be_within(2932.286, some_tolerance)
      the_relative_increase.should be_within(-39.2, some_tolerance)
      the_absolute_increase.should be_within(-1892.1, some_tolerance)
    end


          it "merit_order_must_run_operating_costs_in_merit_order_table" do
      the_value.should be_within(239.996, some_tolerance)
    end

          it "merit_order_must_run_position_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "merit_order_must_run_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(4824.382, some_tolerance)
    end

          it "merit_order_nuclear_iii_capacity_in_merit_order_table" do
      the_value.should be_within(94.669, some_tolerance)
    end

      
    it "merit_order_nuclear_iii_full_load_hours_in_merit_order_table" do
      the_present.should be_within(7884.0, some_tolerance)
      the_future.should  be_within(7784.1, some_tolerance)
      the_relative_increase.should be_within(-1.3, some_tolerance)
      the_absolute_increase.should be_within(-99.9, some_tolerance)
    end


          it "merit_order_nuclear_iii_operating_costs_in_merit_order_table" do
      the_value.should be_within(5.894, some_tolerance)
    end

          it "merit_order_nuclear_iii_position_in_merit_order_table" do
      the_value.should be_within(1.0, some_tolerance)
    end

          it "merit_order_nuclear_iii_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(7884.0, some_tolerance)
    end

          it "merit_order_oil_plant_capacity_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "merit_order_oil_plant_full_load_hours_in_merit_order_table" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


          it "merit_order_oil_plant_operating_costs_in_merit_order_table" do
      the_value.should be_within(255.539, some_tolerance)
    end

          it "merit_order_oil_plant_position_in_merit_order_table" do
      the_value.should be_within(1000.0, some_tolerance)
    end

          it "merit_order_oil_plant_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "merit_order_solar_pv_capacity_in_merit_order_table" do
      the_value.should be_within(63057.953, some_tolerance)
    end

      
    it "merit_order_solar_pv_full_load_hours_in_merit_order_table" do
      the_present.should be_within(1000.0, some_tolerance)
      the_future.should  be_within(1002.341, some_tolerance)
      the_relative_increase.should be_within(0.2, some_tolerance)
      the_absolute_increase.should be_within(2.3, some_tolerance)
    end


          it "merit_order_solar_pv_operating_costs_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "merit_order_solar_pv_position_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "merit_order_solar_pv_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(1000.0, some_tolerance)
    end

          it "merit_order_wind_turbines_capacity_in_merit_order_table" do
      the_value.should be_within(19624.368, some_tolerance)
    end

      
    it "merit_order_wind_turbines_full_load_hours_in_merit_order_table" do
      the_present.should be_within(2320.968, some_tolerance)
      the_future.should  be_within(2857.184, some_tolerance)
      the_relative_increase.should be_within(23.1, some_tolerance)
      the_absolute_increase.should be_within(536.2, some_tolerance)
    end


          it "merit_order_wind_turbines_operating_costs_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "merit_order_wind_turbines_position_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "merit_order_wind_turbines_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(2320.968, some_tolerance)
    end

          it "micro_chp_in_comparison_of_demand_micro_chp_versus_conventional" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "micro_chp_in_source_of_electricity_in_households" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "minimum_available_capacity_in_security_of_supply" do
      the_present.should be_within(18073.648, some_tolerance)
      the_future.should  be_within(23848.894, some_tolerance)
      the_relative_increase.should be_within(32.0, some_tolerance)
      the_absolute_increase.should be_within(5775.2, some_tolerance)
    end


          it "mv_distribution_capacity_total_in_impact_on_electricity_grid" do
      the_value.should be_within(30301.7, some_tolerance)
    end

          it "mv_distribution_capacity_used_in_impact_on_electricity_grid" do
      the_value.should be_within(20619.5, some_tolerance)
    end

          it "mv_distribution_costs_coefficient_in_impact_on_electricity_grid" do
      the_value.should be_within(200000.0, some_tolerance)
    end

          it "mv_distribution_delta_peak_load_max_in_impact_on_electricity_grid" do
      the_value.should be_within(27644.052, some_tolerance)
    end

      
    it "mv_distribution_in_additional_infrastructure_investments" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(842.372, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(842.4, some_tolerance)
    end


          it "mv_distribution_networkcosts_in_impact_on_electricity_grid" do
      the_value.should be_within(3592.37, some_tolerance)
    end

          it "mv_distribution_required_expansion_in_impact_on_electricity_grid" do
      the_value.should be_within(17961.852, some_tolerance)
    end

      
    it "mv_hv_transformer_in_additional_infrastructure_investments" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(5647.863, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(5647.9, some_tolerance)
    end


          it "mv_transport_capacity_total_in_impact_on_electricity_grid" do
      the_value.should be_within(21340.0, some_tolerance)
    end

          it "mv_transport_capacity_used_in_impact_on_electricity_grid" do
      the_value.should be_within(16490.0, some_tolerance)
    end

          it "mv_transport_costs_coefficient_in_impact_on_electricity_grid" do
      the_value.should be_within(150000.0, some_tolerance)
    end

          it "mv_transport_delta_peak_load_max_in_impact_on_electricity_grid" do
      the_value.should be_within(42502.419, some_tolerance)
    end

      
    it "mv_transport_in_additional_infrastructure_investments" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(3592.37, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(3592.4, some_tolerance)
    end


          it "mv_transport_networkcosts_in_impact_on_electricity_grid" do
      the_value.should be_within(5647.863, some_tolerance)
    end

          it "mv_transport_required_expansion_in_impact_on_electricity_grid" do
      the_value.should be_within(37652.419, some_tolerance)
    end

          it "mvlv_capacity_total_in_impact_on_electricity_grid" do
      the_value.should be_within(42076.8, some_tolerance)
    end

          it "mvlv_capacity_used_in_impact_on_electricity_grid" do
      the_value.should be_within(25713.6, some_tolerance)
    end

          it "mvlv_costs_coefficient_in_impact_on_electricity_grid" do
      the_value.should be_within(85000.0, some_tolerance)
    end

          it "mvlv_delta_peak_load_max_in_impact_on_electricity_grid" do
      the_value.should be_within(34272.127, some_tolerance)
    end

          it "mvlv_networkcosts_in_impact_on_electricity_grid" do
      the_value.should be_within(1522.259, some_tolerance)
    end

          it "mvlv_required_expansion_in_impact_on_electricity_grid" do
      the_value.should be_within(17908.927, some_tolerance)
    end

          it "natural_gas_agriculture_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_agriculture_in_gas_versus_other_primary_energy" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_buildings_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_buildings_in_gas_versus_other_primary_energy" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_energy_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_households_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_households_in_gas_versus_other_primary_energy" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "natural_gas_in_gas_network_mix" do
      the_present.should be_within(1629.006, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-1629.0, some_tolerance)
    end


      
    it "natural_gas_in_use_of_transport_fuels" do
      the_present.should be_within(0.46, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-0.5, some_tolerance)
    end


          it "natural_gas_industry_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_industry_in_gas_versus_other_primary_energy" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_other_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_other_in_gas_versus_other_primary_energy" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_to_electricity_production_agriculture_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_to_electricity_production_buildings_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_to_electricity_production_energy_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_to_electricity_production_households_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_to_electricity_production_industry_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_to_electricity_production_other_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_to_electricity_production_transport_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_transport_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_transport_in_gas_versus_other_primary_energy" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "net_electricity_export" do
      the_present.should be_within(12.132, some_tolerance)
      the_future.should  be_within(195.476, some_tolerance)
      the_relative_increase.should be_within(1511.2, some_tolerance)
      the_absolute_increase.should be_within(183.3, some_tolerance)
    end


      
    it "net_electricity_import" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "network_in_breakdown_of_total_costs" do
      the_present.should be_within(3.262, some_tolerance)
      the_future.should  be_within(5.227, some_tolerance)
      the_relative_increase.should be_within(60.2, some_tolerance)
      the_absolute_increase.should be_within(2.0, some_tolerance)
    end


      
    it "network_in_breakdown_of_total_costs_per_household" do
      the_present.should be_within(443.84, some_tolerance)
      the_future.should  be_within(711.149, some_tolerance)
      the_relative_increase.should be_within(60.2, some_tolerance)
      the_absolute_increase.should be_within(267.3, some_tolerance)
    end


      
    it "new_residences_in_number_of_residences" do
      the_present.should be_within(1121208.0, some_tolerance)
      the_future.should  be_within(715738.278, some_tolerance)
      the_relative_increase.should be_within(-36.2, some_tolerance)
      the_absolute_increase.should be_within(-405469.7, some_tolerance)
    end


      
    it "non_energetic_fuels_in_breakdown_of_total_costs" do
      the_present.should be_within(8.792, some_tolerance)
      the_future.should  be_within(16.59, some_tolerance)
      the_relative_increase.should be_within(88.7, some_tolerance)
      the_absolute_increase.should be_within(7.8, some_tolerance)
    end


      
    it "non_energetic_fuels_in_breakdown_of_total_costs_per_household" do
      the_present.should be_within(1196.291, some_tolerance)
      the_future.should  be_within(2257.258, some_tolerance)
      the_relative_increase.should be_within(88.7, some_tolerance)
      the_absolute_increase.should be_within(1061.0, some_tolerance)
    end


      
    it "non_energetic_oil_in_use_of_final_demand_in_industry" do
      the_present.should be_within(536.76, some_tolerance)
      the_future.should  be_within(439.242, some_tolerance)
      the_relative_increase.should be_within(-18.2, some_tolerance)
      the_absolute_increase.should be_within(-97.5, some_tolerance)
    end


      
    it "non_energetic_other_in_use_of_final_demand_in_industry" do
      the_present.should be_within(173.76, some_tolerance)
      the_future.should  be_within(142.191, some_tolerance)
      the_relative_increase.should be_within(-18.2, some_tolerance)
      the_absolute_increase.should be_within(-31.6, some_tolerance)
    end


      
    it "non_energetic_use_in_use_of_final_demand_in_other_sector" do
      the_present.should be_within(3.38, some_tolerance)
      the_future.should  be_within(3.38, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "nuclear_in_source_of_electricity_production" do
      the_present.should be_within(14.4, some_tolerance)
      the_future.should  be_within(2.88, some_tolerance)
      the_relative_increase.should be_within(-80.0, some_tolerance)
      the_absolute_increase.should be_within(-11.5, some_tolerance)
    end


          it "nuclear_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(0.105, some_tolerance)
    end

          it "nuclear_plants_in_power_plant_properties" do
      the_value.should be_within(14.4, some_tolerance)
    end

          it "nuclear_plants_investm_in_power_plant_properties" do
      the_value.should be_within(363.121, some_tolerance)
    end

          it "nuclear_plants_plants_in_power_plant_properties" do
      the_value.should be_within(0.064, some_tolerance)
    end

          it "nuclear_plants_prod_in_power_plant_properties" do
      the_value.should be_within(2.88, some_tolerance)
    end

      
    it "offshore_in_targeted_area_use_for_wind_turbines" do
      the_present.should be_within(0.302, some_tolerance)
      the_future.should  be_within(46.359, some_tolerance)
      the_relative_increase.should be_within(15260.3, some_tolerance)
      the_absolute_increase.should be_within(46.1, some_tolerance)
    end


          it "oil_agriculture_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "oil_agriculture_in_mekko_of_primary_demand" do
      the_value.should be_within(0.022, some_tolerance)
    end

          it "oil_buildings_in_mekko_of_final_demand" do
      the_value.should be_within(0.605, some_tolerance)
    end

          it "oil_buildings_in_mekko_of_primary_demand" do
      the_value.should be_within(0.622, some_tolerance)
    end

          it "oil_households_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "oil_households_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "oil_in_future_energy_imports" do
      the_value.should be_within(446.988, some_tolerance)
    end

      
    it "oil_in_source_of_electricity_production" do
      the_present.should be_within(6.634, some_tolerance)
      the_future.should  be_within(0.712, some_tolerance)
      the_relative_increase.should be_within(-89.3, some_tolerance)
      the_absolute_increase.should be_within(-5.9, some_tolerance)
    end


          it "oil_industry_in_mekko_of_final_demand" do
      the_value.should be_within(439.242, some_tolerance)
    end

          it "oil_industry_in_mekko_of_primary_demand" do
      the_value.should be_within(441.735, some_tolerance)
    end

          it "oil_other_in_mekko_of_final_demand" do
      the_value.should be_within(5.961, some_tolerance)
    end

          it "oil_other_in_mekko_of_primary_demand" do
      the_value.should be_within(5.982, some_tolerance)
    end

          it "oil_power_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(0.036, some_tolerance)
    end

          it "oil_power_plants_in_power_plant_properties" do
      the_value.should be_within(6.634, some_tolerance)
    end

          it "oil_power_plants_investment_in_power_plant_properties" do
      the_value.should be_within(39.072, some_tolerance)
    end

          it "oil_power_plants_plants_in_power_plant_properties" do
      the_value.should be_within(1.428, some_tolerance)
    end

          it "oil_power_plants_prod_in_power_plant_properties" do
      the_value.should be_within(0.712, some_tolerance)
    end

          it "oil_transport_in_mekko_of_final_demand" do
      the_value.should be_within(2.902, some_tolerance)
    end

          it "oil_transport_in_mekko_of_primary_demand" do
      the_value.should be_within(2.991, some_tolerance)
    end

          it "oil_value_in_present_energy_imports" do
      the_value.should be_within(1225.658, some_tolerance)
    end

      
    it "old_residences_in_number_of_residences" do
      the_present.should be_within(6228292.0, some_tolerance)
      the_future.should  be_within(6633761.722, some_tolerance)
      the_relative_increase.should be_within(6.5, some_tolerance)
      the_absolute_increase.should be_within(405469.7, some_tolerance)
    end


      
    it "onshore_in_targeted_area_use_for_wind_turbines" do
      the_present.should be_within(0.737, some_tolerance)
      the_future.should  be_within(4.394, some_tolerance)
      the_relative_increase.should be_within(495.8, some_tolerance)
      the_absolute_increase.should be_within(3.7, some_tolerance)
    end


      
    it "operation_maintenance_cost_in_breakdown_converter_costs" do
      the_present.should be_within(0.068, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-0.1, some_tolerance)
    end


      
    it "operation_maintenance_cost_in_breakdown_electricity_costs" do
      the_present.should be_within(0.92, some_tolerance)
      the_future.should  be_within(1.646, some_tolerance)
      the_relative_increase.should be_within(78.9, some_tolerance)
      the_absolute_increase.should be_within(0.7, some_tolerance)
    end


      
    it "operation_maintenance_cost_in_breakdown_electricity_costs_corrected_for_electricity_imbalance" do
      the_present.should be_within(0.892, some_tolerance)
      the_future.should  be_within(1.109, some_tolerance)
      the_relative_increase.should be_within(24.2, some_tolerance)
      the_absolute_increase.should be_within(0.2, some_tolerance)
    end


      
    it "operation_maintenance_cost_in_breakdown_heating_costs" do
      the_present.should be_within(2.859, some_tolerance)
      the_future.should  be_within(1.781, some_tolerance)
      the_relative_increase.should be_within(-37.7, some_tolerance)
      the_absolute_increase.should be_within(-1.1, some_tolerance)
    end


          it "other_agriculture_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "other_agriculture_in_gas_versus_other_primary_energy" do
      the_value.should be_within(99.666, some_tolerance)
    end

          it "other_buildings_in_gas_use_for_electricity_production" do
      the_value.should be_within(65.688, some_tolerance)
    end

          it "other_buildings_in_gas_versus_other_primary_energy" do
      the_value.should be_within(102.35, some_tolerance)
    end

          it "other_energy_in_gas_use_for_electricity_production" do
      the_value.should be_within(387.106, some_tolerance)
    end

      
    it "other_heat_in_source_of_heat_and_electricity_in_agriculture" do
      the_present.should be_within(42.371, some_tolerance)
      the_future.should  be_within(90.472, some_tolerance)
      the_relative_increase.should be_within(113.5, some_tolerance)
      the_absolute_increase.should be_within(48.1, some_tolerance)
    end


      
    it "other_heat_in_source_of_heat_and_electricity_in_industry" do
      the_present.should be_within(373.717, some_tolerance)
      the_future.should  be_within(193.073, some_tolerance)
      the_relative_increase.should be_within(-48.3, some_tolerance)
      the_absolute_increase.should be_within(-180.6, some_tolerance)
    end


      
    it "other_heat_in_source_of_heat_and_electricity_in_other_sector" do
      the_present.should be_within(74.107, some_tolerance)
      the_future.should  be_within(32.828, some_tolerance)
      the_relative_increase.should be_within(-55.7, some_tolerance)
      the_absolute_increase.should be_within(-41.3, some_tolerance)
    end


          it "other_households_in_gas_use_for_electricity_production" do
      the_value.should be_within(73.781, some_tolerance)
    end

          it "other_households_in_gas_versus_other_primary_energy" do
      the_value.should be_within(252.851, some_tolerance)
    end

      
    it "other_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(3.86, some_tolerance)
      the_future.should  be_within(2.1, some_tolerance)
      the_relative_increase.should be_within(-45.6, some_tolerance)
      the_absolute_increase.should be_within(-1.8, some_tolerance)
    end


          it "other_industry_in_gas_use_for_electricity_production" do
      the_value.should be_within(562.79, some_tolerance)
    end

          it "other_industry_in_gas_versus_other_primary_energy" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "other_other_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "other_other_in_gas_versus_other_primary_energy" do
      the_value.should be_within(20.631, some_tolerance)
    end

          it "other_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(66.841, some_tolerance)
    end

          it "other_plants_in_power_plant_properties" do
      the_value.should be_within(14.64, some_tolerance)
    end

          it "other_plants_investm_in_power_plant_properties" do
      the_value.should be_within(71531.727, some_tolerance)
    end

          it "other_plants_plants_in_power_plant_properties" do
      the_value.should be_within(60291.35, some_tolerance)
    end

          it "other_plants_prod_in_power_plant_properties" do
      the_value.should be_within(217.259, some_tolerance)
    end

          it "other_transport_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "other_transport_in_gas_versus_other_primary_energy" do
      the_value.should be_within(146.955, some_tolerance)
    end

      
    it "percentage_renewable_electricity_in_renewable_electricity_share" do
      the_present.should be_within(9.777, some_tolerance)
      the_future.should  be_within(149.288, some_tolerance)
      the_relative_increase.should be_within(1426.9, some_tolerance)
      the_absolute_increase.should be_within(139.5, some_tolerance)
    end


      
    it "percentage_renewables_in_renewability" do
      the_present.should be_within(3.256, some_tolerance)
      the_future.should  be_within(99.418, some_tolerance)
      the_relative_increase.should be_within(2953.7, some_tolerance)
      the_absolute_increase.should be_within(96.2, some_tolerance)
    end


          it "power_plants_plants_in_power_plant_properties" do
      the_value.should be_within(68018.397, some_tolerance)
    end

          it "present_demand_in_source_of_electricity_in_buildings" do
      the_value.should be_within(120.0, some_tolerance)
    end

          it "present_demand_in_source_of_electricity_in_households" do
      the_value.should be_within(88.93, some_tolerance)
    end

          it "present_demand_in_source_of_electricity_production" do
      the_value.should be_within(418.269, some_tolerance)
    end

          it "present_peak_electricity_demand" do
      the_value.should be_within(16738.022, some_tolerance)
    end

          it "present_value_in_changes_in_centrally_produced_electricity" do
      the_value.should be_within(402.85, some_tolerance)
    end

      
    it "primary_energy_in_use_of_primary_energy" do
      the_present.should be_within(3461.731, some_tolerance)
      the_future.should  be_within(2393.676, some_tolerance)
      the_relative_increase.should be_within(-30.9, some_tolerance)
      the_absolute_increase.should be_within(-1068.1, some_tolerance)
    end


      
    it "primary_energy_of_electricity_export_in_use_of_primary_energy" do
      the_present.should be_within(25.511, some_tolerance)
      the_future.should  be_within(238.877, some_tolerance)
      the_relative_increase.should be_within(836.4, some_tolerance)
      the_absolute_increase.should be_within(213.4, some_tolerance)
    end


      
    it "pv_in_targeted_area_use_for_solar_power" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.391, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.4, some_tolerance)
    end


      
    it "roof_use_in_targeted_area_use_for_solar_power" do
      the_present.should be_within(0.188, some_tolerance)
      the_future.should  be_within(66.676, some_tolerance)
      the_relative_increase.should be_within(35300.4, some_tolerance)
      the_absolute_increase.should be_within(66.5, some_tolerance)
    end


      
    it "share_of_households_in_final_demand" do
      the_present.should be_within(0.161, some_tolerance)
      the_future.should  be_within(0.139, some_tolerance)
      the_relative_increase.should be_within(-13.9, some_tolerance)
      the_absolute_increase.should be_within(-0.0, some_tolerance)
    end


      
    it "solar_in_source_of_electricity_production" do
      the_present.should be_within(0.24, some_tolerance)
      the_future.should  be_within(195.826, some_tolerance)
      the_relative_increase.should be_within(81453.6, some_tolerance)
      the_absolute_increase.should be_within(195.6, some_tolerance)
    end


      
    it "solar_panels_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(-0.24, some_tolerance)
      the_future.should  be_within(-183.263, some_tolerance)
      the_relative_increase.should be_within(76221.2, some_tolerance)
      the_absolute_increase.should be_within(-183.0, some_tolerance)
    end


      
    it "solar_panels_in_source_of_electricity_in_buildings" do
      the_present.should be_within(0.24, some_tolerance)
      the_future.should  be_within(63.742, some_tolerance)
      the_relative_increase.should be_within(26446.1, some_tolerance)
      the_absolute_increase.should be_within(63.5, some_tolerance)
    end


      
    it "solar_panels_in_source_of_electricity_in_households" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(119.52, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(119.5, some_tolerance)
    end


          it "sts_coal_plants_in_expert_predictions" do
      the_value.should be_within(48.0, some_tolerance)
    end

          it "sts_gas_plants_in_expert_predictions" do
      the_value.should be_within(62.039, some_tolerance)
    end

          it "sustainable_electricity_agriculture_in_mekko_of_primary_demand" do
      the_value.should be_within(23.404, some_tolerance)
    end

          it "sustainable_electricity_buildings_in_mekko_of_primary_demand" do
      the_value.should be_within(69.321, some_tolerance)
    end

          it "sustainable_electricity_households_in_mekko_of_primary_demand" do
      the_value.should be_within(65.373, some_tolerance)
    end

          it "sustainable_electricity_industry_in_mekko_of_primary_demand" do
      the_value.should be_within(14.393, some_tolerance)
    end

          it "sustainable_electricity_other_in_mekko_of_primary_demand" do
      the_value.should be_within(1.629, some_tolerance)
    end

          it "sustainable_electricity_transport_in_mekko_of_primary_demand" do
      the_value.should be_within(89.044, some_tolerance)
    end

          it "target_in_co2_emissions_with_import_and_export" do
      the_value.should be_within(70.861, some_tolerance)
    end

      
    it "total_investment_costs_power_production" do
      the_present.should be_within(32009501591.642, some_tolerance)
      the_future.should  be_within(144303357771.863, some_tolerance)
      the_relative_increase.should be_within(350.8, some_tolerance)
      the_absolute_increase.should be_within(112293856180.2, some_tolerance)
    end


      
    it "total_investment_costs_power_production_corrected_for_imbalance" do
      the_present.should be_within(31060244968.063, some_tolerance)
      the_future.should  be_within(97233444331.796, some_tolerance)
      the_relative_increase.should be_within(213.0, some_tolerance)
      the_absolute_increase.should be_within(66173199363.7, some_tolerance)
    end


          it "total_plants_investm_in_power_plant_properties" do
      the_value.should be_within(144303.358, some_tolerance)
    end

          it "total_plants_prod_future_in_power_plant_properties" do
      the_value.should be_within(631.427, some_tolerance)
    end

          it "total_plants_prod_present_in_power_plant_properties" do
      the_value.should be_within(431.052, some_tolerance)
    end

      
    it "trains_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(6.2, some_tolerance)
      the_future.should  be_within(8.135, some_tolerance)
      the_relative_increase.should be_within(31.2, some_tolerance)
      the_absolute_increase.should be_within(1.9, some_tolerance)
    end


          it "uranium_agriculture_in_mekko_of_primary_demand" do
      the_value.should be_within(0.471, some_tolerance)
    end

          it "uranium_buildings_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "uranium_conversion_in_fuel_chain_emissions" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "uranium_extraction_in_fuel_chain_emissions" do
      the_value.should be_within(0.005, some_tolerance)
    end

          it "uranium_households_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "uranium_in_future_energy_imports" do
      the_value.should be_within(8.0, some_tolerance)
    end

          it "uranium_industry_in_mekko_of_primary_demand" do
      the_value.should be_within(0.289, some_tolerance)
    end

          it "uranium_other_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "uranium_transport_in_mekko_of_primary_demand" do
      the_value.should be_within(1.791, some_tolerance)
    end

          it "uranium_transportation_in_fuel_chain_emissions" do
      the_value.should be_within(0.003, some_tolerance)
    end

          it "uranium_treatment_in_fuel_chain_emissions" do
      the_value.should be_within(0.154, some_tolerance)
    end

          it "uranium_value_in_present_energy_imports" do
      the_value.should be_within(40.0, some_tolerance)
    end

          it "waste_agriculture_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "waste_agriculture_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "waste_buildings_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "waste_buildings_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "waste_households_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "waste_households_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "waste_in_source_of_electricity_production" do
      the_present.should be_within(14.04, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-14.0, some_tolerance)
    end


          it "waste_industry_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "waste_industry_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "waste_other_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "waste_other_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "waste_transport_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "waste_transport_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "wind_farms_capacity_in_power_plant_properties" do
      the_value.should be_within(21.057, some_tolerance)
    end

          it "wind_farms_in_power_plant_properties" do
      the_value.should be_within(14.328, some_tolerance)
    end

          it "wind_farms_investm_in_power_plant_properties" do
      the_value.should be_within(25149.484, some_tolerance)
    end

          it "wind_farms_plants_in_power_plant_properties" do
      the_value.should be_within(7019.0, some_tolerance)
    end

          it "wind_farms_prod_in_power_plant_properties" do
      the_value.should be_within(216.589, some_tolerance)
    end

      
    it "wind_in_source_of_electricity_production" do
      the_present.should be_within(14.328, some_tolerance)
      the_future.should  be_within(216.589, some_tolerance)
      the_relative_increase.should be_within(1411.7, some_tolerance)
      the_absolute_increase.should be_within(202.3, some_tolerance)
    end


          it "with_im_export_1990_in_co2_emissions_table" do
      the_value.should be_within(151.2, some_tolerance)
    end

          it "with_im_export_2010_in_co2_emissions_table" do
      the_value.should be_within(163.966, some_tolerance)
    end

          it "with_im_export_20xx_in_co2_emissions_table" do
      the_value.should be_within(0.881, some_tolerance)
    end

          it "wood_pellets_conversion_in_fuel_chain_emissions" do
      the_value.should be_within(0.029, some_tolerance)
    end

          it "wood_pellets_extraction_in_fuel_chain_emissions" do
      the_value.should be_within(1.147, some_tolerance)
    end

          it "wood_pellets_transportation_in_fuel_chain_emissions" do
      the_value.should be_within(8.081, some_tolerance)
    end

          it "wood_pellets_treatment_in_fuel_chain_emissions" do
      the_value.should be_within(0.0, some_tolerance)
    end

  end
end