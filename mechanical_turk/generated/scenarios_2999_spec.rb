require 'spec_helper'

describe "untitled" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2050, use_fce: false) do
      move_slider 198, -90.0       # policy_sustainability_co2_emissions
      move_slider 234, 100.0       # policy_sustainability_renewable_percentage
      move_slider 206, 66.7       # policy_dependence_max_dependence
      move_slider 212, 66.7       # policy_dependence_max_electricity_dependence
      move_slider 208, 500.0       # policy_cost_total_energy_cost
      move_slider 207, 500.0       # policy_cost_electricity_cost
      move_slider 178, 6600.0       # policy_area_onshore_land
      move_slider 179, 303.0       # policy_area_onshore_coast
      move_slider 233, 1144.0       # policy_area_offshore
      move_slider 193, 240.0       # policy_area_roofs_for_solar_panels
      move_slider 194, 1110.0       # policy_area_land_for_solar_panels
      move_slider 195, 1110.0       # policy_area_land_for_csp
      move_slider 335, 0.1       # households_number_of_inhabitants
      move_slider 203, 1.4000000000000001       # households_electricity_demand_per_person
      move_slider 372, 0.5       # households_heat_demand_per_person
      move_slider 204, 2.0       # households_cooling_demand_per_person
      move_slider 373, 1.0       # households_hot_water_demand_per_person
      move_slider 1, 0.30000000000000004       # households_replacement_of_existing_houses
      move_slider 336, 3.0       # households_insulation_level_old_houses
      move_slider 337, 5.0       # households_insulation_level_new_houses
      move_slider 333, 0.0       # households_heating_gas_combi_heater_share
      move_slider 48, 5.0       # households_heating_solar_thermal_panels_share
      move_slider 338, 10.0       # households_heating_heat_pump_ground_share
      move_slider 344, 100.0       # households_heating_geothermal_share
      move_slider 51, 0.0       # households_heating_micro_chp_share
      move_slider 339, 40.00000000000001       # households_heating_heat_pump_add_on_share
      move_slider 375, 10.0       # households_heating_heat_pump_with_ts_share
      move_slider 317, 0.0       # households_heating_gas_fired_heat_pump_share
      move_slider 341, 0.0       # households_heating_heat_network_share
      move_slider 343, 0.0       # households_heating_biomass_chp_share
      move_slider 340, 0.0       # households_heating_pellet_stove_share
      move_slider 242, 0.0       # households_heating_small_gas_chp_share
      move_slider 52, 15.0       # households_heating_electric_heater_share
      move_slider 441, 0.0       # households_heating_gas_fired_heater_share
      move_slider 248, 0.0       # households_heating_oil_fired_heater_share
      move_slider 411, 0.0       # households_heating_coal_fired_heater_share
      move_slider 446, 0.0       # households_hot_water_gas_fired_heater_share
      move_slider 420, 20.000000000000004       # households_hot_water_heat_pump_ground_share
      move_slider 444, 0.0       # households_hot_water_biomass_heater_share
      move_slider 445, 0.0       # households_hot_water_micro_chp_share
      move_slider 421, 0.0       # households_hot_water_heat_network_share
      move_slider 439, 0.0       # households_hot_water_fuel_cell_share
      move_slider 347, 80.0       # households_hot_water_electric_boiler_share
      move_slider 346, 0.0       # households_hot_water_gas_water_heater_share
      move_slider 348, 50.0       # households_hot_water_solar_water_heater_share
      move_slider 435, 0.0       # households_hot_water_oil_fired_heater_share
      move_slider 443, 0.0       # households_hot_water_coal_fired_heater_hotwater_share
      move_slider 351, 15.0       # households_cooling_heat_pump_ground_share
      move_slider 374, 15.0       # households_cooling_heat_pump_with_ts_share
      move_slider 352, 0.0       # households_cooling_gas_fired_heat_pump_share
      move_slider 353, 70.0       # households_cooling_airconditioning_share
      move_slider 354, 0.0       # households_cooking_gas_share
      move_slider 355, 65.0       # households_cooking_electric_share
      move_slider 356, 10.0       # households_cooking_halogen_share
      move_slider 357, 25.000000000000004       # households_cooking_induction_share
      move_slider 436, 0.0       # households_cooking_biomass_share
      move_slider 359, 59.900000000000006       # households_efficiency_dish_washer
      move_slider 6, 75.0       # households_efficiency_fridge_freezer
      move_slider 361, 50.00000000000001       # households_efficiency_washing_machine
      move_slider 362, 50.00000000000001       # households_efficiency_dryer
      move_slider 363, 25.000000000000004       # households_efficiency_television
      move_slider 364, 50.00000000000001       # households_efficiency_computer_media
      move_slider 360, 25.0       # households_efficiency_vacuum_cleaner
      move_slider 412, 25.000000000000004       # households_efficiency_other
      move_slider 245, 0.0       # households_lighting_incandescent_share
      move_slider 43, 0.0       # households_lighting_low_energy_light_bulb_share
      move_slider 44, 100.0       # households_lighting_light_emitting_diode_share
      move_slider 366, 0.0       # households_behavior_standby_killer_turn_off_appliances
      move_slider 368, 0.0       # households_behavior_turn_off_the_light
      move_slider 370, 0.0       # households_behavior_close_windows_turn_off_heating
      move_slider 371, 0.0       # households_efficiency_low_temperature_washing
      move_slider 47, 89.0       # households_market_penetration_solar_panels
      move_slider 250, 0.0       # number_of_pulverized_coal
      move_slider 251, 0.0       # number_of_pulverized_coal_ccs
      move_slider 253, 0.0       # number_of_coal_iggc
      move_slider 254, 0.0       # number_of_coal_igcc_ccs
      move_slider 255, 0.0       # number_of_coal_oxyfuel_ccs
      move_slider 315, 0.0       # number_of_coal_conventional
      move_slider 314, 1.2       # not found
      move_slider 256, 0.0       # number_of_gas_conventional
      move_slider 257, 0.0       # number_of_gas_ccgt
      move_slider 416, 0.0       # number_of_gas_ccgt_ccs
      move_slider 276, 0.0       # number_of_large_gas_chp
      move_slider 275, 0.0       # number_of_small_chp_fixed
      move_slider 274, 0.0       # number_of_micro_chp_fixed
      move_slider 258, 0.0       # number_of_oil_fired_plant
      move_slider 259, 0.1       # number_of_nuclear_3rd_gen
      move_slider 413, 0.0       # number_of_nuclear_conventional
      move_slider 260, 100.0       # electricity_bio_oil_share_in_gas_production
      move_slider 261, 0.0       # number_of_co_firing_coal
      move_slider 262, 0.0       # not found
      move_slider 272, 0.0       # number_of_biomass_chp_fixed
      move_slider 263, 16441.600000000002       # number_of_wind_onshore_land
      move_slider 264, 1469.5       # number_of_wind_onshore_coast
      move_slider 265, 5246.400000000001       # number_of_wind_offshore
      move_slider 266, 0.0       # number_of_hydro_river
      move_slider 268, 1.5000000000000002       # not found
      move_slider 270, 1000.0000000000001       # number_of_geothermal_electric
      move_slider 298, 0.0       # number_of_solar_pv_plants
      move_slider 299, 0.0       # number_of_concentrated_solar_power
      move_slider 313, 19778.0       # number_of_solar_pv_roofs_fixed
      move_slider 271, 0.0       # number_of_waste_incinerator
      move_slider 277, 0.0       # number_of_decentral_coal_chp_fixed
      move_slider 278, 0.0       # not found
      move_slider 279, 0.0       # number_of_small_gas_chp_fixed
      move_slider 280, 0.0       # not found
      move_slider 437, 0.0       # number_of_lignite_chp_fixed
      move_slider 281, 190.0       # number_of_gas_fired_heater_fixed
      move_slider 430, 0.0       # number_of_coal_fired_heater_district
      move_slider 432, 0.0       # number_of_gas_fired_heater_district
      move_slider 433, 0.0       # number_of_waste_fired_heater_district
      move_slider 282, 25.0       # number_of_oil_fired_heater_fixed
      move_slider 283, 0.0       # number_of_coal_fired_heaterv
      move_slider 415, 0.0       # number_of_gas_fired_heat_pump_fixed
      move_slider 431, 0.0       # number_of_biomass_fired_heater_district
      move_slider 285, 6.0       # not found
      move_slider 414, 22960.0       # number_of_biomass_fired_heater_fixed
      move_slider 286, 0.0       # not found
      move_slider 289, 1694978.0       # number_of_electric_heat_pump_fixed
      move_slider 291, 673.0       # number_of_geothermal_fixed
      move_slider 290, 523178.0       # number_of_solar_water_heater_fixed
      move_slider 292, 0.0       # transport_diesel_share
      move_slider 293, 100.0       # transport_biodiesel_share
      move_slider 294, 0.0       # transport_gasoline_share
      move_slider 295, 100.0       # transport_bio_ethanol_share
      move_slider 296, 0.0       # not found
      move_slider 297, 100.0       # not found
      move_slider 423, 0.0       # transport_planes_fossil_fuel_share
      move_slider 424, 100.0       # transport_planes_bio_ethanol_share
      move_slider 425, 0.0       # transport_ships_diesel_share
      move_slider 426, 100.0       # transport_ships_bio_diesel_share
      move_slider 141, 0.0       # transport_cars
      move_slider 142, 0.5       # transport_trucks
      move_slider 143, 2.0       # transport_trains
      move_slider 145, 0.5       # transport_inland_navigation
      move_slider 144, -4.997842327240885       # transport_domestic_flights
      move_slider 146, 100.0       # transport_cars_electric_share
      move_slider 147, 0.0       # transport_cars_diesel_share
      move_slider 148, 0.0       # transport_cars_gasoline_share
      move_slider 238, 0.0       # transport_cars_lpg_share
      move_slider 239, 0.0       # transport_cars_compressed_gas_share
      move_slider 159, 100.0       # transport_trucks_electric_share
      move_slider 158, 0.0       # transport_trucks_diesel_share
      move_slider 157, 0.0       # transport_trucks_gasoline_share
      move_slider 240, 0.0       # transport_trucks_compressed_gas_share
      move_slider 428, 0.0       # transport_trains_diesel_share
      move_slider 429, 100.0       # transport_trains_electric_share
      move_slider 427, 0.0       # transport_trains_coal_share
      move_slider 171, 1.4000000000000001       # transport_efficiency_electric_vehicles
      move_slider 328, 0.5       # transport_efficiency_combustion_engine_trucks
      move_slider 186, 0.0       # transport_efficiency_combustion_engine_cars
      move_slider 241, 1.4000000000000001       # transport_efficiency_trains
      move_slider 187, 1.4000000000000001       # transport_efficiency_ships
      move_slider 188, 0.5       # transport_efficiency_airplanes
      move_slider 213, 5.0       # industry_electricity_demand
      move_slider 214, -0.9999999999999999       # industry_heat_demand
      move_slider 205, -0.5       # industry_non_energetic_oil_demand
      move_slider 202, -0.5       # industry_non_energetic_other_demand
      move_slider 169, 2.0       # industry_efficiency_electricity
      move_slider 170, 2.0       # industry_heat_from_fuels
      move_slider 216, 0.0       # industry_heating_gas_fired_heater_share
      move_slider 217, 0.0       # industry_heating_oil_fired_heater_share
      move_slider 218, 0.0       # industry_heating_coal_fired_heater_share
      move_slider 219, 100.0       # industry_heating_biomass_fired_heater_share
      move_slider 326, 0.0       # industry_heating_combined_heat_power_share
      move_slider 322, 0.0       # industry_number_of_gas_chp
      move_slider 324, 0.0       # industry_number_of_biomass_chp
      move_slider 220, 2.0       # agriculture_electricity_demand
      move_slider 221, 2.0       # agriculture_heat_demand
      move_slider 246, 0.0       # agriculture_heating_gas_fired_heater_share
      move_slider 223, 0.0       # agriculture_heating_oil_fired_heater_share
      move_slider 225, 0.0       # agriculture_heating_biomass_fired_heater_share
      move_slider 227, 50.0       # agriculture_heating_heat_pump_with_ts_share
      move_slider 228, 50.00000000000001       # agriculture_heating_geothermal_share
      move_slider 327, 0.0       # agriculture_heating_combined_heat_power_share
      move_slider 325, 0.0       # agriculture_number_of_small_gas_chp
      move_slider 229, 3.0000000000000004       # other_electricity_demand
      move_slider 230, -0.9999999999999999       # other_heat_demand
      move_slider 321, 0.0       # other_number_of_small_gas_chp
      move_slider 58, 195.0       # costs_gas
      move_slider 11, 125.0       # costs_oil
      move_slider 57, 100.0       # costs_coal
      move_slider 59, 225.0       # costs_biomass
      move_slider 16, -5.5       # investment_costs_combustion_gas_plant
      move_slider 17, 0.0       # investment_costs_combustion_oil_plant
      move_slider 18, -18.03       # investment_costs_combustion_coal_plant
      move_slider 19, 0.0       # investment_costs_combustion_biomass_plant
      move_slider 231, 0.0       # investment_costs_combustion_waste_incinerator
      move_slider 180, -5.5       # om_costs_combustion_gas_plant
      move_slider 181, 0.0       # om_costs_combustion_oil_plant
      move_slider 182, 0.0       # om_costs_combustion_coal_plant
      move_slider 183, 0.0       # om_costs_combustion_biomass_plant
      move_slider 232, 0.0       # om_costs_combustion_waste_incinerator
      move_slider 12, -36.59       # investment_costs_wind_onshore
      move_slider 14, -63.81       # investment_costs_wind_offshore
      move_slider 126, -36.59       # om_costs_wind_onshore
      move_slider 127, -63.81       # om_costs_wind_offshore
      move_slider 114, 0.0       # investment_costs_water_river
      move_slider 116, 0.0       # not found
      move_slider 129, 0.0       # om_costs_water_river
      move_slider 130, 0.0       # not found
      move_slider 133, -78.0       # investment_costs_solar_solar_panels
      move_slider 134, 0.0       # investment_costs_solar_concentrated_solar_power
      move_slider 247, -25.0       # investment_costs_earth_geothermal_electricity
      move_slider 132, 0.0       # om_costs_earth_geothermal_electricity
      move_slider 137, 340.0       # costs_co2
      move_slider 138, 0.0       # costs_co2_free_allocation
      move_slider 140, -50.0       # investment_costs_co2_ccs
      move_slider 139, 0.0       # om_costs_co2_ccs
      move_slider 376, -0.2       # buildings_number_of_buildings
      move_slider 377, 1.0       # buildings_electricity_per_student_employee
      move_slider 378, 0.5       # buildings_heat_per_employee_student
      move_slider 408, 1.0       # buildings_cooling_per_student_employee
      move_slider 381, 3.0       # buildings_insulation_level
      move_slider 382, 4.0       # not found
      move_slider 383, 0.0       # buildings_heating_gas_fired_heater_share
      move_slider 394, 65.0       # buildings_heating_heat_pump_with_ts_share
      move_slider 390, 0.0       # buildings_heating_gas_fired_heat_pump_share
      move_slider 387, 25.000000000000004       # buildings_heating_electric_heater_share
      move_slider 389, 10.0       # buildings_heating_solar_thermal_panels_share
      move_slider 409, 0.0       # buildings_heating_oil_fired_heater_share
      move_slider 406, 0.0       # buildings_heating_biomass_fired_heater_share
      move_slider 386, 0.0       # buildings_heating_small_gas_chp_share
      move_slider 385, 0.0       # buildings_heating_biomass_chp_share
      move_slider 388, 0.0       # buildings_heating_heat_network_share
      move_slider 392, 65.0       # buildings_cooling_heat_pump_with_ts_share
      move_slider 391, 0.0       # buildings_cooling_gas_fired_heat_pump_share
      move_slider 393, 35.0       # buildings_cooling_airconditioning_share
      move_slider 395, 2.0       # buildings_ventilation_rate
      move_slider 396, 30.000000000000004       # buildings_recirculation
      move_slider 397, 50.0       # buildings_waste_heat_recovery
      move_slider 398, 1.5000000000000002       # buildings_appliances_efficiency
      move_slider 400, 0.0       # buildings_lighting_fluorescent_tube_conventional_share
      move_slider 401, 20.0       # buildings_lighting_fluorescent_tube_high_performance_share
      move_slider 402, 80.0       # buildings_lighting_led_tube_share
      move_slider 403, 75.0       # buildings_lighting_motion_detection
      move_slider 404, 25.000000000000004       # buildings_lighting_daylight_dependent_control
      move_slider 405, 33.2       # buildings_market_penetration_solar_panels
      move_slider 185, 300.0       # costs_uranium
      move_slider 136, -30.0       # investment_costs_nuclear_nuclear_plant
      move_slider 121, 0.0       # om_costs_nuclear_nuclear_plant
      move_slider 489, 69.3       # natural_gas_total_share
      move_slider 488, 30.700000000000003       # green_gas_total_share
      move_slider 551, 0.2       # number_of_central_coal_chp
      move_slider 550, 0.2       # not found
      move_slider 548, 5.3       # number_of_backup_burner_fixed
      move_slider 582, 20.000000000000004       # households_heating_district_heating_network_share
    end
  end

  after :all do
    print_comparison('localhost') if ENV["LOCALHOST"]
    print_comparison('beta') if ENV["BETA"]
  end

  describe "gqueries" do
      
    it "dashboard_bio_footprint" do
      the_present.should be_within(0.224, some_tolerance)
      the_future.should  be_within(0.826, some_tolerance)
      the_relative_increase.should be_within(267.9, some_tolerance)
      the_absolute_increase.should be_within(0.6, some_tolerance)
    end


      
    it "dashboard_employment" do
      the_present.should be_within(29409.913, some_tolerance)
      the_future.should  be_within(85151.798, some_tolerance)
      the_relative_increase.should be_within(189.5, some_tolerance)
      the_absolute_increase.should be_within(55741.9, some_tolerance)
    end


      
    it "dashboard_energy_demand_primary_of_final" do
      the_present.should be_within(3461730879704.038, some_tolerance)
      the_future.should  be_within(1954700017284.744, some_tolerance)
      the_relative_increase.should be_within(-43.5, some_tolerance)
      the_absolute_increase.should be_within(-1507030862419.3, some_tolerance)
    end


      
    it "dashboard_energy_import_netto" do
      the_present.should be_within(0.294, some_tolerance)
      the_future.should  be_within(0.498, some_tolerance)
      the_relative_increase.should be_within(69.4, some_tolerance)
      the_absolute_increase.should be_within(0.2, some_tolerance)
    end


      
    it "dashboard_reduction_of_co2_emissions_versus_1990" do
      the_present.should be_within(0.084, some_tolerance)
      the_future.should  be_within(-0.95, some_tolerance)
      the_relative_increase.should be_within(-1225.2, some_tolerance)
      the_absolute_increase.should be_within(-1.0, some_tolerance)
    end


      
    it "dashboard_renewability" do
      the_present.should be_within(0.033, some_tolerance)
      the_future.should  be_within(0.912, some_tolerance)
      the_relative_increase.should be_within(2701.4, some_tolerance)
      the_absolute_increase.should be_within(0.9, some_tolerance)
    end


      
    it "dashboard_security_of_supply" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(1.0, some_tolerance)
      the_relative_increase.should be_within(234448367.1, some_tolerance)
      the_absolute_increase.should be_within(1.0, some_tolerance)
    end


      
    it "dashboard_share_of_renewable_electricity" do
      the_present.should be_within(0.098, some_tolerance)
      the_future.should  be_within(1.016, some_tolerance)
      the_relative_increase.should be_within(939.6, some_tolerance)
      the_absolute_increase.should be_within(0.9, some_tolerance)
    end


      
    it "dashboard_total_costs" do
      the_present.should be_within(48.437, some_tolerance)
      the_future.should  be_within(46.801, some_tolerance)
      the_relative_increase.should be_within(-3.4, some_tolerance)
      the_absolute_increase.should be_within(-1.6, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_agriculture" do
      the_present.should be_within(2109325263.244, some_tolerance)
      the_future.should  be_within(1678124304.412, some_tolerance)
      the_relative_increase.should be_within(-20.4, some_tolerance)
      the_absolute_increase.should be_within(-431200958.8, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_buildings" do
      the_present.should be_within(5346359830.651, some_tolerance)
      the_future.should  be_within(3417221330.671, some_tolerance)
      the_relative_increase.should be_within(-36.1, some_tolerance)
      the_absolute_increase.should be_within(-1929138500.0, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_households" do
      the_present.should be_within(7813038899.502, some_tolerance)
      the_future.should  be_within(6783493173.71, some_tolerance)
      the_relative_increase.should be_within(-13.2, some_tolerance)
      the_absolute_increase.should be_within(-1029545725.8, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_industry_and_energy" do
      the_present.should be_within(23647581507.799, some_tolerance)
      the_future.should  be_within(30005592909.933, some_tolerance)
      the_relative_increase.should be_within(26.9, some_tolerance)
      the_absolute_increase.should be_within(6358011402.1, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_other" do
      the_present.should be_within(1444370733.371, some_tolerance)
      the_future.should  be_within(1579536267.865, some_tolerance)
      the_relative_increase.should be_within(9.4, some_tolerance)
      the_absolute_increase.should be_within(135165534.5, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_transport" do
      the_present.should be_within(8076663885.401, some_tolerance)
      the_future.should  be_within(3336575215.832, some_tolerance)
      the_relative_increase.should be_within(-58.7, some_tolerance)
      the_absolute_increase.should be_within(-4740088669.6, some_tolerance)
    end


      
    it "dashboard_total_costs_per_household" do
      the_present.should be_within(6590.563, some_tolerance)
      the_future.should  be_within(6367.854, some_tolerance)
      the_relative_increase.should be_within(-3.4, some_tolerance)
      the_absolute_increase.should be_within(-222.7, some_tolerance)
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
      the_future.should  be_within(2364.704, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(2364.7, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_combined_network_gas" do
      the_present.should be_within(6036264.993, some_tolerance)
      the_future.should  be_within(3307275.0, some_tolerance)
      the_relative_increase.should be_within(-45.2, some_tolerance)
      the_absolute_increase.should be_within(-2728990.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_crude_oil" do
      the_present.should be_within(91365.959, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-91366.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_district_heating_steam_hot_water" do
      the_present.should be_within(100978.019, some_tolerance)
      the_future.should  be_within(269968.199, some_tolerance)
      the_relative_increase.should be_within(167.4, some_tolerance)
      the_absolute_increase.should be_within(168990.2, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_electricity" do
      the_present.should be_within(129397.747, some_tolerance)
      the_future.should  be_within(1102425.0, some_tolerance)
      the_relative_increase.should be_within(752.0, some_tolerance)
      the_absolute_increase.should be_within(973027.3, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_heatpump_air_water_network_gas" do
      the_present.should be_within(0.712, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-0.7, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_heatpump_ground_water_electricity" do
      the_present.should be_within(5506.287, some_tolerance)
      the_future.should  be_within(734950.0, some_tolerance)
      the_relative_increase.should be_within(13247.5, some_tolerance)
      the_absolute_increase.should be_within(729443.7, some_tolerance)
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
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-187980.9, some_tolerance)
    end


  end
end