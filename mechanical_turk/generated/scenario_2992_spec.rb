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
      
    it "dashboard_bio_footprint" do
      the_present.should be_within(0.281, some_tolerance)
      the_future.should  be_within(0.863, some_tolerance)
      the_relative_increase.should be_within(207.3, some_tolerance)
      the_absolute_increase.should be_within(0.6, some_tolerance)
    end
      
    it "dashboard_employment" do
      the_present.should be_within(28439.961, some_tolerance)
      the_future.should  be_within(31416.854, some_tolerance)
      the_relative_increase.should be_within(10.5, some_tolerance)
      the_absolute_increase.should be_within(2976.9, some_tolerance)
    end
      
    it "dashboard_energy_demand_primary_of_final" do
      the_present.should be_within(3459160381069.281, some_tolerance)
      the_future.should  be_within(3511942056820.115, some_tolerance)
      the_relative_increase.should be_within(1.5, some_tolerance)
      the_absolute_increase.should be_within(52781675750.8, some_tolerance)
    end
      
    it "dashboard_energy_import_netto" do
      the_present.should be_within(0.293, some_tolerance)
      the_future.should  be_within(0.536, some_tolerance)
      the_relative_increase.should be_within(82.8, some_tolerance)
      the_absolute_increase.should be_within(0.2, some_tolerance)
    end
      
    it "dashboard_reduction_of_co2_emissions_versus_1990" do
      the_present.should be_within(0.089, some_tolerance)
      the_future.should  be_within(-0.049, some_tolerance)
      the_relative_increase.should be_within(-155.4, some_tolerance)
      the_absolute_increase.should be_within(-0.1, some_tolerance)
    end
      
    it "dashboard_renewability" do
      the_present.should be_within(0.031, some_tolerance)
      the_future.should  be_within(0.114, some_tolerance)
      the_relative_increase.should be_within(271.6, some_tolerance)
      the_absolute_increase.should be_within(0.1, some_tolerance)
    end
      
    it "dashboard_security_of_supply" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.039, some_tolerance)
      the_relative_increase.should be_within(12896448.9, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "dashboard_share_of_renewable_electricity" do
      the_present.should be_within(0.093, some_tolerance)
      the_future.should  be_within(0.291, some_tolerance)
      the_relative_increase.should be_within(211.7, some_tolerance)
      the_absolute_increase.should be_within(0.2, some_tolerance)
    end
      
    it "dashboard_total_costs" do
      the_present.should be_within(42.855, some_tolerance)
      the_future.should  be_within(58.975, some_tolerance)
      the_relative_increase.should be_within(37.6, some_tolerance)
      the_absolute_increase.should be_within(16.1, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_agriculture" do
      the_present.should be_within(1867394895.285, some_tolerance)
      the_future.should  be_within(2524595393.854, some_tolerance)
      the_relative_increase.should be_within(35.2, some_tolerance)
      the_absolute_increase.should be_within(657200498.6, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_buildings" do
      the_present.should be_within(4733155777.388, some_tolerance)
      the_future.should  be_within(4790583602.377, some_tolerance)
      the_relative_increase.should be_within(1.2, some_tolerance)
      the_absolute_increase.should be_within(57427825.0, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_households" do
      the_present.should be_within(6890174832.378, some_tolerance)
      the_future.should  be_within(7597040667.419, some_tolerance)
      the_relative_increase.should be_within(10.3, some_tolerance)
      the_absolute_increase.should be_within(706865835.0, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_industry_and_energy" do
      the_present.should be_within(20935307495.242, some_tolerance)
      the_future.should  be_within(32531545336.657, some_tolerance)
      the_relative_increase.should be_within(55.4, some_tolerance)
      the_absolute_increase.should be_within(11596237841.4, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_other" do
      the_present.should be_within(1278707737.206, some_tolerance)
      the_future.should  be_within(1717607395.96, some_tolerance)
      the_relative_increase.should be_within(34.3, some_tolerance)
      the_absolute_increase.should be_within(438899658.8, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_transport" do
      the_present.should be_within(7150305916.942, some_tolerance)
      the_future.should  be_within(9814119501.433, some_tolerance)
      the_relative_increase.should be_within(37.3, some_tolerance)
      the_absolute_increase.should be_within(2663813584.5, some_tolerance)
    end
      
    it "dashboard_total_costs_per_household" do
      the_present.should be_within(5831.015, some_tolerance)
      the_future.should  be_within(8024.422, some_tolerance)
      the_relative_increase.should be_within(37.6, some_tolerance)
      the_absolute_increase.should be_within(2193.4, some_tolerance)
    end
      
<<<<<<< HEAD
    it "turk_number_of_households" do
      the_present.should be_within(7349500.0, some_tolerance)
      the_future.should  be_within(7349500.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "turk_number_of_households_space_heater_coal" do
=======
    it "number_of_households" do
      the_present.should be_within(, some_tolerance)
      the_future.should  be_within(, some_tolerance)
      the_relative_increase.should be_within(, some_tolerance)
      the_absolute_increase.should be_within(, some_tolerance)
    end
      
    it "number_of_households_space_heater_coal" do
>>>>>>> f42eeedeeae5af352d834bbde15cbf5e49c63618
      the_present.should be_within(4524.173, some_tolerance)
      the_future.should  be_within(7349.5, some_tolerance)
      the_relative_increase.should be_within(62.4, some_tolerance)
      the_absolute_increase.should be_within(2825.3, some_tolerance)
    end
      
<<<<<<< HEAD
    it "turk_number_of_households_space_heater_collective_heatpump_water_water_ts_electricity" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(489.967, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(490.0, some_tolerance)
    end
      
    it "turk_number_of_households_space_heater_combined_network_gas" do
=======
    it "number_of_households_space_heater_collective_heatpump_water_water_ts_electricity" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(489.967, some_tolerance)
      the_relative_increase.should be_within(Infinity, some_tolerance)
      the_absolute_increase.should be_within(490.0, some_tolerance)
    end
      
    it "number_of_households_space_heater_combined_network_gas" do
>>>>>>> f42eeedeeae5af352d834bbde15cbf5e49c63618
      the_present.should be_within(6036756.75, some_tolerance)
      the_future.should  be_within(5291640.0, some_tolerance)
      the_relative_increase.should be_within(-12.3, some_tolerance)
      the_absolute_increase.should be_within(-745116.7, some_tolerance)
    end
      
<<<<<<< HEAD
    it "turk_number_of_households_space_heater_crude_oil" do
=======
    it "number_of_households_space_heater_crude_oil" do
>>>>>>> f42eeedeeae5af352d834bbde15cbf5e49c63618
      the_present.should be_within(91331.746, some_tolerance)
      the_future.should  be_within(95543.5, some_tolerance)
      the_relative_increase.should be_within(4.6, some_tolerance)
      the_absolute_increase.should be_within(4211.8, some_tolerance)
    end
      
<<<<<<< HEAD
    it "turk_number_of_households_space_heater_district_heating_steam_hot_water" do
=======
    it "number_of_households_space_heater_district_heating_steam_hot_water" do
>>>>>>> f42eeedeeae5af352d834bbde15cbf5e49c63618
      the_present.should be_within(100503.531, some_tolerance)
      the_future.should  be_within(75917.624, some_tolerance)
      the_relative_increase.should be_within(-24.5, some_tolerance)
      the_absolute_increase.should be_within(-24585.9, some_tolerance)
    end
      
<<<<<<< HEAD
    it "turk_number_of_households_space_heater_electricity" do
=======
    it "number_of_households_space_heater_electricity" do
>>>>>>> f42eeedeeae5af352d834bbde15cbf5e49c63618
      the_present.should be_within(129349.292, some_tolerance)
      the_future.should  be_within(73495.0, some_tolerance)
      the_relative_increase.should be_within(-43.2, some_tolerance)
      the_absolute_increase.should be_within(-55854.3, some_tolerance)
    end
      
<<<<<<< HEAD
    it "turk_number_of_households_space_heater_heatpump_air_water_network_gas" do
=======
    it "number_of_households_space_heater_heatpump_air_water_network_gas" do
>>>>>>> f42eeedeeae5af352d834bbde15cbf5e49c63618
      the_present.should be_within(1.475, some_tolerance)
      the_future.should  be_within(244.983, some_tolerance)
      the_relative_increase.should be_within(16508.7, some_tolerance)
      the_absolute_increase.should be_within(243.5, some_tolerance)
    end
      
<<<<<<< HEAD
    it "turk_number_of_households_space_heater_heatpump_ground_water_electricity" do
=======
    it "number_of_households_space_heater_heatpump_ground_water_electricity" do
>>>>>>> f42eeedeeae5af352d834bbde15cbf5e49c63618
      the_present.should be_within(5504.225, some_tolerance)
      the_future.should  be_within(73495.0, some_tolerance)
      the_relative_increase.should be_within(1235.2, some_tolerance)
      the_absolute_increase.should be_within(67990.8, some_tolerance)
    end
      
<<<<<<< HEAD
    it "turk_number_of_households_space_heater_micro_chp_network_gas" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "turk_number_of_households_space_heater_network_gas" do
=======
    it "number_of_households_space_heater_micro_chp_network_gas" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(NaN, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "number_of_households_space_heater_network_gas" do
>>>>>>> f42eeedeeae5af352d834bbde15cbf5e49c63618
      the_present.should be_within(670447.195, some_tolerance)
      the_future.should  be_within(551212.5, some_tolerance)
      the_relative_increase.should be_within(-17.8, some_tolerance)
      the_absolute_increase.should be_within(-119234.7, some_tolerance)
    end
      
<<<<<<< HEAD
    it "turk_number_of_households_space_heater_wood_pellets" do
=======
    it "number_of_households_space_heater_wood_pellets" do
>>>>>>> f42eeedeeae5af352d834bbde15cbf5e49c63618
      the_present.should be_within(187910.55, some_tolerance)
      the_future.should  be_within(198436.5, some_tolerance)
      the_relative_increase.should be_within(5.6, some_tolerance)
      the_absolute_increase.should be_within(10526.0, some_tolerance)
    end
  end
end