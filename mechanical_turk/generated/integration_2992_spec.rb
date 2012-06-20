require 'spec_helper'

describe "untitled" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2020, use_fce: false) do
      move_slider 335, 0.2       # households_number_of_inhabitants
      move_slider 203, 0.5       # households_electricity_demand_per_person
      move_slider 372, -1       # households_heat_demand_per_person
      move_slider 204, 1       # households_cooling_demand_per_person
      move_slider 373, 0       # households_hot_water_demand_per_person
      move_slider 1, 0.2       # households_replacement_of_existing_houses
      move_slider 336, 1.2       # households_insulation_level_old_houses
      move_slider 337, 2.6       # households_insulation_level_new_houses
      move_slider 333, 70.0       # households_heating_gas_combi_heater_share
      move_slider 48, 0.0       # households_heating_solar_thermal_panels_share
      move_slider 51, 9.9       # households_heating_micro_chp_share
      move_slider 52, 1.0       # households_heating_electric_heater_share
      move_slider 242, 33.33333333333333       # households_heating_small_gas_chp_share
      move_slider 248, 1.3       # households_heating_oil_fired_heater_share
      move_slider 317, 0.5       # households_heating_gas_fired_heat_pump_share
      move_slider 338, 1.0       # households_heating_heat_pump_ground_share
      move_slider 339, 2.0       # households_heating_heat_pump_add_on_share
      move_slider 340, 2.7       # households_heating_pellet_stove_share
      move_slider 341, 66.66666666666666       # households_heating_heat_network_share
      move_slider 343, 0.0       # households_heating_biomass_chp_share
      move_slider 344, 0.0       # households_heating_geothermal_share
      move_slider 375, 1.0       # households_heating_heat_pump_with_ts_share
      move_slider 411, 0.1       # households_heating_coal_fired_heater_share
      move_slider 346, 10.0       # households_hot_water_gas_water_heater_share
      move_slider 347, 1.0       # households_hot_water_electric_boiler_share
      move_slider 348, 2       # households_hot_water_solar_water_heater_share
      move_slider 349, 83       # not found
      move_slider 354, 45       # households_cooking_gas_share
      move_slider 355, 20       # households_cooking_electric_share
      move_slider 356, 10       # households_cooking_halogen_share
      move_slider 357, 25       # households_cooking_induction_share
      move_slider 6, 15       # households_efficiency_fridge_freezer
      move_slider 359, 10       # households_efficiency_dish_washer
      move_slider 360, 0       # households_efficiency_vacuum_cleaner
      move_slider 361, 10       # households_efficiency_washing_machine
      move_slider 362, 10       # households_efficiency_dryer
      move_slider 363, 0       # households_efficiency_television
      move_slider 364, 5       # households_efficiency_computer_media
      move_slider 412, 0       # households_efficiency_other
      move_slider 43, 50       # households_lighting_low_energy_light_bulb_share
      move_slider 44, 15       # households_lighting_light_emitting_diode_share
      move_slider 245, 35       # households_lighting_incandescent_share
      move_slider 366, 30       # households_behavior_standby_killer_turn_off_appliances
      move_slider 368, 30       # households_behavior_turn_off_the_light
      move_slider 370, 30       # households_behavior_close_windows_turn_off_heating
      move_slider 371, 20       # households_efficiency_low_temperature_washing
      move_slider 47, 2       # households_market_penetration_solar_panels
      move_slider 376, 0.2       # buildings_number_of_buildings
      move_slider 377, 0.5       # buildings_electricity_per_student_employee
      move_slider 378, -1       # buildings_heat_per_employee_student
      move_slider 408, 0.2       # buildings_cooling_per_student_employee
      move_slider 381, 1.2       # buildings_insulation_level
      move_slider 382, 1.7       # not found
      move_slider 383, 64.6       # buildings_heating_gas_fired_heater_share
      move_slider 384, 0       # not found
      move_slider 385, 0       # buildings_heating_biomass_chp_share
      move_slider 386, 4.9       # buildings_heating_small_gas_chp_share
      move_slider 387, 1       # buildings_heating_electric_heater_share
      move_slider 388, 1       # buildings_heating_heat_network_share
      move_slider 389, 2       # buildings_heating_solar_thermal_panels_share
      move_slider 390, 1       # buildings_heating_gas_fired_heat_pump_share
      move_slider 394, 8.1       # buildings_heating_heat_pump_with_ts_share
      move_slider 406, 7.4       # buildings_heating_biomass_fired_heater_share
      move_slider 409, 10       # buildings_heating_oil_fired_heater_share
      move_slider 395, 2.3       # buildings_ventilation_rate
      move_slider 396, 15       # buildings_recirculation
      move_slider 397, 25       # buildings_waste_heat_recovery
      move_slider 398, 1       # buildings_appliances_efficiency
      move_slider 400, 35       # buildings_lighting_fluorescent_tube_conventional_share
      move_slider 401, 50       # buildings_lighting_fluorescent_tube_high_performance_share
      move_slider 402, 15       # buildings_lighting_led_tube_share
      move_slider 403, 50       # buildings_lighting_motion_detection
      move_slider 404, 50       # buildings_lighting_daylight_dependent_control
      move_slider 405, 2       # buildings_market_penetration_solar_panels
      move_slider 141, 1.1       # transport_cars
      move_slider 142, 1.5       # transport_trucks
      move_slider 143, 1       # transport_trains
      move_slider 144, 0       # transport_domestic_flights
      move_slider 145, 1.2       # transport_inland_navigation
      move_slider 148, 43       # transport_cars_gasoline_share
      move_slider 146, 3       # transport_cars_electric_share
      move_slider 147, 47       # transport_cars_diesel_share
      move_slider 238, 2       # transport_cars_lpg_share
      move_slider 239, 5       # transport_cars_compressed_gas_share
      move_slider 158, 95       # transport_trucks_diesel_share
      move_slider 157, 3       # transport_trucks_gasoline_share
      move_slider 159, 0       # transport_trucks_electric_share
      move_slider 240, 2       # transport_trucks_compressed_gas_share
      move_slider 171, 1       # transport_efficiency_electric_vehicles
      move_slider 186, 1       # transport_efficiency_combustion_engine_cars
      move_slider 328, 0.5       # transport_efficiency_combustion_engine_trucks
      move_slider 187, 0.3       # transport_efficiency_ships
      move_slider 188, 0.3       # transport_efficiency_airplanes
      move_slider 241, 0.3       # transport_efficiency_trains
      move_slider 213, 1.7       # industry_electricity_demand
      move_slider 214, 1.8       # industry_heat_demand
      move_slider 202, 2       # industry_non_energetic_other_demand
      move_slider 205, 2.1       # industry_non_energetic_oil_demand
      move_slider 169, 0.5       # industry_efficiency_electricity
      move_slider 170, 0.5       # industry_heat_from_fuels
      move_slider 216, 28.3       # industry_heating_gas_fired_heater_share
      move_slider 217, 21.7       # industry_heating_oil_fired_heater_share
      move_slider 218, 4       # industry_heating_coal_fired_heater_share
      move_slider 219, 1       # industry_heating_biomass_fired_heater_share
      move_slider 326, 45       # industry_heating_combined_heat_power_share
      move_slider 322, 125       # industry_number_of_gas_chp
      move_slider 323, 0       # not found
      move_slider 324, 10       # industry_number_of_biomass_chp
      move_slider 220, 0.8       # agriculture_electricity_demand
      move_slider 221, 0.2       # agriculture_heat_demand
      move_slider 246, 62.4       # agriculture_heating_gas_fired_heater_share
      move_slider 223, 7.5       # agriculture_heating_oil_fired_heater_share
      move_slider 225, 1       # agriculture_heating_biomass_fired_heater_share
      move_slider 227, 4       # agriculture_heating_heat_pump_with_ts_share
      move_slider 228, 1       # agriculture_heating_geothermal_share
      move_slider 327, 24.1       # agriculture_heating_combined_heat_power_share
      move_slider 325, 3000       # agriculture_number_of_small_gas_chp
      move_slider 229, 1.4       # other_electricity_demand
      move_slider 230, 0.1       # other_heat_demand
      move_slider 321, 127       # other_number_of_small_gas_chp
      move_slider 198, -20       # policy_sustainability_co2_emissions
      move_slider 234, 20       # policy_sustainability_renewable_percentage
      move_slider 178, 200       # policy_area_onshore_land
      move_slider 179, 50       # policy_area_onshore_coast
      move_slider 233, 1500       # policy_area_offshore
      move_slider 193, 266.7       # policy_area_roofs_for_solar_panels
      move_slider 194, 5       # policy_area_land_for_solar_panels
      move_slider 195, 5       # policy_area_land_for_csp
      move_slider 206, 60       # policy_dependence_max_dependence
      move_slider 212, 12       # policy_dependence_max_electricity_dependence
      move_slider 208, 25       # policy_cost_total_energy_cost
      move_slider 207, 25       # policy_cost_electricity_cost
      move_slider 11, 50       # costs_oil
      move_slider 57, 40       # costs_coal
      move_slider 58, 50       # costs_gas
      move_slider 59, 40       # costs_biomass
      move_slider 16, 10       # investment_costs_combustion_gas_plant
      move_slider 17, 15       # investment_costs_combustion_oil_plant
      move_slider 18, 20       # investment_costs_combustion_coal_plant
      move_slider 19, 10       # investment_costs_combustion_biomass_plant
      move_slider 231, 10       # investment_costs_combustion_waste_incinerator
      move_slider 180, 5       # om_costs_combustion_gas_plant
      move_slider 181, 5       # om_costs_combustion_oil_plant
      move_slider 182, 5       # om_costs_combustion_coal_plant
      move_slider 183, 5       # om_costs_combustion_biomass_plant
      move_slider 232, 5       # om_costs_combustion_waste_incinerator
      move_slider 185, 50       # costs_uranium
      move_slider 136, 20       # investment_costs_nuclear_nuclear_plant
      move_slider 121, 20       # om_costs_nuclear_nuclear_plant
      move_slider 12, -10       # investment_costs_wind_onshore
      move_slider 14, -12       # investment_costs_wind_offshore
      move_slider 126, 5       # om_costs_wind_onshore
      move_slider 127, 10       # om_costs_wind_offshore
      move_slider 114, 10       # investment_costs_water_river
      move_slider 116, -60       # not found
      move_slider 129, 0       # om_costs_water_river
      move_slider 130, 0       # not found
      move_slider 133, -30       # investment_costs_solar_solar_panels
      move_slider 134, -10       # investment_costs_solar_concentrated_solar_power
      move_slider 247, -10       # investment_costs_earth_geothermal_electricity
      move_slider 132, 0       # om_costs_earth_geothermal_electricity
      move_slider 137, 50       # costs_co2
      move_slider 138, 50       # costs_co2_free_allocation
      move_slider 139, 0       # om_costs_co2_ccs
      move_slider 140, -5       # investment_costs_co2_ccs
      move_slider 250, 1.7       # number_of_pulverized_coal
      move_slider 251, 0       # number_of_pulverized_coal_ccs
      move_slider 253, 0       # number_of_coal_iggc
      move_slider 254, 0.3       # number_of_coal_igcc_ccs
      move_slider 255, 0       # number_of_coal_oxyfuel_ccs
      move_slider 315, 0.0       # number_of_coal_conventional
      move_slider 316, 0       # number_of_coal_lignite
      move_slider 256, 2.9000000000000004       # number_of_gas_conventional
      move_slider 257, 4.800000000000001       # number_of_gas_ccgt
      move_slider 416, 0       # number_of_gas_ccgt_ccs
      move_slider 258, 0       # number_of_oil_fired_plant
      move_slider 259, 0.3       # number_of_nuclear_3rd_gen
      move_slider 413, 0       # number_of_nuclear_conventional
      move_slider 488, 5       # green_gas_total_share
      move_slider 489, 95       # natural_gas_total_share
      move_slider 261, 0.8       # number_of_co_firing_coal
      move_slider 262, 0       # not found
      move_slider 263, 1300       # number_of_wind_onshore_land
      move_slider 264, 300       # number_of_wind_onshore_coast
      move_slider 265, 1000       # number_of_wind_offshore
      move_slider 266, 4       # number_of_hydro_river
      move_slider 268, 0       # not found
      move_slider 270, 0       # number_of_geothermal_electric
      move_slider 298, 2       # number_of_solar_pv_plants
      move_slider 299, 0       # number_of_concentrated_solar_power
      move_slider 271, 10       # number_of_waste_incinerator
      move_slider 292, 91.5       # transport_diesel_share
      move_slider 293, 8.5       # transport_biodiesel_share
      move_slider 294, 91       # transport_gasoline_share
      move_slider 295, 9       # transport_bio_ethanol_share
      move_slider 296, 40       # not found
      move_slider 297, 60       # not found
      move_slider 441, 7.5       # households_heating_gas_fired_heater_share
      move_slider 446, 72.1       # households_hot_water_gas_fired_heater_share
      move_slider 420, 1.0       # households_hot_water_heat_pump_ground_share
      move_slider 444, 2.7       # households_hot_water_biomass_heater_share
      move_slider 445, 8.9       # households_hot_water_micro_chp_share
      move_slider 421, 2.9       # households_hot_water_heat_network_share
      move_slider 439, 0.0       # households_hot_water_fuel_cell_share
      move_slider 435, 1.3       # households_hot_water_oil_fired_heater_share
      move_slider 443, 0.1       # households_hot_water_coal_fired_heater_hotwater_share
      move_slider 351, 1.0       # households_cooling_heat_pump_ground_share
      move_slider 374, 0.0       # households_cooling_heat_pump_with_ts_share
      move_slider 352, 0.0       # households_cooling_gas_fired_heat_pump_share
      move_slider 353, 99.0       # households_cooling_airconditioning_share
      move_slider 436, 0.0       # households_cooking_biomass_share
      move_slider 392, 8.1       # buildings_cooling_heat_pump_with_ts_share
      move_slider 391, 1.0       # buildings_cooling_gas_fired_heat_pump_share
      move_slider 393, 90.9       # buildings_cooling_airconditioning_share
      move_slider 551, 1.6       # number_of_central_coal_chp
      move_slider 277, 0.0       # number_of_decentral_coal_chp_fixed
      move_slider 276, 3.6       # number_of_large_gas_chp
      move_slider 275, 3840.0       # number_of_small_chp_fixed
      move_slider 274, 324604.7       # number_of_micro_chp_fixed
      move_slider 582, 3.0       # households_heating_district_heating_network_share
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
      the_value.should be_within(143.962, some_tolerance)
    end

          it "actual_co2_emitted_in_co2_emissions_waterfall" do
      the_value.should be_within(143.962, some_tolerance)
    end

          it "all_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(28.777, some_tolerance)
    end

      
    it "ambient_cold_in_source_of_cooling_in_buildings" do
      the_present.should be_within(39.937, some_tolerance)
      the_future.should  be_within(34.13, some_tolerance)
      the_relative_increase.should be_within(-14.5, some_tolerance)
      the_absolute_increase.should be_within(-5.8, some_tolerance)
    end


      
    it "ambient_cold_in_source_of_cooling_in_households" do
      the_present.should be_within(8.004, some_tolerance)
      the_future.should  be_within(8.85, some_tolerance)
      the_relative_increase.should be_within(10.6, some_tolerance)
      the_absolute_increase.should be_within(0.8, some_tolerance)
    end


      
    it "ambient_heat_in_effect_of_insulation_in_households2" do
      the_present.should be_within(0.271, some_tolerance)
      the_future.should  be_within(6.696, some_tolerance)
      the_relative_increase.should be_within(2373.2, some_tolerance)
      the_absolute_increase.should be_within(6.4, some_tolerance)
    end


      
    it "ambient_heat_in_source_of_heat_and_electricity_used_in_households" do
      the_present.should be_within(1.094, some_tolerance)
      the_future.should  be_within(5.529, some_tolerance)
      the_relative_increase.should be_within(405.4, some_tolerance)
      the_absolute_increase.should be_within(4.4, some_tolerance)
    end


      
    it "ambient_heat_in_source_of_heat_in_agriculture" do
      the_present.should be_within(0.45, some_tolerance)
      the_future.should  be_within(4.675, some_tolerance)
      the_relative_increase.should be_within(939.6, some_tolerance)
      the_absolute_increase.should be_within(4.2, some_tolerance)
    end


      
    it "ambient_heat_in_source_of_heat_in_buildings" do
      the_present.should be_within(1.447, some_tolerance)
      the_future.should  be_within(7.237, some_tolerance)
      the_relative_increase.should be_within(400.2, some_tolerance)
      the_absolute_increase.should be_within(5.8, some_tolerance)
    end


      
    it "ambient_heat_in_source_of_heat_production" do
      the_present.should be_within(50.037, some_tolerance)
      the_future.should  be_within(61.228, some_tolerance)
      the_relative_increase.should be_within(22.4, some_tolerance)
      the_absolute_increase.should be_within(11.2, some_tolerance)
    end


      
    it "appliances_in_use_of_electricity_in_buildings" do
      the_present.should be_within(34.165, some_tolerance)
      the_future.should  be_within(30.944, some_tolerance)
      the_relative_increase.should be_within(-9.4, some_tolerance)
      the_absolute_increase.should be_within(-3.2, some_tolerance)
    end


          it "assigned_co2_emission_in_co2_emissions_waterfall" do
      the_value.should be_within(-0.945, some_tolerance)
    end

      
    it "bio_ethanol_in_use_of_transport_fuels" do
      the_present.should be_within(5.614, some_tolerance)
      the_future.should  be_within(15.678, some_tolerance)
      the_relative_increase.should be_within(179.3, some_tolerance)
      the_absolute_increase.should be_within(10.1, some_tolerance)
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
      the_value.should be_within(39.882, some_tolerance)
    end

          it "bio_fuels_transport_in_mekko_of_primary_demand" do
      the_value.should be_within(39.882, some_tolerance)
    end

      
    it "biodiesel_in_use_of_transport_fuels" do
      the_present.should be_within(3.963, some_tolerance)
      the_future.should  be_within(24.204, some_tolerance)
      the_relative_increase.should be_within(510.7, some_tolerance)
      the_absolute_increase.should be_within(20.2, some_tolerance)
    end


          it "biomass_agriculture_in_mekko_of_final_demand" do
      the_value.should be_within(1.284, some_tolerance)
    end

          it "biomass_agriculture_in_mekko_of_primary_demand" do
      the_value.should be_within(1.374, some_tolerance)
    end

          it "biomass_buildings_in_mekko_of_final_demand" do
      the_value.should be_within(8.471, some_tolerance)
    end

          it "biomass_buildings_in_mekko_of_primary_demand" do
      the_value.should be_within(22.417, some_tolerance)
    end

          it "biomass_conversion_in_fuel_chain_emissions" do
      the_value.should be_within(0.029, some_tolerance)
    end

          it "biomass_households_in_mekko_of_final_demand" do
      the_value.should be_within(10.694, some_tolerance)
    end

          it "biomass_households_in_mekko_of_primary_demand" do
      the_value.should be_within(19.969, some_tolerance)
    end

          it "biomass_in_future_energy_imports" do
      the_value.should be_within(199.383, some_tolerance)
    end

      
    it "biomass_in_source_of_electricity_production" do
      the_present.should be_within(17.28, some_tolerance)
      the_future.should  be_within(22.552, some_tolerance)
      the_relative_increase.should be_within(30.5, some_tolerance)
      the_absolute_increase.should be_within(5.3, some_tolerance)
    end


          it "biomass_industry_in_mekko_of_final_demand" do
      the_value.should be_within(7.574, some_tolerance)
    end

          it "biomass_industry_in_mekko_of_primary_demand" do
      the_value.should be_within(60.251, some_tolerance)
    end

          it "biomass_other_in_mekko_of_final_demand" do
      the_value.should be_within(1.858, some_tolerance)
    end

          it "biomass_other_in_mekko_of_primary_demand" do
      the_value.should be_within(2.321, some_tolerance)
    end

          it "biomass_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(1.047, some_tolerance)
    end

          it "biomass_plants_in_power_plant_properties" do
      the_value.should be_within(17.28, some_tolerance)
    end

          it "biomass_plants_investm_in_power_plant_properties" do
      the_value.should be_within(2219.171, some_tolerance)
    end

          it "biomass_plants_plants_in_power_plant_properties" do
      the_value.should be_within(12.637, some_tolerance)
    end

          it "biomass_plants_prod_in_power_plant_properties" do
      the_value.should be_within(22.552, some_tolerance)
    end

          it "biomass_transport_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "biomass_transport_in_mekko_of_primary_demand" do
      the_value.should be_within(1.413, some_tolerance)
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
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "centrally_produced_electricity_in_source_of_heat_and_electricity_in_industry" do
      the_present.should be_within(10.42, some_tolerance)
      the_future.should  be_within(46.137, some_tolerance)
      the_relative_increase.should be_within(342.8, some_tolerance)
      the_absolute_increase.should be_within(35.7, some_tolerance)
    end


      
    it "centrally_produced_electricity_in_source_of_heat_and_electricity_in_other_sector" do
      the_present.should be_within(1.44, some_tolerance)
      the_future.should  be_within(0.8, some_tolerance)
      the_relative_increase.should be_within(-44.5, some_tolerance)
      the_absolute_increase.should be_within(-0.6, some_tolerance)
    end


      
    it "centrally_produced_in_source_of_electricity_in_buildings" do
      the_present.should be_within(114.0, some_tolerance)
      the_future.should  be_within(99.007, some_tolerance)
      the_relative_increase.should be_within(-13.2, some_tolerance)
      the_absolute_increase.should be_within(-15.0, some_tolerance)
    end


      
    it "centrally_produced_in_source_of_electricity_in_households" do
      the_present.should be_within(88.93, some_tolerance)
      the_future.should  be_within(64.03, some_tolerance)
      the_relative_increase.should be_within(-28.0, some_tolerance)
      the_absolute_increase.should be_within(-24.9, some_tolerance)
    end


      
    it "chp_electricity_in_source_of_heat_and_electricity_in_agriculture" do
      the_present.should be_within(43.92, some_tolerance)
      the_future.should  be_within(43.577, some_tolerance)
      the_relative_increase.should be_within(-0.8, some_tolerance)
      the_absolute_increase.should be_within(-0.3, some_tolerance)
    end


      
    it "chp_electricity_in_source_of_heat_and_electricity_in_other_sector" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.855, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.9, some_tolerance)
    end


      
    it "chp_fossil_electricity_in_source_of_heat_and_electricity_in_industry" do
      the_present.should be_within(60.807, some_tolerance)
      the_future.should  be_within(59.516, some_tolerance)
      the_relative_increase.should be_within(-2.1, some_tolerance)
      the_absolute_increase.should be_within(-1.3, some_tolerance)
    end


      
    it "chp_fossil_heat_in_source_of_heat_and_electricity_in_industry" do
      the_present.should be_within(114.858, some_tolerance)
      the_future.should  be_within(112.42, some_tolerance)
      the_relative_increase.should be_within(-2.1, some_tolerance)
      the_absolute_increase.should be_within(-2.4, some_tolerance)
    end


      
    it "chp_heat_in_source_of_heat_and_electricity_in_agriculture" do
      the_present.should be_within(53.416, some_tolerance)
      the_future.should  be_within(53.0, some_tolerance)
      the_relative_increase.should be_within(-0.8, some_tolerance)
      the_absolute_increase.should be_within(-0.4, some_tolerance)
    end


      
    it "chp_heat_in_source_of_heat_and_electricity_in_other_sector" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.809, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.8, some_tolerance)
    end


      
    it "chp_renewable_electricity_in_source_of_heat_and_electricity_in_industry" do
      the_present.should be_within(4.713, some_tolerance)
      the_future.should  be_within(9.09, some_tolerance)
      the_relative_increase.should be_within(92.9, some_tolerance)
      the_absolute_increase.should be_within(4.4, some_tolerance)
    end


      
    it "chp_renewable_heat_in_source_of_heat_and_electricity_in_industry" do
      the_present.should be_within(8.252, some_tolerance)
      the_future.should  be_within(16.293, some_tolerance)
      the_relative_increase.should be_within(97.5, some_tolerance)
      the_absolute_increase.should be_within(8.0, some_tolerance)
    end


      
    it "chps_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(-176.4, some_tolerance)
      the_future.should  be_within(-161.517, some_tolerance)
      the_relative_increase.should be_within(-8.4, some_tolerance)
      the_absolute_increase.should be_within(14.9, some_tolerance)
    end


      
    it "chps_in_source_of_electricity_in_buildings" do
      the_present.should be_within(5.76, some_tolerance)
      the_future.should  be_within(0.22, some_tolerance)
      the_relative_increase.should be_within(-96.2, some_tolerance)
      the_absolute_increase.should be_within(-5.5, some_tolerance)
    end


      
    it "cleaning_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(22.055, some_tolerance)
      the_future.should  be_within(21.451, some_tolerance)
      the_relative_increase.should be_within(-2.7, some_tolerance)
      the_absolute_increase.should be_within(-0.6, some_tolerance)
    end


      
    it "co2_emission_exported_electricity_in_co2_emissions_with_import_and_export" do
      the_present.should be_within(1.407, some_tolerance)
      the_future.should  be_within(0.945, some_tolerance)
      the_relative_increase.should be_within(-32.8, some_tolerance)
      the_absolute_increase.should be_within(-0.5, some_tolerance)
    end


      
    it "co2_emission_imported_electricity_in_co2_emissions_with_import_and_export" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "co2_emission_in_co2_emissions" do
      the_present.should be_within(163.966, some_tolerance)
      the_future.should  be_within(143.017, some_tolerance)
      the_relative_increase.should be_within(-12.8, some_tolerance)
      the_absolute_increase.should be_within(-20.9, some_tolerance)
    end


      
    it "co2_emission_in_co2_emissions_corrected_for_import" do
      the_present.should be_within(163.966, some_tolerance)
      the_future.should  be_within(143.017, some_tolerance)
      the_relative_increase.should be_within(-12.8, some_tolerance)
      the_absolute_increase.should be_within(-20.9, some_tolerance)
    end


      
    it "co2_emission_local_production_in_co2_emissions_with_import_and_export" do
      the_present.should be_within(163.966, some_tolerance)
      the_future.should  be_within(143.017, some_tolerance)
      the_relative_increase.should be_within(-12.8, some_tolerance)
      the_absolute_increase.should be_within(-20.9, some_tolerance)
    end


      
    it "co2_emission_rights_in_breakdown_converter_costs" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "co2_emission_rights_in_breakdown_electricity_costs" do
      the_present.should be_within(0.054, some_tolerance)
      the_future.should  be_within(0.17, some_tolerance)
      the_relative_increase.should be_within(216.6, some_tolerance)
      the_absolute_increase.should be_within(0.1, some_tolerance)
    end


      
    it "co2_emission_rights_in_breakdown_electricity_costs_corrected_for_electricity_imbalance" do
      the_present.should be_within(0.052, some_tolerance)
      the_future.should  be_within(0.168, some_tolerance)
      the_relative_increase.should be_within(223.0, some_tolerance)
      the_absolute_increase.should be_within(0.1, some_tolerance)
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
      the_value.should be_within(40.792, some_tolerance)
    end

          it "coal_conversion_in_fuel_chain_emissions" do
      the_value.should be_within(92.684, some_tolerance)
    end

          it "coal_extraction_in_fuel_chain_emissions" do
      the_value.should be_within(3.837, some_tolerance)
    end

          it "coal_households_in_mekko_of_final_demand" do
      the_value.should be_within(0.446, some_tolerance)
    end

          it "coal_households_in_mekko_of_primary_demand" do
      the_value.should be_within(27.115, some_tolerance)
    end

          it "coal_in_future_energy_imports" do
      the_value.should be_within(266.152, some_tolerance)
    end

      
    it "coal_in_heating_heat_network" do
      the_present.should be_within(84.293, some_tolerance)
      the_future.should  be_within(56.996, some_tolerance)
      the_relative_increase.should be_within(-32.4, some_tolerance)
      the_absolute_increase.should be_within(-27.3, some_tolerance)
    end


      
    it "coal_in_source_of_electricity_production" do
      the_present.should be_within(99.324, some_tolerance)
      the_future.should  be_within(57.668, some_tolerance)
      the_relative_increase.should be_within(-41.9, some_tolerance)
      the_absolute_increase.should be_within(-41.7, some_tolerance)
    end


      
    it "coal_in_use_of_transport_fuels" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


          it "coal_industry_in_mekko_of_final_demand" do
      the_value.should be_within(100.56, some_tolerance)
    end

          it "coal_industry_in_mekko_of_primary_demand" do
      the_value.should be_within(178.214, some_tolerance)
    end

          it "coal_other_in_mekko_of_final_demand" do
      the_value.should be_within(7.99, some_tolerance)
    end

          it "coal_other_in_mekko_of_primary_demand" do
      the_value.should be_within(10.631, some_tolerance)
    end

          it "coal_power_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(2.698, some_tolerance)
    end

          it "coal_power_plants_in_power_plant_properties" do
      the_value.should be_within(99.324, some_tolerance)
    end

          it "coal_power_plants_investment_in_power_plant_properties" do
      the_value.should be_within(5331.876, some_tolerance)
    end

          it "coal_power_plants_number_of_plants_in_power_plant_properties" do
      the_value.should be_within(3.6, some_tolerance)
    end

          it "coal_power_plants_prod_in_power_plant_properties" do
      the_value.should be_within(57.668, some_tolerance)
    end

          it "coal_transport_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "coal_transport_in_mekko_of_primary_demand" do
      the_value.should be_within(4.139, some_tolerance)
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
      the_future.should  be_within(11.086, some_tolerance)
      the_relative_increase.should be_within(7469.2, some_tolerance)
      the_absolute_increase.should be_within(10.9, some_tolerance)
    end


      
    it "collective_chps_in_source_of_electricity_in_households" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(2.501, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(2.5, some_tolerance)
    end


          it "conventional_in_comparison_of_demand_micro_chp_versus_conventional" do
      the_value.should be_within(33.442, some_tolerance)
    end

      
    it "cooking_from_biomass_in_source_of_cooking_in_households" do
      the_present.should be_within(0.007, some_tolerance)
      the_future.should  be_within(0.416, some_tolerance)
      the_relative_increase.should be_within(6262.9, some_tolerance)
      the_absolute_increase.should be_within(0.4, some_tolerance)
    end


      
    it "cooking_from_electricity_in_source_of_cooking_in_households" do
      the_present.should be_within(4.447, some_tolerance)
      the_future.should  be_within(6.094, some_tolerance)
      the_relative_increase.should be_within(37.0, some_tolerance)
      the_absolute_increase.should be_within(1.6, some_tolerance)
    end


      
    it "cooking_from_gas_in_source_of_cooking_in_households" do
      the_present.should be_within(10.846, some_tolerance)
      the_future.should  be_within(7.899, some_tolerance)
      the_relative_increase.should be_within(-27.2, some_tolerance)
      the_absolute_increase.should be_within(-2.9, some_tolerance)
    end


      
    it "cooking_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(4.447, some_tolerance)
      the_future.should  be_within(6.094, some_tolerance)
      the_relative_increase.should be_within(37.0, some_tolerance)
      the_absolute_increase.should be_within(1.6, some_tolerance)
    end


      
    it "cooling_demand_in_effect_of_insulation_in_households" do
      the_present.should be_within(10.672, some_tolerance)
      the_future.should  be_within(11.788, some_tolerance)
      the_relative_increase.should be_within(10.5, some_tolerance)
      the_absolute_increase.should be_within(1.1, some_tolerance)
    end


      
    it "cooling_demand_in_use_of_final_demand_in_buildings" do
      the_present.should be_within(51.347, some_tolerance)
      the_future.should  be_within(43.532, some_tolerance)
      the_relative_increase.should be_within(-15.2, some_tolerance)
      the_absolute_increase.should be_within(-7.8, some_tolerance)
    end


      
    it "cooling_demand_in_use_of_final_demand_in_households" do
      the_present.should be_within(2.668, some_tolerance)
      the_future.should  be_within(2.938, some_tolerance)
      the_relative_increase.should be_within(10.1, some_tolerance)
      the_absolute_increase.should be_within(0.3, some_tolerance)
    end


      
    it "cooling_from_electricity_in_source_of_cooling_in_buildings" do
      the_present.should be_within(11.41, some_tolerance)
      the_future.should  be_within(9.146, some_tolerance)
      the_relative_increase.should be_within(-19.8, some_tolerance)
      the_absolute_increase.should be_within(-2.3, some_tolerance)
    end


      
    it "cooling_from_electricity_in_source_of_cooling_in_households" do
      the_present.should be_within(2.668, some_tolerance)
      the_future.should  be_within(2.938, some_tolerance)
      the_relative_increase.should be_within(10.1, some_tolerance)
      the_absolute_increase.should be_within(0.3, some_tolerance)
    end


      
    it "cooling_from_gas_in_source_of_cooling_in_buildings" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.256, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.3, some_tolerance)
    end


      
    it "cooling_from_gas_in_source_of_cooling_in_households" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "cooling_in_use_of_electricity_in_buildings" do
      the_present.should be_within(11.41, some_tolerance)
      the_future.should  be_within(9.146, some_tolerance)
      the_relative_increase.should be_within(-19.8, some_tolerance)
      the_absolute_increase.should be_within(-2.3, some_tolerance)
    end


      
    it "cooling_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(2.668, some_tolerance)
      the_future.should  be_within(2.938, some_tolerance)
      the_relative_increase.should be_within(10.1, some_tolerance)
      the_absolute_increase.should be_within(0.3, some_tolerance)
    end


      
    it "cost_of_capital_in_breakdown_converter_costs" do
      the_present.should be_within(0.076, some_tolerance)
      the_future.should  be_within(0.043, some_tolerance)
      the_relative_increase.should be_within(-43.4, some_tolerance)
      the_absolute_increase.should be_within(-0.0, some_tolerance)
    end


      
    it "cost_of_capital_in_breakdown_electricity_costs" do
      the_present.should be_within(1.72, some_tolerance)
      the_future.should  be_within(0.068, some_tolerance)
      the_relative_increase.should be_within(-96.1, some_tolerance)
      the_absolute_increase.should be_within(-1.7, some_tolerance)
    end


      
    it "cost_of_capital_in_breakdown_electricity_costs_corrected_for_electricity_imbalance" do
      the_present.should be_within(1.669, some_tolerance)
      the_future.should  be_within(0.067, some_tolerance)
      the_relative_increase.should be_within(-96.0, some_tolerance)
      the_absolute_increase.should be_within(-1.6, some_tolerance)
    end


      
    it "cost_of_capital_in_breakdown_heating_costs" do
      the_present.should be_within(1.342, some_tolerance)
      the_future.should  be_within(1.497, some_tolerance)
      the_relative_increase.should be_within(11.6, some_tolerance)
      the_absolute_increase.should be_within(0.2, some_tolerance)
    end


          it "costs_of_biomass_chp_in_overview_costs_of_electricity_production" do
      the_value.should be_within(204.237, some_tolerance)
    end

          it "costs_of_co_firing_coal_in_overview_costs_of_electricity_production" do
      the_value.should be_within(106.073, some_tolerance)
    end

          it "costs_of_coal_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(89.778, some_tolerance)
    end

          it "costs_of_coal_chp_in_overview_costs_of_electricity_production" do
      the_value.should be_within(75.613, some_tolerance)
    end

          it "costs_of_coal_conventional_in_overview_costs_of_electricity_production" do
      the_value.should be_within(75.877, some_tolerance)
    end

          it "costs_of_coal_igcc_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(94.14, some_tolerance)
    end

          it "costs_of_coal_igcc_in_overview_costs_of_electricity_production" do
      the_value.should be_within(84.412, some_tolerance)
    end

          it "costs_of_coal_lignite_in_overview_costs_of_electricity_production" do
      the_value.should be_within(49.267, some_tolerance)
    end

          it "costs_of_coal_oxyfuel_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(91.364, some_tolerance)
    end

          it "costs_of_coal_powder_in_overview_costs_of_electricity_production" do
      the_value.should be_within(65.237, some_tolerance)
    end

          it "costs_of_gas_ccgt_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(121.27, some_tolerance)
    end

          it "costs_of_gas_ccgt_in_overview_costs_of_electricity_production" do
      the_value.should be_within(94.429, some_tolerance)
    end

          it "costs_of_gas_chp_central_in_overview_costs_of_electricity_production" do
      the_value.should be_within(125.972, some_tolerance)
    end

          it "costs_of_gas_chp_industry_in_overview_costs_of_electricity_production" do
      the_value.should be_within(153.944, some_tolerance)
    end

          it "costs_of_gas_conventional_in_overview_costs_of_electricity_production" do
      the_value.should be_within(144.458, some_tolerance)
    end

          it "costs_of_gas_turbine_in_overview_costs_of_electricity_production" do
      the_value.should be_within(191.745, some_tolerance)
    end

          it "costs_of_geothermal_well_in_overview_costs_of_electricity_production" do
      the_value.should be_within(147.605, some_tolerance)
    end

          it "costs_of_hydro_mountain_in_overview_costs_of_electricity_production" do
      the_value.should be_within(28.446, some_tolerance)
    end

          it "costs_of_hydro_river_in_overview_costs_of_electricity_production" do
      the_value.should be_within(120.916, some_tolerance)
    end

          it "costs_of_nuclear_3rd_generation_in_overview_costs_of_electricity_production" do
      the_value.should be_within(60.587, some_tolerance)
    end

          it "costs_of_nuclear_conventional_in_overview_costs_of_electricity_production" do
      the_value.should be_within(52.012, some_tolerance)
    end

          it "costs_of_oil_plant_in_overview_costs_of_electricity_production" do
      the_value.should be_within(198.864, some_tolerance)
    end

          it "costs_of_solar_csp_in_overview_costs_of_electricity_production" do
      the_value.should be_within(547.25, some_tolerance)
    end

          it "costs_of_solar_pv_centrally_in_overview_costs_of_electricity_production" do
      the_value.should be_within(147.569, some_tolerance)
    end

          it "costs_of_solar_pv_on_roofs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(125.519, some_tolerance)
    end

          it "costs_of_waste_incinerator_in_overview_costs_of_electricity_production" do
      the_value.should be_within(124.005, some_tolerance)
    end

          it "costs_of_wind_coastal_in_overview_costs_of_electricity_production" do
      the_value.should be_within(69.546, some_tolerance)
    end

          it "costs_of_wind_inland_in_overview_costs_of_electricity_production" do
      the_value.should be_within(77.813, some_tolerance)
    end

          it "costs_of_wind_offshore_in_overview_costs_of_electricity_production" do
      the_value.should be_within(155.623, some_tolerance)
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
      the_future.should  be_within(0.026, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
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
      the_future.should  be_within(0.048, some_tolerance)
      the_relative_increase.should be_within(-43.4, some_tolerance)
      the_absolute_increase.should be_within(-0.0, some_tolerance)
    end


      
    it "depreciation_in_breakdown_electricity_costs" do
      the_present.should be_within(1.191, some_tolerance)
      the_future.should  be_within(0.093, some_tolerance)
      the_relative_increase.should be_within(-92.2, some_tolerance)
      the_absolute_increase.should be_within(-1.1, some_tolerance)
    end


      
    it "depreciation_in_breakdown_electricity_costs_corrected_for_electricity_imbalance" do
      the_present.should be_within(1.155, some_tolerance)
      the_future.should  be_within(0.092, some_tolerance)
      the_relative_increase.should be_within(-92.1, some_tolerance)
      the_absolute_increase.should be_within(-1.1, some_tolerance)
    end


      
    it "depreciation_in_breakdown_heating_costs" do
      the_present.should be_within(3.33, some_tolerance)
      the_future.should  be_within(3.564, some_tolerance)
      the_relative_increase.should be_within(7.0, some_tolerance)
      the_absolute_increase.should be_within(0.2, some_tolerance)
    end


      
    it "diesel_in_use_of_transport_fuels" do
      the_present.should be_within(278.767, some_tolerance)
      the_future.should  be_within(269.297, some_tolerance)
      the_relative_increase.should be_within(-3.4, some_tolerance)
      the_absolute_increase.should be_within(-9.5, some_tolerance)
    end


          it "diff_1990_in_co2_emissions_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "diff_2010_in_co2_emissions_table" do
      the_value.should be_within(-1.407, some_tolerance)
    end

          it "diff_20xx_in_co2_emissions_table" do
      the_value.should be_within(-0.945, some_tolerance)
    end

      
    it "electric_heaters_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(8.9, some_tolerance)
      the_future.should  be_within(1.957, some_tolerance)
      the_relative_increase.should be_within(-78.0, some_tolerance)
      the_absolute_increase.should be_within(-6.9, some_tolerance)
    end


      
    it "electric_vehicles_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(0.02, some_tolerance)
      the_future.should  be_within(3.493, some_tolerance)
      the_relative_increase.should be_within(17366.6, some_tolerance)
      the_absolute_increase.should be_within(3.5, some_tolerance)
    end


          it "electricity_agriculture_in_mekko_of_final_demand" do
      the_value.should be_within(28.995, some_tolerance)
    end

          it "electricity_buildings_in_mekko_of_final_demand" do
      the_value.should be_within(100.502, some_tolerance)
    end

      
    it "electricity_cars_in_use_of_final_demand_in_transport" do
      the_present.should be_within(0.02, some_tolerance)
      the_future.should  be_within(3.493, some_tolerance)
      the_relative_increase.should be_within(17366.6, some_tolerance)
      the_absolute_increase.should be_within(3.5, some_tolerance)
    end


      
    it "electricity_demand_excluding_heating_in_use_of_final_demand_in_households" do
      the_present.should be_within(80.926, some_tolerance)
      the_future.should  be_within(68.392, some_tolerance)
      the_relative_increase.should be_within(-15.5, some_tolerance)
      the_absolute_increase.should be_within(-12.5, some_tolerance)
    end


      
    it "electricity_demand_in_effect_of_insulation_in_buildings" do
      the_present.should be_within(120.0, some_tolerance)
      the_future.should  be_within(100.502, some_tolerance)
      the_relative_increase.should be_within(-16.2, some_tolerance)
      the_absolute_increase.should be_within(-19.5, some_tolerance)
    end


      
    it "electricity_demand_in_use_of_final_demand_in_buildings" do
      the_present.should be_within(106.762, some_tolerance)
      the_future.should  be_within(89.573, some_tolerance)
      the_relative_increase.should be_within(-16.1, some_tolerance)
      the_absolute_increase.should be_within(-17.2, some_tolerance)
    end


          it "electricity_households_in_mekko_of_final_demand" do
      the_value.should be_within(75.037, some_tolerance)
    end

      
    it "electricity_import_in_targeted_import_share" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.12, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.1, some_tolerance)
    end


      
    it "electricity_in_breakdown_of_total_costs" do
      the_present.should be_within(9.925, some_tolerance)
      the_future.should  be_within(10.474, some_tolerance)
      the_relative_increase.should be_within(5.5, some_tolerance)
      the_absolute_increase.should be_within(0.5, some_tolerance)
    end


      
    it "electricity_in_breakdown_of_total_costs_per_household" do
      the_present.should be_within(1350.438, some_tolerance)
      the_future.should  be_within(1425.092, some_tolerance)
      the_relative_increase.should be_within(5.5, some_tolerance)
      the_absolute_increase.should be_within(74.7, some_tolerance)
    end


          it "electricity_in_future_energy_imports" do
      the_value.should be_within(-12.231, some_tolerance)
    end

      
    it "electricity_in_source_of_heat_and_electricity_used_in_households" do
      the_present.should be_within(88.93, some_tolerance)
      the_future.should  be_within(79.464, some_tolerance)
      the_relative_increase.should be_within(-10.6, some_tolerance)
      the_absolute_increase.should be_within(-9.5, some_tolerance)
    end


      
    it "electricity_in_use_of_final_demand_in_agriculture" do
      the_present.should be_within(26.6, some_tolerance)
      the_future.should  be_within(28.995, some_tolerance)
      the_relative_increase.should be_within(9.0, some_tolerance)
      the_absolute_increase.should be_within(2.4, some_tolerance)
    end


      
    it "electricity_in_use_of_final_demand_in_industry" do
      the_present.should be_within(137.14, some_tolerance)
      the_future.should  be_within(154.384, some_tolerance)
      the_relative_increase.should be_within(12.6, some_tolerance)
      the_absolute_increase.should be_within(17.2, some_tolerance)
    end


      
    it "electricity_in_use_of_final_demand_in_other_sector" do
      the_present.should be_within(1.44, some_tolerance)
      the_future.should  be_within(1.655, some_tolerance)
      the_relative_increase.should be_within(14.9, some_tolerance)
      the_absolute_increase.should be_within(0.2, some_tolerance)
    end


          it "electricity_industry_in_mekko_of_final_demand" do
      the_value.should be_within(181.836, some_tolerance)
    end

          it "electricity_other_in_mekko_of_final_demand" do
      the_value.should be_within(1.655, some_tolerance)
    end

      
    it "electricity_trains_in_use_of_final_demand_in_transport" do
      the_present.should be_within(6.2, some_tolerance)
      the_future.should  be_within(6.646, some_tolerance)
      the_relative_increase.should be_within(7.2, some_tolerance)
      the_absolute_increase.should be_within(0.4, some_tolerance)
    end


          it "electricity_transport_in_mekko_of_final_demand" do
      the_value.should be_within(10.139, some_tolerance)
    end

      
    it "electricity_trucks_in_use_of_final_demand_in_transport" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


          it "electricity_value_in_present_energy_imports" do
      the_value.should be_within(-12.132, some_tolerance)
    end

      
    it "energy_import_in_targeted_import_share" do
      the_present.should be_within(0.294, some_tolerance)
      the_future.should  be_within(0.6, some_tolerance)
      the_relative_increase.should be_within(104.2, some_tolerance)
      the_absolute_increase.should be_within(0.3, some_tolerance)
    end


      
    it "energy_used_for_heat_in_households" do
      the_present.should be_within(10.615, some_tolerance)
      the_future.should  be_within(24.089, some_tolerance)
      the_relative_increase.should be_within(126.9, some_tolerance)
      the_absolute_increase.should be_within(13.5, some_tolerance)
    end


          it "eupvt_solar_panels_in_expert_predictions" do
      the_value.should be_within(nil, some_tolerance)
    end

          it "final_demand_greengas_agriculture_in_gas_flow_to_sectors" do
      the_value.should be_within(3.388, some_tolerance)
    end

          it "final_demand_greengas_buildings_in_gas_flow_to_sectors" do
      the_value.should be_within(5.942, some_tolerance)
    end

          it "final_demand_greengas_energy_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "final_demand_greengas_households_in_gas_flow_to_sectors" do
      the_value.should be_within(14.615, some_tolerance)
    end

          it "final_demand_greengas_industry_in_gas_flow_to_sectors" do
      the_value.should be_within(15.232, some_tolerance)
    end

          it "final_demand_greengas_other_in_gas_flow_to_sectors" do
      the_value.should be_within(2.938, some_tolerance)
    end

          it "final_demand_greengas_transport_in_gas_flow_to_sectors" do
      the_value.should be_within(0.997, some_tolerance)
    end

          it "final_demand_natural_gas_agriculture_in_gas_flow_to_sectors" do
      the_value.should be_within(64.365, some_tolerance)
    end

          it "final_demand_natural_gas_buildings_in_gas_flow_to_sectors" do
      the_value.should be_within(112.902, some_tolerance)
    end

          it "final_demand_natural_gas_energy_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "final_demand_natural_gas_households_in_gas_flow_to_sectors" do
      the_value.should be_within(277.694, some_tolerance)
    end

          it "final_demand_natural_gas_industry_in_gas_flow_to_sectors" do
      the_value.should be_within(289.4, some_tolerance)
    end

          it "final_demand_natural_gas_other_in_gas_flow_to_sectors" do
      the_value.should be_within(55.826, some_tolerance)
    end

          it "final_demand_natural_gas_transport_in_gas_flow_to_sectors" do
      the_value.should be_within(18.941, some_tolerance)
    end

      
    it "fossil_heat_in_source_of_heat_and_electricity_used_in_households" do
      the_present.should be_within(324.914, some_tolerance)
      the_future.should  be_within(263.654, some_tolerance)
      the_relative_increase.should be_within(-18.9, some_tolerance)
      the_absolute_increase.should be_within(-61.3, some_tolerance)
    end


      
    it "fossil_heat_in_source_of_heat_production" do
      the_present.should be_within(1096.493, some_tolerance)
      the_future.should  be_within(1021.505, some_tolerance)
      the_relative_increase.should be_within(-6.8, some_tolerance)
      the_absolute_increase.should be_within(-75.0, some_tolerance)
    end


      
    it "fossil_heat_in_use_of_final_demand_in_agriculture" do
      the_present.should be_within(94.573, some_tolerance)
      the_future.should  be_within(87.631, some_tolerance)
      the_relative_increase.should be_within(-7.3, some_tolerance)
      the_absolute_increase.should be_within(-6.9, some_tolerance)
    end


      
    it "fossil_heat_in_use_of_final_demand_in_industry" do
      the_present.should be_within(436.446, some_tolerance)
      the_future.should  be_within(369.724, some_tolerance)
      the_relative_increase.should be_within(-15.3, some_tolerance)
      the_absolute_increase.should be_within(-66.7, some_tolerance)
    end


      
    it "fossil_heat_in_use_of_final_demand_in_other_sector" do
      the_present.should be_within(81.331, some_tolerance)
      the_future.should  be_within(82.148, some_tolerance)
      the_relative_increase.should be_within(1.0, some_tolerance)
      the_absolute_increase.should be_within(0.8, some_tolerance)
    end


      
    it "fridges_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(15.438, some_tolerance)
      the_future.should  be_within(14.072, some_tolerance)
      the_relative_increase.should be_within(-8.8, some_tolerance)
      the_absolute_increase.should be_within(-1.4, some_tolerance)
    end


      
    it "fuel_cars_in_use_of_final_demand_in_transport" do
      the_present.should be_within(351.992, some_tolerance)
      the_future.should  be_within(350.818, some_tolerance)
      the_relative_increase.should be_within(-0.3, some_tolerance)
      the_absolute_increase.should be_within(-1.2, some_tolerance)
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
      the_future.should  be_within(8.808, some_tolerance)
      the_relative_increase.should be_within(39.2, some_tolerance)
      the_absolute_increase.should be_within(2.5, some_tolerance)
    end


      
    it "fuel_cost_in_breakdown_electricity_costs_corrected_for_electricity_imbalance" do
      the_present.should be_within(6.141, some_tolerance)
      the_future.should  be_within(8.718, some_tolerance)
      the_relative_increase.should be_within(42.0, some_tolerance)
      the_absolute_increase.should be_within(2.6, some_tolerance)
    end


      
    it "fuel_cost_in_breakdown_heating_costs" do
      the_present.should be_within(9.53, some_tolerance)
      the_future.should  be_within(14.308, some_tolerance)
      the_relative_increase.should be_within(50.1, some_tolerance)
      the_absolute_increase.should be_within(4.8, some_tolerance)
    end


      
    it "fuel_domestic_flights_in_use_of_final_demand_in_transport" do
      the_present.should be_within(2.1, some_tolerance)
      the_future.should  be_within(2.038, some_tolerance)
      the_relative_increase.should be_within(-3.0, some_tolerance)
      the_absolute_increase.should be_within(-0.1, some_tolerance)
    end


      
    it "fuel_inland_navigation_in_use_of_final_demand_in_transport" do
      the_present.should be_within(6.6, some_tolerance)
      the_future.should  be_within(7.216, some_tolerance)
      the_relative_increase.should be_within(9.3, some_tolerance)
      the_absolute_increase.should be_within(0.6, some_tolerance)
    end


      
    it "fuel_trains_in_use_of_final_demand_in_transport" do
      the_present.should be_within(1.43, some_tolerance)
      the_future.should  be_within(1.533, some_tolerance)
      the_relative_increase.should be_within(7.2, some_tolerance)
      the_absolute_increase.should be_within(0.1, some_tolerance)
    end


      
    it "fuel_trucks_in_use_of_final_demand_in_transport" do
      the_present.should be_within(120.868, some_tolerance)
      the_future.should  be_within(134.203, some_tolerance)
      the_relative_increase.should be_within(11.0, some_tolerance)
      the_absolute_increase.should be_within(13.3, some_tolerance)
    end


      
    it "fuels_in_breakdown_of_total_costs" do
      the_present.should be_within(9.6, some_tolerance)
      the_future.should  be_within(14.158, some_tolerance)
      the_relative_increase.should be_within(47.5, some_tolerance)
      the_absolute_increase.should be_within(4.6, some_tolerance)
    end


      
    it "fuels_in_breakdown_of_total_costs_per_household" do
      the_present.should be_within(1306.209, some_tolerance)
      the_future.should  be_within(1926.325, some_tolerance)
      the_relative_increase.should be_within(47.5, some_tolerance)
      the_absolute_increase.should be_within(620.1, some_tolerance)
    end


          it "future_demand_in_source_of_electricity_in_buildings" do
      the_value.should be_within(100.502, some_tolerance)
    end

          it "future_demand_in_source_of_electricity_in_households" do
      the_value.should be_within(75.037, some_tolerance)
    end

          it "future_demand_in_source_of_electricity_production" do
      the_value.should be_within(412.79, some_tolerance)
    end

          it "future_peak_electricity_demand" do
      the_value.should be_within(16374.881, some_tolerance)
    end

          it "future_total_investment_costs_power_production_corrected_for_imbalance" do
      the_value.should be_within(43660839477.727, some_tolerance)
    end

          it "gas_agriculture_in_mekko_of_final_demand" do
      the_value.should be_within(67.753, some_tolerance)
    end

          it "gas_agriculture_in_mekko_of_primary_demand" do
      the_value.should be_within(127.155, some_tolerance)
    end

          it "gas_buildings_in_mekko_of_final_demand" do
      the_value.should be_within(118.844, some_tolerance)
    end

          it "gas_buildings_in_mekko_of_primary_demand" do
      the_value.should be_within(196.507, some_tolerance)
    end

          it "gas_conversion_in_fuel_chain_emissions" do
      the_value.should be_within(55.279, some_tolerance)
    end

          it "gas_extraction_in_fuel_chain_emissions" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "gas_households_in_mekko_of_final_demand" do
      the_value.should be_within(292.31, some_tolerance)
    end

          it "gas_households_in_mekko_of_primary_demand" do
      the_value.should be_within(350.178, some_tolerance)
    end

          it "gas_in_future_energy_imports" do
      the_value.should be_within(80.246, some_tolerance)
    end

      
    it "gas_in_source_of_electricity_production" do
      the_present.should be_within(264.287, some_tolerance)
      the_future.should  be_within(215.436, some_tolerance)
      the_relative_increase.should be_within(-18.5, some_tolerance)
      the_absolute_increase.should be_within(-48.9, some_tolerance)
    end


          it "gas_industry_in_mekko_of_final_demand" do
      the_value.should be_within(304.632, some_tolerance)
    end

          it "gas_industry_in_mekko_of_primary_demand" do
      the_value.should be_within(744.856, some_tolerance)
    end

          it "gas_other_in_mekko_of_final_demand" do
      the_value.should be_within(58.764, some_tolerance)
    end

          it "gas_other_in_mekko_of_primary_demand" do
      the_value.should be_within(69.664, some_tolerance)
    end

          it "gas_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(14.528, some_tolerance)
    end

          it "gas_plants_in_power_plant_properties" do
      the_value.should be_within(264.446, some_tolerance)
    end

          it "gas_plants_investm_in_power_plant_properties" do
      the_value.should be_within(12422.131, some_tolerance)
    end

          it "gas_plants_prod_in_power_plant_properties" do
      the_value.should be_within(226.774, some_tolerance)
    end

          it "gas_power_plants_plants_in_power_plant_properties" do
      the_value.should be_within(3284.477, some_tolerance)
    end

          it "gas_transport_in_mekko_of_final_demand" do
      the_value.should be_within(19.937, some_tolerance)
    end

          it "gas_transport_in_mekko_of_primary_demand" do
      the_value.should be_within(26.886, some_tolerance)
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
      the_future.should  be_within(158.619, some_tolerance)
      the_relative_increase.should be_within(-11.2, some_tolerance)
      the_absolute_increase.should be_within(-20.0, some_tolerance)
    end


      
    it "geothermal_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(0.004, some_tolerance)
      the_future.should  be_within(0.041, some_tolerance)
      the_relative_increase.should be_within(877.2, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "geothermal_in_source_of_electricity_production" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "geothermal_in_source_of_heat_production" do
      the_present.should be_within(0.1, some_tolerance)
      the_future.should  be_within(0.977, some_tolerance)
      the_relative_increase.should be_within(877.2, some_tolerance)
      the_absolute_increase.should be_within(0.9, some_tolerance)
    end


          it "greengas_agriculture_in_gas_use_for_electricity_production" do
      the_value.should be_within(5.902, some_tolerance)
    end

          it "greengas_agriculture_in_gas_versus_other_primary_energy" do
      the_value.should be_within(6.606, some_tolerance)
    end

          it "greengas_agriculture_in_mekko_of_primary_demand" do
      the_value.should be_within(6.516, some_tolerance)
    end

          it "greengas_buildings_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.033, some_tolerance)
    end

          it "greengas_buildings_in_gas_versus_other_primary_energy" do
      the_value.should be_within(10.209, some_tolerance)
    end

          it "greengas_buildings_in_mekko_of_primary_demand" do
      the_value.should be_within(10.07, some_tolerance)
    end

          it "greengas_conversion_in_fuel_chain_emissions" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "greengas_energy_in_gas_use_for_electricity_production" do
      the_value.should be_within(12.518, some_tolerance)
    end

          it "greengas_extraction_in_fuel_chain_emissions" do
      the_value.should be_within(17.827, some_tolerance)
    end

          it "greengas_households_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "greengas_households_in_gas_versus_other_primary_energy" do
      the_value.should be_within(18.192, some_tolerance)
    end

          it "greengas_households_in_mekko_of_primary_demand" do
      the_value.should be_within(17.946, some_tolerance)
    end

      
    it "greengas_in_gas_network_mix" do
      the_present.should be_within(0.981, some_tolerance)
      the_future.should  be_within(79.1, some_tolerance)
      the_relative_increase.should be_within(7960.2, some_tolerance)
      the_absolute_increase.should be_within(78.1, some_tolerance)
    end


      
    it "greengas_in_source_of_electricity_production" do
      the_present.should be_within(0.159, some_tolerance)
      the_future.should  be_within(11.339, some_tolerance)
      the_relative_increase.should be_within(7021.7, some_tolerance)
      the_absolute_increase.should be_within(11.2, some_tolerance)
    end


      
    it "greengas_in_use_of_transport_fuels" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.997, some_tolerance)
      the_relative_increase.should be_within(359847.4, some_tolerance)
      the_absolute_increase.should be_within(1.0, some_tolerance)
    end


          it "greengas_industry_in_gas_use_for_electricity_production" do
      the_value.should be_within(10.3, some_tolerance)
    end

          it "greengas_industry_in_gas_versus_other_primary_energy" do
      the_value.should be_within(38.697, some_tolerance)
    end

          it "greengas_industry_in_mekko_of_primary_demand" do
      the_value.should be_within(38.171, some_tolerance)
    end

          it "greengas_other_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.116, some_tolerance)
    end

          it "greengas_other_in_gas_versus_other_primary_energy" do
      the_value.should be_within(3.619, some_tolerance)
    end

          it "greengas_other_in_mekko_of_primary_demand" do
      the_value.should be_within(3.57, some_tolerance)
    end

          it "greengas_to_electricity_production_agriculture_in_gas_flow_to_sectors" do
      the_value.should be_within(5.902, some_tolerance)
    end

          it "greengas_to_electricity_production_buildings_in_gas_flow_to_sectors" do
      the_value.should be_within(0.033, some_tolerance)
    end

          it "greengas_to_electricity_production_energy_in_gas_flow_to_sectors" do
      the_value.should be_within(12.518, some_tolerance)
    end

          it "greengas_to_electricity_production_households_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "greengas_to_electricity_production_industry_in_gas_flow_to_sectors" do
      the_value.should be_within(10.3, some_tolerance)
    end

          it "greengas_to_electricity_production_other_in_gas_flow_to_sectors" do
      the_value.should be_within(0.116, some_tolerance)
    end

          it "greengas_to_electricity_production_transport_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "greengas_transport_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "greengas_transport_in_gas_versus_other_primary_energy" do
      the_value.should be_within(1.397, some_tolerance)
    end

          it "greengas_transport_in_mekko_of_primary_demand" do
      the_value.should be_within(1.378, some_tolerance)
    end

          it "greengas_transportation_in_fuel_chain_emissions" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "greengas_treatment_in_fuel_chain_emissions" do
      the_value.should be_within(1.662, some_tolerance)
    end

      
    it "growth_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(227.41, some_tolerance)
      the_future.should  be_within(246.738, some_tolerance)
      the_relative_increase.should be_within(8.5, some_tolerance)
      the_absolute_increase.should be_within(19.3, some_tolerance)
    end


      
    it "heat_demand_buildings_in_effect_of_insulation_in_buildings" do
      the_present.should be_within(200.153, some_tolerance)
      the_future.should  be_within(147.242, some_tolerance)
      the_relative_increase.should be_within(-26.4, some_tolerance)
      the_absolute_increase.should be_within(-52.9, some_tolerance)
    end


      
    it "heat_demand_buildings_in_use_of_final_demand_in_buildings" do
      the_present.should be_within(144.11, some_tolerance)
      the_future.should  be_within(93.867, some_tolerance)
      the_relative_increase.should be_within(-34.9, some_tolerance)
      the_absolute_increase.should be_within(-50.2, some_tolerance)
    end


      
    it "heat_demand_including_electric_heating_in_effect_of_insulation_in_households" do
      the_present.should be_within(299.329, some_tolerance)
      the_future.should  be_within(231.539, some_tolerance)
      the_relative_increase.should be_within(-22.6, some_tolerance)
      the_absolute_increase.should be_within(-67.8, some_tolerance)
    end


      
    it "heat_demand_including_electric_heating_in_use_of_final_demand_in_households" do
      the_present.should be_within(299.329, some_tolerance)
      the_future.should  be_within(231.539, some_tolerance)
      the_relative_increase.should be_within(-22.6, some_tolerance)
      the_absolute_increase.should be_within(-67.8, some_tolerance)
    end


      
    it "heat_from_biomass_in_effect_of_insulation_in_households2" do
      the_present.should be_within(9.503, some_tolerance)
      the_future.should  be_within(7.714, some_tolerance)
      the_relative_increase.should be_within(-18.8, some_tolerance)
      the_absolute_increase.should be_within(-1.8, some_tolerance)
    end


      
    it "heat_from_biomass_in_source_of_heat_and_electricity_used_in_households" do
      the_present.should be_within(7.642, some_tolerance)
      the_future.should  be_within(6.158, some_tolerance)
      the_relative_increase.should be_within(-19.4, some_tolerance)
      the_absolute_increase.should be_within(-1.5, some_tolerance)
    end


      
    it "heat_from_biomass_in_source_of_heat_in_agriculture" do
      the_present.should be_within(0.744, some_tolerance)
      the_future.should  be_within(5.204, some_tolerance)
      the_relative_increase.should be_within(599.7, some_tolerance)
      the_absolute_increase.should be_within(4.5, some_tolerance)
    end


      
    it "heat_from_biomass_in_source_of_heat_in_buildings" do
      the_present.should be_within(0.07, some_tolerance)
      the_future.should  be_within(11.336, some_tolerance)
      the_relative_increase.should be_within(16090.6, some_tolerance)
      the_absolute_increase.should be_within(11.3, some_tolerance)
    end


      
    it "heat_from_biomass_in_source_of_heat_in_industry" do
      the_present.should be_within(2.785, some_tolerance)
      the_future.should  be_within(14.633, some_tolerance)
      the_relative_increase.should be_within(425.5, some_tolerance)
      the_absolute_increase.should be_within(11.8, some_tolerance)
    end


      
    it "heat_from_biomass_in_source_of_heat_production" do
      the_present.should be_within(15.76, some_tolerance)
      the_future.should  be_within(60.256, some_tolerance)
      the_relative_increase.should be_within(282.3, some_tolerance)
      the_absolute_increase.should be_within(44.5, some_tolerance)
    end


      
    it "heat_from_biomass_in_use_of_final_demand_in_agriculture" do
      the_present.should be_within(0.744, some_tolerance)
      the_future.should  be_within(5.204, some_tolerance)
      the_relative_increase.should be_within(599.7, some_tolerance)
      the_absolute_increase.should be_within(4.5, some_tolerance)
    end


      
    it "heat_from_biomass_in_use_of_final_demand_in_industry" do
      the_present.should be_within(3.464, some_tolerance)
      the_future.should  be_within(17.101, some_tolerance)
      the_relative_increase.should be_within(393.6, some_tolerance)
      the_absolute_increase.should be_within(13.6, some_tolerance)
    end


      
    it "heat_from_biomass_in_use_of_final_demand_in_other_sector" do
      the_present.should be_within(2.392, some_tolerance)
      the_future.should  be_within(5.407, some_tolerance)
      the_relative_increase.should be_within(126.1, some_tolerance)
      the_absolute_increase.should be_within(3.0, some_tolerance)
    end


      
    it "heat_from_chp_in_source_of_heat_in_agriculture" do
      the_present.should be_within(55.0, some_tolerance)
      the_future.should  be_within(23.551, some_tolerance)
      the_relative_increase.should be_within(-57.2, some_tolerance)
      the_absolute_increase.should be_within(-31.4, some_tolerance)
    end


      
    it "heat_from_chp_in_source_of_heat_in_industry" do
      the_present.should be_within(153.04, some_tolerance)
      the_future.should  be_within(272.672, some_tolerance)
      the_relative_increase.should be_within(78.2, some_tolerance)
      the_absolute_increase.should be_within(119.6, some_tolerance)
    end


      
    it "heat_from_chp_in_source_of_heat_production" do
      the_present.should be_within(231.775, some_tolerance)
      the_future.should  be_within(215.082, some_tolerance)
      the_relative_increase.should be_within(-7.2, some_tolerance)
      the_absolute_increase.should be_within(-16.7, some_tolerance)
    end


      
    it "heat_from_chp_in_use_of_final_demand_in_industry" do
      the_present.should be_within(153.04, some_tolerance)
      the_future.should  be_within(272.672, some_tolerance)
      the_relative_increase.should be_within(78.2, some_tolerance)
      the_absolute_increase.should be_within(119.6, some_tolerance)
    end


      
    it "heat_from_coal_in_source_of_heat_in_industry" do
      the_present.should be_within(18.072, some_tolerance)
      the_future.should  be_within(24.238, some_tolerance)
      the_relative_increase.should be_within(34.1, some_tolerance)
      the_absolute_increase.should be_within(6.2, some_tolerance)
    end


      
    it "heat_from_district_heating_in_source_of_heat_used_in_households" do
      the_present.should be_within(9.266, some_tolerance)
      the_future.should  be_within(7.028, some_tolerance)
      the_relative_increase.should be_within(-24.2, some_tolerance)
      the_absolute_increase.should be_within(-2.2, some_tolerance)
    end


      
    it "heat_from_electricity_in_effect_of_insulation_in_households2" do
      the_present.should be_within(5.441, some_tolerance)
      the_future.should  be_within(3.808, some_tolerance)
      the_relative_increase.should be_within(-30.0, some_tolerance)
      the_absolute_increase.should be_within(-1.6, some_tolerance)
    end


      
    it "heat_from_electricity_in_source_of_heat_in_buildings" do
      the_present.should be_within(1.828, some_tolerance)
      the_future.should  be_within(1.783, some_tolerance)
      the_relative_increase.should be_within(-2.4, some_tolerance)
      the_absolute_increase.should be_within(-0.0, some_tolerance)
    end


      
    it "heat_from_electricity_in_source_of_heat_production" do
      the_present.should be_within(28.376, some_tolerance)
      the_future.should  be_within(19.007, some_tolerance)
      the_relative_increase.should be_within(-33.0, some_tolerance)
      the_absolute_increase.should be_within(-9.4, some_tolerance)
    end


      
    it "heat_from_electricity_in_source_of_heat_used_in_households" do
      the_present.should be_within(5.441, some_tolerance)
      the_future.should  be_within(3.808, some_tolerance)
      the_relative_increase.should be_within(-30.0, some_tolerance)
      the_absolute_increase.should be_within(-1.6, some_tolerance)
    end


      
    it "heat_from_fossil_fuels_in_effect_of_insulation_in_households2" do
      the_present.should be_within(285.544, some_tolerance)
      the_future.should  be_within(217.161, some_tolerance)
      the_relative_increase.should be_within(-23.9, some_tolerance)
      the_absolute_increase.should be_within(-68.4, some_tolerance)
    end


      
    it "heat_from_fossil_fuels_in_source_of_district_heating_in_buildings" do
      the_present.should be_within(8.914, some_tolerance)
      the_future.should  be_within(5.484, some_tolerance)
      the_relative_increase.should be_within(-38.5, some_tolerance)
      the_absolute_increase.should be_within(-3.4, some_tolerance)
    end


      
    it "heat_from_fossil_fuels_in_source_of_district_heating_in_households" do
      the_present.should be_within(10.739, some_tolerance)
      the_future.should  be_within(9.066, some_tolerance)
      the_relative_increase.should be_within(-15.6, some_tolerance)
      the_absolute_increase.should be_within(-1.7, some_tolerance)
    end


      
    it "heat_from_fossil_fuels_in_source_of_heat_in_buildings" do
      the_present.should be_within(140.667, some_tolerance)
      the_future.should  be_within(71.529, some_tolerance)
      the_relative_increase.should be_within(-49.2, some_tolerance)
      the_absolute_increase.should be_within(-69.1, some_tolerance)
    end


      
    it "heat_from_fossil_fuels_in_source_of_heat_used_in_households" do
      the_present.should be_within(273.799, some_tolerance)
      the_future.should  be_within(195.959, some_tolerance)
      the_relative_increase.should be_within(-28.4, some_tolerance)
      the_absolute_increase.should be_within(-77.8, some_tolerance)
    end


      
    it "heat_from_gas_in_source_of_heat_in_agriculture" do
      the_present.should be_within(27.074, some_tolerance)
      the_future.should  be_within(57.929, some_tolerance)
      the_relative_increase.should be_within(114.0, some_tolerance)
      the_absolute_increase.should be_within(30.9, some_tolerance)
    end


      
    it "heat_from_gas_in_source_of_heat_in_industry" do
      the_present.should be_within(200.489, some_tolerance)
      the_future.should  be_within(162.906, some_tolerance)
      the_relative_increase.should be_within(-18.7, some_tolerance)
      the_absolute_increase.should be_within(-37.6, some_tolerance)
    end


      
    it "heat_from_oil_in_source_of_heat_in_agriculture" do
      the_present.should be_within(12.619, some_tolerance)
      the_future.should  be_within(7.329, some_tolerance)
      the_relative_increase.should be_within(-41.9, some_tolerance)
      the_absolute_increase.should be_within(-5.3, some_tolerance)
    end


      
    it "heat_from_oil_in_source_of_heat_in_industry" do
      the_present.should be_within(158.605, some_tolerance)
      the_future.should  be_within(131.489, some_tolerance)
      the_relative_increase.should be_within(-17.1, some_tolerance)
      the_absolute_increase.should be_within(-27.1, some_tolerance)
    end


      
    it "heat_from_renewables_in_source_of_district_heating_in_buildings" do
      the_present.should be_within(0.086, some_tolerance)
      the_future.should  be_within(0.378, some_tolerance)
      the_relative_increase.should be_within(338.3, some_tolerance)
      the_absolute_increase.should be_within(0.3, some_tolerance)
    end


      
    it "heat_from_renewables_in_source_of_district_heating_in_households" do
      the_present.should be_within(0.621, some_tolerance)
      the_future.should  be_within(0.58, some_tolerance)
      the_relative_increase.should be_within(-6.6, some_tolerance)
      the_absolute_increase.should be_within(-0.0, some_tolerance)
    end


      
    it "heat_from_renewables_in_source_of_heat_used_in_buildings" do
      the_present.should be_within(1.653, some_tolerance)
      the_future.should  be_within(20.552, some_tolerance)
      the_relative_increase.should be_within(1143.3, some_tolerance)
      the_absolute_increase.should be_within(18.9, some_tolerance)
    end


      
    it "heat_from_renewables_in_source_of_heat_used_in_households" do
      the_present.should be_within(10.823, some_tolerance)
      the_future.should  be_within(24.744, some_tolerance)
      the_relative_increase.should be_within(128.6, some_tolerance)
      the_absolute_increase.should be_within(13.9, some_tolerance)
    end


      
    it "heat_from_waste_in_source_of_heat_production" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_hot_water_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(12.45, some_tolerance)
      the_future.should  be_within(4.928, some_tolerance)
      the_relative_increase.should be_within(-60.4, some_tolerance)
      the_absolute_increase.should be_within(-7.5, some_tolerance)
    end


      
    it "heat_in_breakdown_of_total_costs" do
      the_present.should be_within(16.858, some_tolerance)
      the_future.should  be_within(21.296, some_tolerance)
      the_relative_increase.should be_within(26.3, some_tolerance)
      the_absolute_increase.should be_within(4.4, some_tolerance)
    end


      
    it "heat_in_breakdown_of_total_costs_per_household" do
      the_present.should be_within(2293.784, some_tolerance)
      the_future.should  be_within(2897.547, some_tolerance)
      the_relative_increase.should be_within(26.3, some_tolerance)
      the_absolute_increase.should be_within(603.8, some_tolerance)
    end


          it "heat_in_future_energy_imports" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "heat_in_use_of_electricity_in_buildings" do
      the_present.should be_within(1.828, some_tolerance)
      the_future.should  be_within(1.783, some_tolerance)
      the_relative_increase.should be_within(-2.4, some_tolerance)
      the_absolute_increase.should be_within(-0.0, some_tolerance)
    end


          it "heat_value_in_present_energy_imports" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "heatpumps_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(0.063, some_tolerance)
      the_future.should  be_within(1.107, some_tolerance)
      the_relative_increase.should be_within(1651.3, some_tolerance)
      the_absolute_increase.should be_within(1.0, some_tolerance)
    end


      
    it "heavy_fuel_oil_in_use_of_transport_fuels" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "high_voltage_network_in_annual_costs_of_infrastructure" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(32367014.206, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(32367014.2, some_tolerance)
    end


          it "hot_water_agriculture_in_mekko_of_final_demand" do
      the_value.should be_within(23.551, some_tolerance)
    end

          it "hot_water_buildings_in_mekko_of_final_demand" do
      the_value.should be_within(5.862, some_tolerance)
    end

      
    it "hot_water_demand_in_use_of_final_demand_in_households" do
      the_present.should be_within(95.748, some_tolerance)
      the_future.should  be_within(97.68, some_tolerance)
      the_relative_increase.should be_within(2.0, some_tolerance)
      the_absolute_increase.should be_within(1.9, some_tolerance)
    end


      
    it "hot_water_from_district_heating_in_source_of_hot_water_in_households" do
      the_present.should be_within(2.238, some_tolerance)
      the_future.should  be_within(2.741, some_tolerance)
      the_relative_increase.should be_within(22.5, some_tolerance)
      the_absolute_increase.should be_within(0.5, some_tolerance)
    end


      
    it "hot_water_from_electricity_in_source_of_hot_water_in_households" do
      the_present.should be_within(7.036, some_tolerance)
      the_future.should  be_within(1.871, some_tolerance)
      the_relative_increase.should be_within(-73.4, some_tolerance)
      the_absolute_increase.should be_within(-5.2, some_tolerance)
    end


      
    it "hot_water_from_fossil_fuels_in_source_of_hot_water_in_households" do
      the_present.should be_within(85.482, some_tolerance)
      the_future.should  be_within(82.853, some_tolerance)
      the_relative_increase.should be_within(-3.1, some_tolerance)
      the_absolute_increase.should be_within(-2.6, some_tolerance)
    end


      
    it "hot_water_from_renewables_in_source_of_hot_water_in_households" do
      the_present.should be_within(0.991, some_tolerance)
      the_future.should  be_within(10.138, some_tolerance)
      the_relative_increase.should be_within(922.7, some_tolerance)
      the_absolute_increase.should be_within(9.1, some_tolerance)
    end


          it "hot_water_households_in_mekko_of_final_demand" do
      the_value.should be_within(9.647, some_tolerance)
    end

          it "hot_water_industry_in_mekko_of_final_demand" do
      the_value.should be_within(272.672, some_tolerance)
    end

          it "hot_water_other_in_mekko_of_final_demand" do
      the_value.should be_within(9.545, some_tolerance)
    end

          it "hot_water_transport_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "hv_capacity_total_in_impact_on_electricity_grid" do
      the_value.should be_within(616.515, some_tolerance)
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
      the_value.should be_within(1365.558, some_tolerance)
    end

          it "hv_mv_networkcosts_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "hv_mv_required_expansion_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "hv_net_in_additional_infrastructure_investments" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(616.515, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(616.5, some_tolerance)
    end


      
    it "hydro_in_source_of_electricity_production" do
      the_present.should be_within(0.36, some_tolerance)
      the_future.should  be_within(0.389, some_tolerance)
      the_relative_increase.should be_within(8.1, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
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
      the_future.should  be_within(22.653, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(22.7, some_tolerance)
    end


      
    it "insulation_savings_new_houses_in_effect_of_insulation_in_households" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.896, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.9, some_tolerance)
    end


      
    it "insulation_savings_old_houses_in_effect_of_insulation_in_households" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(31.277, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(31.3, some_tolerance)
    end


          it "investment_for_biomass_chp_in_overview_costs_of_electricity_production" do
      the_value.should be_within(2.266, some_tolerance)
    end

          it "investment_for_co_firing_coal_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.771, some_tolerance)
    end

          it "investment_for_coal_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(2.643, some_tolerance)
    end

          it "investment_for_coal_chp_in_overview_costs_of_electricity_production" do
      the_value.should be_within(2.019, some_tolerance)
    end

          it "investment_for_coal_conventional_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.185, some_tolerance)
    end

          it "investment_for_coal_igcc_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(2.942, some_tolerance)
    end

          it "investment_for_coal_igcc_in_overview_costs_of_electricity_production" do
      the_value.should be_within(2.314, some_tolerance)
    end

          it "investment_for_coal_lignite_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.541, some_tolerance)
    end

          it "investment_for_coal_oxyfuel_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(3.951, some_tolerance)
    end

          it "investment_for_coal_powder_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.8, some_tolerance)
    end

          it "investment_for_gas_ccgt_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.131, some_tolerance)
    end

          it "investment_for_gas_ccgt_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.835, some_tolerance)
    end

          it "investment_for_gas_chp_central_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.101, some_tolerance)
    end

          it "investment_for_gas_chp_industry_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.71, some_tolerance)
    end

          it "investment_for_gas_conventional_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.436, some_tolerance)
    end

          it "investment_for_gas_turbine_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.6, some_tolerance)
    end

          it "investment_for_geothermal_well_in_overview_costs_of_electricity_production" do
      the_value.should be_within(11.631, some_tolerance)
    end

          it "investment_for_hydro_mountain_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.236, some_tolerance)
    end

          it "investment_for_hydro_river_in_overview_costs_of_electricity_production" do
      the_value.should be_within(3.96, some_tolerance)
    end

          it "investment_for_nuclear_3rd_generation_in_overview_costs_of_electricity_production" do
      the_value.should be_within(4.143, some_tolerance)
    end

          it "investment_for_nuclear_conventional_in_overview_costs_of_electricity_production" do
      the_value.should be_within(2.327, some_tolerance)
    end

          it "investment_for_oil_plant_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.564, some_tolerance)
    end

          it "investment_for_solar_csp_in_overview_costs_of_electricity_production" do
      the_value.should be_within(3.15, some_tolerance)
    end

          it "investment_for_solar_pv_centrally_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.443, some_tolerance)
    end

          it "investment_for_solar_pv_on_roofs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.443, some_tolerance)
    end

          it "investment_for_waste_incinerator_in_overview_costs_of_electricity_production" do
      the_value.should be_within(5.77, some_tolerance)
    end

          it "investment_for_wind_coastal_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.253, some_tolerance)
    end

          it "investment_for_wind_inland_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.253, some_tolerance)
    end

          it "investment_for_wind_offshore_in_overview_costs_of_electricity_production" do
      the_value.should be_within(3.434, some_tolerance)
    end

      
    it "kerosine_in_use_of_transport_fuels" do
      the_present.should be_within(2.0, some_tolerance)
      the_future.should  be_within(1.941, some_tolerance)
      the_relative_increase.should be_within(-3.0, some_tolerance)
      the_absolute_increase.should be_within(-0.1, some_tolerance)
    end


      
    it "lighting_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(26.513, some_tolerance)
      the_future.should  be_within(19.87, some_tolerance)
      the_relative_increase.should be_within(-25.1, some_tolerance)
      the_absolute_increase.should be_within(-6.6, some_tolerance)
    end


      
    it "lighting_in_use_of_electricity_in_buildings" do
      the_present.should be_within(72.597, some_tolerance)
      the_future.should  be_within(58.628, some_tolerance)
      the_relative_increase.should be_within(-19.2, some_tolerance)
      the_absolute_increase.should be_within(-14.0, some_tolerance)
    end


      
    it "lighting_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(14.229, some_tolerance)
      the_future.should  be_within(8.193, some_tolerance)
      the_relative_increase.should be_within(-42.4, some_tolerance)
      the_absolute_increase.should be_within(-6.0, some_tolerance)
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
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "lpg_in_use_of_transport_fuels" do
      the_present.should be_within(13.6, some_tolerance)
      the_future.should  be_within(6.131, some_tolerance)
      the_relative_increase.should be_within(-54.9, some_tolerance)
      the_absolute_increase.should be_within(-7.5, some_tolerance)
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
      the_value.should be_within(2706.122, some_tolerance)
    end

      
    it "lv_mv_transformer_in_additional_infrastructure_investments" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
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
      the_future.should  be_within(13.501, some_tolerance)
      the_relative_increase.should be_within(-2.1, some_tolerance)
      the_absolute_increase.should be_within(-0.3, some_tolerance)
    end


      
    it "medium_voltage_network_in_annual_costs_of_infrastructure" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


          it "merit_order_central_gas_chp_capacity_in_merit_order_table" do
      the_value.should be_within(1966.345, some_tolerance)
    end

      
    it "merit_order_central_gas_chp_full_load_hours_in_merit_order_table" do
      the_present.should be_within(846.1, some_tolerance)
      the_future.should  be_within(7470.5, some_tolerance)
      the_relative_increase.should be_within(782.9, some_tolerance)
      the_absolute_increase.should be_within(6624.4, some_tolerance)
    end


          it "merit_order_central_gas_chp_operating_costs_in_merit_order_table" do
      the_value.should be_within(104.188, some_tolerance)
    end

          it "merit_order_central_gas_chp_position_in_merit_order_table" do
      the_value.should be_within(7.0, some_tolerance)
    end

          it "merit_order_central_gas_chp_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(846.1, some_tolerance)
    end

          it "merit_order_co_firing_coal_capacity_in_merit_order_table" do
      the_value.should be_within(569.6, some_tolerance)
    end

      
    it "merit_order_co_firing_coal_full_load_hours_in_merit_order_table" do
      the_present.should be_within(2020.7, some_tolerance)
      the_future.should  be_within(7774.1, some_tolerance)
      the_relative_increase.should be_within(284.7, some_tolerance)
      the_absolute_increase.should be_within(5753.4, some_tolerance)
    end


          it "merit_order_co_firing_coal_operating_costs_in_merit_order_table" do
      the_value.should be_within(79.614, some_tolerance)
    end

          it "merit_order_co_firing_coal_position_in_merit_order_table" do
      the_value.should be_within(6.0, some_tolerance)
    end

          it "merit_order_co_firing_coal_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(2020.7, some_tolerance)
    end

          it "merit_order_coal_chp_capacity_in_merit_order_table" do
      the_value.should be_within(1003.965, some_tolerance)
    end

      
    it "merit_order_coal_chp_full_load_hours_in_merit_order_table" do
      the_present.should be_within(7530.1, some_tolerance)
      the_future.should  be_within(7708.8, some_tolerance)
      the_relative_increase.should be_within(2.4, some_tolerance)
      the_absolute_increase.should be_within(178.7, some_tolerance)
    end


          it "merit_order_coal_chp_operating_costs_in_merit_order_table" do
      the_value.should be_within(43.626, some_tolerance)
    end

          it "merit_order_coal_chp_position_in_merit_order_table" do
      the_value.should be_within(4.0, some_tolerance)
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
      the_value.should be_within(49.438, some_tolerance)
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
      the_value.should be_within(171.738, some_tolerance)
    end

      
    it "merit_order_coal_igcc_ccs_full_load_hours_in_merit_order_table" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(7621.2, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(7621.2, some_tolerance)
    end


          it "merit_order_coal_igcc_ccs_operating_costs_in_merit_order_table" do
      the_value.should be_within(42.854, some_tolerance)
    end

          it "merit_order_coal_igcc_ccs_position_in_merit_order_table" do
      the_value.should be_within(3.0, some_tolerance)
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
      the_value.should be_within(38.697, some_tolerance)
    end

          it "merit_order_coal_igcc_position_in_merit_order_table" do
      the_value.should be_within(1000.0, some_tolerance)
    end

          it "merit_order_coal_igcc_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(7884.0, some_tolerance)
    end

          it "merit_order_coal_pwd_capacity_in_merit_order_table" do
      the_value.should be_within(1196.8, some_tolerance)
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
      the_value.should be_within(49.985, some_tolerance)
    end

          it "merit_order_coal_pwd_ccs_position_in_merit_order_table" do
      the_value.should be_within(1000.0, some_tolerance)
    end

          it "merit_order_coal_pwd_ccs_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "merit_order_coal_pwd_full_load_hours_in_merit_order_table" do
      the_present.should be_within(7706.3, some_tolerance)
      the_future.should  be_within(7708.8, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(2.5, some_tolerance)
    end


          it "merit_order_coal_pwd_operating_costs_in_merit_order_table" do
      the_value.should be_within(38.884, some_tolerance)
    end

          it "merit_order_coal_pwd_position_in_merit_order_table" do
      the_value.should be_within(2.0, some_tolerance)
    end

          it "merit_order_coal_pwd_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(7706.3, some_tolerance)
    end

          it "merit_order_gas_ccgt_capacity_in_merit_order_table" do
      the_value.should be_within(3456.0, some_tolerance)
    end

          it "merit_order_gas_ccgt_ccs_capacity_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "merit_order_gas_ccgt_ccs_full_load_hours_in_merit_order_table" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


          it "merit_order_gas_ccgt_ccs_operating_costs_in_merit_order_table" do
      the_value.should be_within(96.051, some_tolerance)
    end

          it "merit_order_gas_ccgt_ccs_position_in_merit_order_table" do
      the_value.should be_within(1000.0, some_tolerance)
    end

          it "merit_order_gas_ccgt_ccs_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "merit_order_gas_ccgt_full_load_hours_in_merit_order_table" do
      the_present.should be_within(4892.6, some_tolerance)
      the_future.should  be_within(7884.0, some_tolerance)
      the_relative_increase.should be_within(61.1, some_tolerance)
      the_absolute_increase.should be_within(2991.4, some_tolerance)
    end


          it "merit_order_gas_ccgt_operating_costs_in_merit_order_table" do
      the_value.should be_within(79.039, some_tolerance)
    end

          it "merit_order_gas_ccgt_position_in_merit_order_table" do
      the_value.should be_within(5.0, some_tolerance)
    end

          it "merit_order_gas_ccgt_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(4892.6, some_tolerance)
    end

          it "merit_order_gas_conv_capacity_in_merit_order_table" do
      the_value.should be_within(2064.8, some_tolerance)
    end

      
    it "merit_order_gas_conv_full_load_hours_in_merit_order_table" do
      the_present.should be_within(58.2, some_tolerance)
      the_future.should  be_within(5466.7, some_tolerance)
      the_relative_increase.should be_within(9293.0, some_tolerance)
      the_absolute_increase.should be_within(5408.5, some_tolerance)
    end


          it "merit_order_gas_conv_operating_costs_in_merit_order_table" do
      the_value.should be_within(115.708, some_tolerance)
    end

          it "merit_order_gas_conv_position_in_merit_order_table" do
      the_value.should be_within(8.0, some_tolerance)
    end

          it "merit_order_gas_conv_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(58.2, some_tolerance)
    end

          it "merit_order_gas_turbine_capacity_in_merit_order_table" do
      the_value.should be_within(192.531, some_tolerance)
    end

      
    it "merit_order_gas_turbine_full_load_hours_in_merit_order_table" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(3952.7, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(3952.7, some_tolerance)
    end


          it "merit_order_gas_turbine_operating_costs_in_merit_order_table" do
      the_value.should be_within(136.744, some_tolerance)
    end

          it "merit_order_gas_turbine_position_in_merit_order_table" do
      the_value.should be_within(9.0, some_tolerance)
    end

          it "merit_order_gas_turbine_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "merit_order_must_run_capacity_in_merit_order_table" do
      the_value.should be_within(7110.344, some_tolerance)
    end

      
    it "merit_order_must_run_full_load_hours_in_merit_order_table" do
      the_present.should be_within(4824.382, some_tolerance)
      the_future.should  be_within(4839.395, some_tolerance)
      the_relative_increase.should be_within(0.3, some_tolerance)
      the_absolute_increase.should be_within(15.0, some_tolerance)
    end


          it "merit_order_must_run_operating_costs_in_merit_order_table" do
      the_value.should be_within(147.111, some_tolerance)
    end

          it "merit_order_must_run_position_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "merit_order_must_run_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(4824.382, some_tolerance)
    end

          it "merit_order_nuclear_iii_capacity_in_merit_order_table" do
      the_value.should be_within(445.5, some_tolerance)
    end

      
    it "merit_order_nuclear_iii_full_load_hours_in_merit_order_table" do
      the_present.should be_within(7884.0, some_tolerance)
      the_future.should  be_within(7884.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


          it "merit_order_nuclear_iii_operating_costs_in_merit_order_table" do
      the_value.should be_within(7.662, some_tolerance)
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
      the_value.should be_within(179.151, some_tolerance)
    end

          it "merit_order_oil_plant_position_in_merit_order_table" do
      the_value.should be_within(1000.0, some_tolerance)
    end

          it "merit_order_oil_plant_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "merit_order_solar_pv_capacity_in_merit_order_table" do
      the_value.should be_within(1241.324, some_tolerance)
    end

      
    it "merit_order_solar_pv_full_load_hours_in_merit_order_table" do
      the_present.should be_within(1000.0, some_tolerance)
      the_future.should  be_within(1001.579, some_tolerance)
      the_relative_increase.should be_within(0.2, some_tolerance)
      the_absolute_increase.should be_within(1.6, some_tolerance)
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
      the_value.should be_within(7320.0, some_tolerance)
    end

      
    it "merit_order_wind_turbines_full_load_hours_in_merit_order_table" do
      the_present.should be_within(2320.968, some_tolerance)
      the_future.should  be_within(2618.654, some_tolerance)
      the_relative_increase.should be_within(12.8, some_tolerance)
      the_absolute_increase.should be_within(297.7, some_tolerance)
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
      the_value.should be_within(25.311, some_tolerance)
    end

      
    it "micro_chp_in_source_of_electricity_in_households" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(6.115, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(6.1, some_tolerance)
    end


      
    it "minimum_available_capacity_in_security_of_supply" do
      the_present.should be_within(18073.648, some_tolerance)
      the_future.should  be_within(15484.094, some_tolerance)
      the_relative_increase.should be_within(-14.3, some_tolerance)
      the_absolute_increase.should be_within(-2589.6, some_tolerance)
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
      the_value.should be_within(1365.558, some_tolerance)
    end

      
    it "mv_distribution_in_additional_infrastructure_investments" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


          it "mv_distribution_networkcosts_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "mv_distribution_required_expansion_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
    end

      
    it "mv_hv_transformer_in_additional_infrastructure_investments" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
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
      the_value.should be_within(1689.194, some_tolerance)
    end

      
    it "mv_transport_in_additional_infrastructure_investments" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


          it "mv_transport_networkcosts_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "mv_transport_required_expansion_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
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
      the_value.should be_within(1894.286, some_tolerance)
    end

          it "mvlv_networkcosts_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "mvlv_required_expansion_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_agriculture_in_gas_use_for_electricity_production" do
      the_value.should be_within(113.598, some_tolerance)
    end

          it "natural_gas_agriculture_in_gas_versus_other_primary_energy" do
      the_value.should be_within(127.155, some_tolerance)
    end

          it "natural_gas_buildings_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.644, some_tolerance)
    end

          it "natural_gas_buildings_in_gas_versus_other_primary_energy" do
      the_value.should be_within(196.507, some_tolerance)
    end

          it "natural_gas_energy_in_gas_use_for_electricity_production" do
      the_value.should be_within(240.943, some_tolerance)
    end

          it "natural_gas_households_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_households_in_gas_versus_other_primary_energy" do
      the_value.should be_within(350.178, some_tolerance)
    end

      
    it "natural_gas_in_gas_network_mix" do
      the_present.should be_within(1629.006, some_tolerance)
      the_future.should  be_within(1502.892, some_tolerance)
      the_relative_increase.should be_within(-7.7, some_tolerance)
      the_absolute_increase.should be_within(-126.1, some_tolerance)
    end


      
    it "natural_gas_in_use_of_transport_fuels" do
      the_present.should be_within(0.46, some_tolerance)
      the_future.should  be_within(18.941, some_tolerance)
      the_relative_increase.should be_within(4020.0, some_tolerance)
      the_absolute_increase.should be_within(18.5, some_tolerance)
    end


          it "natural_gas_industry_in_gas_use_for_electricity_production" do
      the_value.should be_within(198.259, some_tolerance)
    end

          it "natural_gas_industry_in_gas_versus_other_primary_energy" do
      the_value.should be_within(744.856, some_tolerance)
    end

          it "natural_gas_other_in_gas_use_for_electricity_production" do
      the_value.should be_within(2.23, some_tolerance)
    end

          it "natural_gas_other_in_gas_versus_other_primary_energy" do
      the_value.should be_within(69.664, some_tolerance)
    end

          it "natural_gas_to_electricity_production_agriculture_in_gas_flow_to_sectors" do
      the_value.should be_within(113.598, some_tolerance)
    end

          it "natural_gas_to_electricity_production_buildings_in_gas_flow_to_sectors" do
      the_value.should be_within(0.644, some_tolerance)
    end

          it "natural_gas_to_electricity_production_energy_in_gas_flow_to_sectors" do
      the_value.should be_within(240.943, some_tolerance)
    end

          it "natural_gas_to_electricity_production_households_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_to_electricity_production_industry_in_gas_flow_to_sectors" do
      the_value.should be_within(198.259, some_tolerance)
    end

          it "natural_gas_to_electricity_production_other_in_gas_flow_to_sectors" do
      the_value.should be_within(2.23, some_tolerance)
    end

          it "natural_gas_to_electricity_production_transport_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_transport_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "natural_gas_transport_in_gas_versus_other_primary_energy" do
      the_value.should be_within(26.886, some_tolerance)
    end

      
    it "net_electricity_export" do
      the_present.should be_within(12.132, some_tolerance)
      the_future.should  be_within(12.231, some_tolerance)
      the_relative_increase.should be_within(0.8, some_tolerance)
      the_absolute_increase.should be_within(0.1, some_tolerance)
    end


      
    it "net_electricity_import" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "network_in_breakdown_of_total_costs" do
      the_present.should be_within(3.262, some_tolerance)
      the_future.should  be_within(3.294, some_tolerance)
      the_relative_increase.should be_within(1.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "network_in_breakdown_of_total_costs_per_household" do
      the_present.should be_within(443.84, some_tolerance)
      the_future.should  be_within(448.244, some_tolerance)
      the_relative_increase.should be_within(1.0, some_tolerance)
      the_absolute_increase.should be_within(4.4, some_tolerance)
    end


      
    it "new_residences_in_number_of_residences" do
      the_present.should be_within(1121208.0, some_tolerance)
      the_future.should  be_within(125279.744, some_tolerance)
      the_relative_increase.should be_within(-88.8, some_tolerance)
      the_absolute_increase.should be_within(-995928.3, some_tolerance)
    end


      
    it "non_energetic_fuels_in_breakdown_of_total_costs" do
      the_present.should be_within(8.792, some_tolerance)
      the_future.should  be_within(16.275, some_tolerance)
      the_relative_increase.should be_within(85.1, some_tolerance)
      the_absolute_increase.should be_within(7.5, some_tolerance)
    end


      
    it "non_energetic_fuels_in_breakdown_of_total_costs_per_household" do
      the_present.should be_within(1196.291, some_tolerance)
      the_future.should  be_within(2214.413, some_tolerance)
      the_relative_increase.should be_within(85.1, some_tolerance)
      the_absolute_increase.should be_within(1018.1, some_tolerance)
    end


      
    it "non_energetic_oil_in_use_of_final_demand_in_industry" do
      the_present.should be_within(536.76, some_tolerance)
      the_future.should  be_within(660.751, some_tolerance)
      the_relative_increase.should be_within(23.1, some_tolerance)
      the_absolute_increase.should be_within(124.0, some_tolerance)
    end


      
    it "non_energetic_other_in_use_of_final_demand_in_industry" do
      the_present.should be_within(173.76, some_tolerance)
      the_future.should  be_within(211.812, some_tolerance)
      the_relative_increase.should be_within(21.9, some_tolerance)
      the_absolute_increase.should be_within(38.1, some_tolerance)
    end


      
    it "non_energetic_use_in_use_of_final_demand_in_other_sector" do
      the_present.should be_within(3.38, some_tolerance)
      the_future.should  be_within(3.38, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "nuclear_in_source_of_electricity_production" do
      the_present.should be_within(14.4, some_tolerance)
      the_future.should  be_within(13.553, some_tolerance)
      the_relative_increase.should be_within(-5.9, some_tolerance)
      the_absolute_increase.should be_within(-0.8, some_tolerance)
    end


          it "nuclear_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(0.495, some_tolerance)
    end

          it "nuclear_plants_in_power_plant_properties" do
      the_value.should be_within(14.4, some_tolerance)
    end

          it "nuclear_plants_investm_in_power_plant_properties" do
      the_value.should be_within(2050.56, some_tolerance)
    end

          it "nuclear_plants_plants_in_power_plant_properties" do
      the_value.should be_within(0.3, some_tolerance)
    end

          it "nuclear_plants_prod_in_power_plant_properties" do
      the_value.should be_within(13.553, some_tolerance)
    end

      
    it "offshore_in_targeted_area_use_for_wind_turbines" do
      the_present.should be_within(0.302, some_tolerance)
      the_future.should  be_within(40.905, some_tolerance)
      the_relative_increase.should be_within(13453.2, some_tolerance)
      the_absolute_increase.should be_within(40.6, some_tolerance)
    end


          it "oil_agriculture_in_mekko_of_final_demand" do
      the_value.should be_within(9.293, some_tolerance)
    end

          it "oil_agriculture_in_mekko_of_primary_demand" do
      the_value.should be_within(9.293, some_tolerance)
    end

          it "oil_buildings_in_mekko_of_final_demand" do
      the_value.should be_within(14.666, some_tolerance)
    end

          it "oil_buildings_in_mekko_of_primary_demand" do
      the_value.should be_within(14.666, some_tolerance)
    end

          it "oil_households_in_mekko_of_final_demand" do
      the_value.should be_within(5.583, some_tolerance)
    end

          it "oil_households_in_mekko_of_primary_demand" do
      the_value.should be_within(5.583, some_tolerance)
    end

          it "oil_in_future_energy_imports" do
      the_value.should be_within(1311.423, some_tolerance)
    end

      
    it "oil_in_source_of_electricity_production" do
      the_present.should be_within(6.634, some_tolerance)
      the_future.should  be_within(6.792, some_tolerance)
      the_relative_increase.should be_within(2.4, some_tolerance)
      the_absolute_increase.should be_within(0.2, some_tolerance)
    end


          it "oil_industry_in_mekko_of_final_demand" do
      the_value.should be_within(819.171, some_tolerance)
    end

          it "oil_industry_in_mekko_of_primary_demand" do
      the_value.should be_within(844.327, some_tolerance)
    end

          it "oil_other_in_mekko_of_final_demand" do
      the_value.should be_within(9.228, some_tolerance)
    end

          it "oil_other_in_mekko_of_primary_demand" do
      the_value.should be_within(9.228, some_tolerance)
    end

          it "oil_power_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(0.347, some_tolerance)
    end

          it "oil_power_plants_in_power_plant_properties" do
      the_value.should be_within(6.634, some_tolerance)
    end

          it "oil_power_plants_investment_in_power_plant_properties" do
      the_value.should be_within(372.823, some_tolerance)
    end

          it "oil_power_plants_plants_in_power_plant_properties" do
      the_value.should be_within(13.63, some_tolerance)
    end

          it "oil_power_plants_prod_in_power_plant_properties" do
      the_value.should be_within(6.792, some_tolerance)
    end

          it "oil_transport_in_mekko_of_final_demand" do
      the_value.should be_within(438.808, some_tolerance)
    end

          it "oil_transport_in_mekko_of_primary_demand" do
      the_value.should be_within(472.83, some_tolerance)
    end

          it "oil_value_in_present_energy_imports" do
      the_value.should be_within(1225.658, some_tolerance)
    end

      
    it "old_residences_in_number_of_residences" do
      the_present.should be_within(6228292.0, some_tolerance)
      the_future.should  be_within(7224220.256, some_tolerance)
      the_relative_increase.should be_within(16.0, some_tolerance)
      the_absolute_increase.should be_within(995928.3, some_tolerance)
    end


      
    it "onshore_in_targeted_area_use_for_wind_turbines" do
      the_present.should be_within(0.737, some_tolerance)
      the_future.should  be_within(1.758, some_tolerance)
      the_relative_increase.should be_within(138.3, some_tolerance)
      the_absolute_increase.should be_within(1.0, some_tolerance)
    end


      
    it "operation_maintenance_cost_in_breakdown_converter_costs" do
      the_present.should be_within(0.068, some_tolerance)
      the_future.should  be_within(0.039, some_tolerance)
      the_relative_increase.should be_within(-43.4, some_tolerance)
      the_absolute_increase.should be_within(-0.0, some_tolerance)
    end


      
    it "operation_maintenance_cost_in_breakdown_electricity_costs" do
      the_present.should be_within(0.92, some_tolerance)
      the_future.should  be_within(0.497, some_tolerance)
      the_relative_increase.should be_within(-46.0, some_tolerance)
      the_absolute_increase.should be_within(-0.4, some_tolerance)
    end


      
    it "operation_maintenance_cost_in_breakdown_electricity_costs_corrected_for_electricity_imbalance" do
      the_present.should be_within(0.892, some_tolerance)
      the_future.should  be_within(0.492, some_tolerance)
      the_relative_increase.should be_within(-44.9, some_tolerance)
      the_absolute_increase.should be_within(-0.4, some_tolerance)
    end


      
    it "operation_maintenance_cost_in_breakdown_heating_costs" do
      the_present.should be_within(2.859, some_tolerance)
      the_future.should  be_within(2.69, some_tolerance)
      the_relative_increase.should be_within(-5.9, some_tolerance)
      the_absolute_increase.should be_within(-0.2, some_tolerance)
    end


          it "other_agriculture_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "other_agriculture_in_gas_versus_other_primary_energy" do
      the_value.should be_within(10.577, some_tolerance)
    end

          it "other_buildings_in_gas_use_for_electricity_production" do
      the_value.should be_within(1.275, some_tolerance)
    end

          it "other_buildings_in_gas_versus_other_primary_energy" do
      the_value.should be_within(131.712, some_tolerance)
    end

          it "other_energy_in_gas_use_for_electricity_production" do
      the_value.should be_within(342.787, some_tolerance)
    end

      
    it "other_heat_in_source_of_heat_and_electricity_in_agriculture" do
      the_present.should be_within(42.371, some_tolerance)
      the_future.should  be_within(44.721, some_tolerance)
      the_relative_increase.should be_within(5.5, some_tolerance)
      the_absolute_increase.should be_within(2.3, some_tolerance)
    end


      
    it "other_heat_in_source_of_heat_and_electricity_in_industry" do
      the_present.should be_within(373.717, some_tolerance)
      the_future.should  be_within(453.801, some_tolerance)
      the_relative_increase.should be_within(21.4, some_tolerance)
      the_absolute_increase.should be_within(80.1, some_tolerance)
    end


      
    it "other_heat_in_source_of_heat_and_electricity_in_other_sector" do
      the_present.should be_within(74.107, some_tolerance)
      the_future.should  be_within(74.042, some_tolerance)
      the_relative_increase.should be_within(-0.1, some_tolerance)
      the_absolute_increase.should be_within(-0.1, some_tolerance)
    end


          it "other_households_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "other_households_in_gas_versus_other_primary_energy" do
      the_value.should be_within(88.894, some_tolerance)
    end

      
    it "other_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(3.86, some_tolerance)
      the_future.should  be_within(3.86, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


          it "other_industry_in_gas_use_for_electricity_production" do
      the_value.should be_within(56.732, some_tolerance)
    end

          it "other_industry_in_gas_versus_other_primary_energy" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "other_other_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "other_other_in_gas_versus_other_primary_energy" do
      the_value.should be_within(22.557, some_tolerance)
    end

          it "other_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(1.862, some_tolerance)
    end

          it "other_plants_in_power_plant_properties" do
      the_value.should be_within(14.64, some_tolerance)
    end

          it "other_plants_investm_in_power_plant_properties" do
      the_value.should be_within(5400.037, some_tolerance)
    end

          it "other_plants_plants_in_power_plant_properties" do
      the_value.should be_within(1215.991, some_tolerance)
    end

          it "other_plants_prod_in_power_plant_properties" do
      the_value.should be_within(16.19, some_tolerance)
    end

          it "other_transport_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "other_transport_in_gas_versus_other_primary_energy" do
      the_value.should be_within(523.642, some_tolerance)
    end

      
    it "percentage_renewable_electricity_in_renewable_electricity_share" do
      the_present.should be_within(9.777, some_tolerance)
      the_future.should  be_within(29.537, some_tolerance)
      the_relative_increase.should be_within(202.1, some_tolerance)
      the_absolute_increase.should be_within(19.8, some_tolerance)
    end


      
    it "percentage_renewables_in_renewability" do
      the_present.should be_within(3.256, some_tolerance)
      the_future.should  be_within(11.578, some_tolerance)
      the_relative_increase.should be_within(255.6, some_tolerance)
      the_absolute_increase.should be_within(8.3, some_tolerance)
    end


          it "power_plants_plants_in_power_plant_properties" do
      the_value.should be_within(7130.635, some_tolerance)
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
      the_future.should  be_within(3513.887, some_tolerance)
      the_relative_increase.should be_within(1.5, some_tolerance)
      the_absolute_increase.should be_within(52.2, some_tolerance)
    end


      
    it "primary_energy_of_electricity_export_in_use_of_primary_energy" do
      the_present.should be_within(25.511, some_tolerance)
      the_future.should  be_within(23.315, some_tolerance)
      the_relative_increase.should be_within(-8.6, some_tolerance)
      the_absolute_increase.should be_within(-2.2, some_tolerance)
    end


      
    it "pv_in_targeted_area_use_for_solar_power" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.026, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "roof_use_in_targeted_area_use_for_solar_power" do
      the_present.should be_within(0.188, some_tolerance)
      the_future.should  be_within(66.676, some_tolerance)
      the_relative_increase.should be_within(35300.4, some_tolerance)
      the_absolute_increase.should be_within(66.5, some_tolerance)
    end


      
    it "share_of_households_in_final_demand" do
      the_present.should be_within(0.161, some_tolerance)
      the_future.should  be_within(0.129, some_tolerance)
      the_relative_increase.should be_within(-20.2, some_tolerance)
      the_absolute_increase.should be_within(-0.0, some_tolerance)
    end


      
    it "solar_in_source_of_electricity_production" do
      the_present.should be_within(0.24, some_tolerance)
      the_future.should  be_within(3.791, some_tolerance)
      the_relative_increase.should be_within(1478.7, some_tolerance)
      the_absolute_increase.should be_within(3.6, some_tolerance)
    end


      
    it "solar_panels_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(-0.24, some_tolerance)
      the_future.should  be_within(-3.665, some_tolerance)
      the_relative_increase.should be_within(1426.4, some_tolerance)
      the_absolute_increase.should be_within(-3.4, some_tolerance)
    end


      
    it "solar_panels_in_source_of_electricity_in_buildings" do
      the_present.should be_within(0.24, some_tolerance)
      the_future.should  be_within(1.275, some_tolerance)
      the_relative_increase.should be_within(430.9, some_tolerance)
      the_absolute_increase.should be_within(1.0, some_tolerance)
    end


      
    it "solar_panels_in_source_of_electricity_in_households" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(2.39, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(2.4, some_tolerance)
    end


          it "sts_coal_plants_in_expert_predictions" do
      the_value.should be_within(48.0, some_tolerance)
    end

          it "sts_gas_plants_in_expert_predictions" do
      the_value.should be_within(62.039, some_tolerance)
    end

          it "sustainable_electricity_agriculture_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "sustainable_electricity_buildings_in_mekko_of_primary_demand" do
      the_value.should be_within(25.704, some_tolerance)
    end

          it "sustainable_electricity_households_in_mekko_of_primary_demand" do
      the_value.should be_within(18.19, some_tolerance)
    end

          it "sustainable_electricity_industry_in_mekko_of_primary_demand" do
      the_value.should be_within(27.939, some_tolerance)
    end

          it "sustainable_electricity_other_in_mekko_of_primary_demand" do
      the_value.should be_within(0.197, some_tolerance)
    end

          it "sustainable_electricity_transport_in_mekko_of_primary_demand" do
      the_value.should be_within(2.502, some_tolerance)
    end

          it "target_in_co2_emissions_with_import_and_export" do
      the_value.should be_within(100.502, some_tolerance)
    end

      
    it "total_investment_costs_power_production" do
      the_present.should be_within(32009501591.642, some_tolerance)
      the_future.should  be_within(44112583551.516, some_tolerance)
      the_relative_increase.should be_within(37.8, some_tolerance)
      the_absolute_increase.should be_within(12103081959.9, some_tolerance)
    end


      
    it "total_investment_costs_power_production_corrected_for_imbalance" do
      the_present.should be_within(31060244968.063, some_tolerance)
      the_future.should  be_within(43660839477.727, some_tolerance)
      the_relative_increase.should be_within(40.6, some_tolerance)
      the_absolute_increase.should be_within(12600594509.7, some_tolerance)
    end


          it "total_plants_investm_in_power_plant_properties" do
      the_value.should be_within(44112.584, some_tolerance)
    end

          it "total_plants_prod_future_in_power_plant_properties" do
      the_value.should be_within(417.061, some_tolerance)
    end

          it "total_plants_prod_present_in_power_plant_properties" do
      the_value.should be_within(431.052, some_tolerance)
    end

      
    it "trains_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(6.2, some_tolerance)
      the_future.should  be_within(6.646, some_tolerance)
      the_relative_increase.should be_within(7.2, some_tolerance)
      the_absolute_increase.should be_within(0.4, some_tolerance)
    end


          it "uranium_agriculture_in_mekko_of_primary_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "uranium_buildings_in_mekko_of_primary_demand" do
      the_value.should be_within(12.421, some_tolerance)
    end

          it "uranium_conversion_in_fuel_chain_emissions" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "uranium_extraction_in_fuel_chain_emissions" do
      the_value.should be_within(0.005, some_tolerance)
    end

          it "uranium_households_in_mekko_of_primary_demand" do
      the_value.should be_within(8.033, some_tolerance)
    end

          it "uranium_in_future_energy_imports" do
      the_value.should be_within(37.647, some_tolerance)
    end

          it "uranium_industry_in_mekko_of_primary_demand" do
      the_value.should be_within(14.205, some_tolerance)
    end

          it "uranium_other_in_mekko_of_primary_demand" do
      the_value.should be_within(0.1, some_tolerance)
    end

          it "uranium_transport_in_mekko_of_primary_demand" do
      the_value.should be_within(1.272, some_tolerance)
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
      the_value.should be_within(15.85, some_tolerance)
    end

          it "waste_households_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "waste_households_in_mekko_of_primary_demand" do
      the_value.should be_within(10.251, some_tolerance)
    end

      
    it "waste_in_source_of_electricity_production" do
      the_present.should be_within(14.04, some_tolerance)
      the_future.should  be_within(12.01, some_tolerance)
      the_relative_increase.should be_within(-14.5, some_tolerance)
      the_absolute_increase.should be_within(-2.0, some_tolerance)
    end


          it "waste_industry_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "waste_industry_in_mekko_of_primary_demand" do
      the_value.should be_within(18.127, some_tolerance)
    end

          it "waste_other_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "waste_other_in_mekko_of_primary_demand" do
      the_value.should be_within(0.128, some_tolerance)
    end

          it "waste_transport_in_mekko_of_final_demand" do
      the_value.should be_within(0.0, some_tolerance)
    end

          it "waste_transport_in_mekko_of_primary_demand" do
      the_value.should be_within(1.623, some_tolerance)
    end

          it "wind_farms_capacity_in_power_plant_properties" do
      the_value.should be_within(7.8, some_tolerance)
    end

          it "wind_farms_in_power_plant_properties" do
      the_value.should be_within(14.328, some_tolerance)
    end

          it "wind_farms_investm_in_power_plant_properties" do
      the_value.should be_within(16315.986, some_tolerance)
    end

          it "wind_farms_plants_in_power_plant_properties" do
      the_value.should be_within(2600.0, some_tolerance)
    end

          it "wind_farms_prod_in_power_plant_properties" do
      the_value.should be_within(73.532, some_tolerance)
    end

      
    it "wind_in_source_of_electricity_production" do
      the_present.should be_within(14.328, some_tolerance)
      the_future.should  be_within(73.532, some_tolerance)
      the_relative_increase.should be_within(413.2, some_tolerance)
      the_absolute_increase.should be_within(59.2, some_tolerance)
    end


          it "with_im_export_1990_in_co2_emissions_table" do
      the_value.should be_within(151.2, some_tolerance)
    end

          it "with_im_export_2010_in_co2_emissions_table" do
      the_value.should be_within(163.966, some_tolerance)
    end

          it "with_im_export_20xx_in_co2_emissions_table" do
      the_value.should be_within(143.017, some_tolerance)
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