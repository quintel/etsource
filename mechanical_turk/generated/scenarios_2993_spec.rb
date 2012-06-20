require 'spec_helper'

describe "untitled" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2030, use_fce: false) do
      move_slider 335, 0.2       # households_number_of_inhabitants
      move_slider 203, 0.5       # households_electricity_demand_per_person
      move_slider 372, -1       # households_heat_demand_per_person
      move_slider 204, 1       # households_cooling_demand_per_person
      move_slider 373, 0       # households_hot_water_demand_per_person
      move_slider 1, 0.2       # households_replacement_of_existing_houses
      move_slider 336, 1.9       # households_insulation_level_old_houses
      move_slider 337, 3.3       # households_insulation_level_new_houses
      move_slider 333, 45.7       # households_heating_gas_combi_heater_share
      move_slider 48, 3.0       # households_heating_solar_thermal_panels_share
      move_slider 51, 12.5       # households_heating_micro_chp_share
      move_slider 52, 0.4       # households_heating_electric_heater_share
      move_slider 242, 53.333333333333336       # households_heating_small_gas_chp_share
      move_slider 248, 1.1       # households_heating_oil_fired_heater_share
      move_slider 317, 3.0       # households_heating_gas_fired_heat_pump_share
      move_slider 338, 6.0       # households_heating_heat_pump_ground_share
      move_slider 339, 7.0       # households_heating_heat_pump_add_on_share
      move_slider 340, 1.7       # households_heating_pellet_stove_share
      move_slider 341, 46.666666666666664       # households_heating_heat_network_share
      move_slider 343, 0.0       # households_heating_biomass_chp_share
      move_slider 344, 0.0       # households_heating_geothermal_share
      move_slider 375, 9.0       # households_heating_heat_pump_with_ts_share
      move_slider 411, 0.1       # households_heating_coal_fired_heater_share
      move_slider 346, 7.5       # households_hot_water_gas_water_heater_share
      move_slider 347, 0.7       # households_hot_water_electric_boiler_share
      move_slider 348, 3.3       # households_hot_water_solar_water_heater_share
      move_slider 349, 90       # not found
      move_slider 354, 26       # households_cooking_gas_share
      move_slider 355, 13       # households_cooking_electric_share
      move_slider 356, 25       # households_cooking_halogen_share
      move_slider 357, 36       # households_cooking_induction_share
      move_slider 6, 38       # households_efficiency_fridge_freezer
      move_slider 359, 43       # households_efficiency_dish_washer
      move_slider 360, 7       # households_efficiency_vacuum_cleaner
      move_slider 361, 40       # households_efficiency_washing_machine
      move_slider 362, 43       # households_efficiency_dryer
      move_slider 363, 7       # households_efficiency_television
      move_slider 364, 15       # households_efficiency_computer_media
      move_slider 412, 0       # households_efficiency_other
      move_slider 43, 32       # households_lighting_low_energy_light_bulb_share
      move_slider 44, 59       # households_lighting_light_emitting_diode_share
      move_slider 245, 9       # households_lighting_incandescent_share
      move_slider 366, 57       # households_behavior_standby_killer_turn_off_appliances
      move_slider 368, 57       # households_behavior_turn_off_the_light
      move_slider 370, 57       # households_behavior_close_windows_turn_off_heating
      move_slider 371, 40       # households_efficiency_low_temperature_washing
      move_slider 47, 31       # households_market_penetration_solar_panels
      move_slider 376, 0.2       # buildings_number_of_buildings
      move_slider 377, 0.5       # buildings_electricity_per_student_employee
      move_slider 378, -1       # buildings_heat_per_employee_student
      move_slider 408, 0.2       # buildings_cooling_per_student_employee
      move_slider 381, 1.9       # buildings_insulation_level
      move_slider 382, 2.7       # not found
      move_slider 383, 35.2       # buildings_heating_gas_fired_heater_share
      move_slider 384, 0       # not found
      move_slider 385, 3       # buildings_heating_biomass_chp_share
      move_slider 386, 4.9       # buildings_heating_small_gas_chp_share
      move_slider 387, 0.4       # buildings_heating_electric_heater_share
      move_slider 388, 0.5       # buildings_heating_heat_network_share
      move_slider 389, 10       # buildings_heating_solar_thermal_panels_share
      move_slider 390, 6       # buildings_heating_gas_fired_heat_pump_share
      move_slider 394, 26       # buildings_heating_heat_pump_with_ts_share
      move_slider 406, 7       # buildings_heating_biomass_fired_heater_share
      move_slider 409, 7       # buildings_heating_oil_fired_heater_share
      move_slider 395, 1.9       # buildings_ventilation_rate
      move_slider 396, 26       # buildings_recirculation
      move_slider 397, 36       # buildings_waste_heat_recovery
      move_slider 398, 1       # buildings_appliances_efficiency
      move_slider 400, 9       # buildings_lighting_fluorescent_tube_conventional_share
      move_slider 401, 32       # buildings_lighting_fluorescent_tube_high_performance_share
      move_slider 402, 59       # buildings_lighting_led_tube_share
      move_slider 403, 79       # buildings_lighting_motion_detection
      move_slider 404, 79       # buildings_lighting_daylight_dependent_control
      move_slider 405, 31       # buildings_market_penetration_solar_panels
      move_slider 141, 0.9       # transport_cars
      move_slider 142, 1       # transport_trucks
      move_slider 143, 1       # transport_trains
      move_slider 144, 0       # transport_domestic_flights
      move_slider 145, 1.1       # transport_inland_navigation
      move_slider 148, 31       # transport_cars_gasoline_share
      move_slider 146, 25       # transport_cars_electric_share
      move_slider 147, 37       # transport_cars_diesel_share
      move_slider 238, 2       # transport_cars_lpg_share
      move_slider 239, 5       # transport_cars_compressed_gas_share
      move_slider 158, 87       # transport_trucks_diesel_share
      move_slider 157, 3       # transport_trucks_gasoline_share
      move_slider 159, 6       # transport_trucks_electric_share
      move_slider 240, 4       # transport_trucks_compressed_gas_share
      move_slider 171, 1       # transport_efficiency_electric_vehicles
      move_slider 186, 1       # transport_efficiency_combustion_engine_cars
      move_slider 328, 0.5       # transport_efficiency_combustion_engine_trucks
      move_slider 187, 0.3       # transport_efficiency_ships
      move_slider 188, 0.3       # transport_efficiency_airplanes
      move_slider 241, 0.3       # transport_efficiency_trains
      move_slider 213, 1.2       # industry_electricity_demand
      move_slider 214, 1.2       # industry_heat_demand
      move_slider 202, 1.3       # industry_non_energetic_other_demand
      move_slider 205, 1.3       # industry_non_energetic_oil_demand
      move_slider 169, 0.5       # industry_efficiency_electricity
      move_slider 170, 0.5       # industry_heat_from_fuels
      move_slider 216, 44.3       # industry_heating_gas_fired_heater_share
      move_slider 217, 14       # industry_heating_oil_fired_heater_share
      move_slider 218, 2.7       # industry_heating_coal_fired_heater_share
      move_slider 219, 7       # industry_heating_biomass_fired_heater_share
      move_slider 326, 32       # industry_heating_combined_heat_power_share
      move_slider 322, 125       # industry_number_of_gas_chp
      move_slider 323, 0       # not found
      move_slider 324, 23       # industry_number_of_biomass_chp
      move_slider 220, 0.5       # agriculture_electricity_demand
      move_slider 221, 0.1       # agriculture_heat_demand
      move_slider 246, 36       # agriculture_heating_gas_fired_heater_share
      move_slider 223, 6       # agriculture_heating_oil_fired_heater_share
      move_slider 225, 6       # agriculture_heating_biomass_fired_heater_share
      move_slider 227, 17       # agriculture_heating_heat_pump_with_ts_share
      move_slider 228, 13       # agriculture_heating_geothermal_share
      move_slider 327, 22       # agriculture_heating_combined_heat_power_share
      move_slider 325, 3000       # agriculture_number_of_small_gas_chp
      move_slider 229, 1.1       # other_electricity_demand
      move_slider 230, 0.1       # other_heat_demand
      move_slider 321, 127       # other_number_of_small_gas_chp
      move_slider 198, -56       # policy_sustainability_co2_emissions
      move_slider 234, 38       # policy_sustainability_renewable_percentage
      move_slider 178, 733       # policy_area_onshore_land
      move_slider 179, 117       # policy_area_onshore_coast
      move_slider 233, 1500       # policy_area_offshore
      move_slider 193, 267       # policy_area_roofs_for_solar_panels
      move_slider 194, 68       # policy_area_land_for_solar_panels
      move_slider 195, 5       # policy_area_land_for_csp
      move_slider 206, 87       # policy_dependence_max_dependence
      move_slider 212, 71       # policy_dependence_max_electricity_dependence
      move_slider 208, 42       # policy_cost_total_energy_cost
      move_slider 207, 42       # policy_cost_electricity_cost
      move_slider 11, 97       # costs_oil
      move_slider 57, 93       # costs_coal
      move_slider 58, 97       # costs_gas
      move_slider 59, 93       # costs_biomass
      move_slider 16, 83       # investment_costs_combustion_gas_plant
      move_slider 17, 85       # investment_costs_combustion_oil_plant
      move_slider 18, 87       # investment_costs_combustion_coal_plant
      move_slider 19, 83       # investment_costs_combustion_biomass_plant
      move_slider 231, 83       # investment_costs_combustion_waste_incinerator
      move_slider 180, 35       # om_costs_combustion_gas_plant
      move_slider 181, 35       # om_costs_combustion_oil_plant
      move_slider 182, 35       # om_costs_combustion_coal_plant
      move_slider 183, 35       # om_costs_combustion_biomass_plant
      move_slider 232, 35       # om_costs_combustion_waste_incinerator
      move_slider 185, 217       # costs_uranium
      move_slider 136, 73       # investment_costs_nuclear_nuclear_plant
      move_slider 121, 40       # om_costs_nuclear_nuclear_plant
      move_slider 12, -13       # investment_costs_wind_onshore
      move_slider 14, -20       # investment_costs_wind_offshore
      move_slider 126, 5       # om_costs_wind_onshore
      move_slider 127, 10       # om_costs_wind_offshore
      move_slider 114, 10       # investment_costs_water_river
      move_slider 116, -72       # not found
      move_slider 129, 0       # om_costs_water_river
      move_slider 130, 0       # not found
      move_slider 133, -60       # investment_costs_solar_solar_panels
      move_slider 134, -16       # investment_costs_solar_concentrated_solar_power
      move_slider 247, -22       # investment_costs_earth_geothermal_electricity
      move_slider 132, 0       # om_costs_earth_geothermal_electricity
      move_slider 137, 83       # costs_co2
      move_slider 138, 17       # costs_co2_free_allocation
      move_slider 139, -3       # om_costs_co2_ccs
      move_slider 140, -8       # investment_costs_co2_ccs
      move_slider 250, 0.6       # number_of_pulverized_coal
      move_slider 251, 0       # number_of_pulverized_coal_ccs
      move_slider 253, 0       # number_of_coal_iggc
      move_slider 254, 0.3       # number_of_coal_igcc_ccs
      move_slider 255, 0       # number_of_coal_oxyfuel_ccs
      move_slider 315, 0.0       # number_of_coal_conventional
      move_slider 316, 0       # number_of_coal_lignite
      move_slider 256, 1       # number_of_gas_conventional
      move_slider 257, 3       # number_of_gas_ccgt
      move_slider 416, 0       # number_of_gas_ccgt_ccs
      move_slider 258, 0       # number_of_oil_fired_plant
      move_slider 259, 0.1       # number_of_nuclear_3rd_gen
      move_slider 413, 0       # number_of_nuclear_conventional
      move_slider 488, 18       # green_gas_total_share
      move_slider 489, 82       # natural_gas_total_share
      move_slider 261, 0.3       # number_of_co_firing_coal
      move_slider 262, 0       # not found
      move_slider 263, 1724       # number_of_wind_onshore_land
      move_slider 264, 724       # number_of_wind_onshore_coast
      move_slider 265, 2818       # number_of_wind_offshore
      move_slider 266, 4       # number_of_hydro_river
      move_slider 268, 0.6       # not found
      move_slider 270, 0       # number_of_geothermal_electric
      move_slider 298, 61       # number_of_solar_pv_plants
      move_slider 299, 0       # number_of_concentrated_solar_power
      move_slider 271, 10       # number_of_waste_incinerator
      move_slider 292, 87       # transport_diesel_share
      move_slider 293, 13       # transport_biodiesel_share
      move_slider 294, 87       # transport_gasoline_share
      move_slider 295, 13       # transport_bio_ethanol_share
      move_slider 296, 63       # not found
      move_slider 297, 37       # not found
      move_slider 441, 7.5       # households_heating_gas_fired_heater_share
      move_slider 446, 68.0       # households_hot_water_gas_fired_heater_share
      move_slider 420, 6.0       # households_hot_water_heat_pump_ground_share
      move_slider 444, 2.3       # households_hot_water_biomass_heater_share
      move_slider 445, 12.5       # households_hot_water_micro_chp_share
      move_slider 421, 1.7       # households_hot_water_heat_network_share
      move_slider 439, 0.0       # households_hot_water_fuel_cell_share
      move_slider 435, 1.2       # households_hot_water_oil_fired_heater_share
      move_slider 443, 0.1       # households_hot_water_coal_fired_heater_hotwater_share
      move_slider 351, 6.0       # households_cooling_heat_pump_ground_share
      move_slider 374, 0.0       # households_cooling_heat_pump_with_ts_share
      move_slider 352, 0.0       # households_cooling_gas_fired_heat_pump_share
      move_slider 353, 94.0       # households_cooling_airconditioning_share
      move_slider 436, 0.0       # households_cooking_biomass_share
      move_slider 314, 1.5       # not found
      move_slider 276, 1.5       # number_of_large_gas_chp
      move_slider 275, 3637.9       # number_of_small_chp_fixed
      move_slider 274, 257907.4       # number_of_micro_chp_fixed
      move_slider 431, 0.0       # number_of_biomass_fired_heater_district
      move_slider 285, 24.0       # not found
      move_slider 414, 62736.0       # number_of_biomass_fired_heater_fixed
      move_slider 286, 0.0       # not found
      move_slider 289, 306769.0       # number_of_electric_heat_pump_fixed
      move_slider 291, 146.0       # number_of_geothermal_fixed
      move_slider 290, 332788.0       # number_of_solar_water_heater_fixed
      move_slider 272, 24.0       # number_of_biomass_chp_fixed
      move_slider 313, 6889.0       # number_of_solar_pv_roofs_fixed
      move_slider 551, 1.0       # number_of_central_coal_chp
      move_slider 277, 0.0       # number_of_decentral_coal_chp_fixed
      move_slider 582, 3.0       # households_heating_district_heating_network_share
    end
  end

  after :all do
    print_comparison('localhost') if ENV["LOCALHOST"]
    print_comparison('beta') if ENV["BETA"]
  end

  describe "gqueries" do
      
    it "dashboard_bio_footprint" do
      the_present.should be_within(0.224, some_tolerance)
      the_future.should  be_within(1.54, some_tolerance)
      the_relative_increase.should be_within(586.0, some_tolerance)
      the_absolute_increase.should be_within(1.3, some_tolerance)
    end


      
    it "dashboard_employment" do
      the_present.should be_within(29409.913, some_tolerance)
      the_future.should  be_within(51990.702, some_tolerance)
      the_relative_increase.should be_within(76.8, some_tolerance)
      the_absolute_increase.should be_within(22580.8, some_tolerance)
    end


      
    it "dashboard_energy_demand_primary_of_final" do
      the_present.should be_within(3461730879704.038, some_tolerance)
      the_future.should  be_within(3136395753125.562, some_tolerance)
      the_relative_increase.should be_within(-9.4, some_tolerance)
      the_absolute_increase.should be_within(-325335126578.5, some_tolerance)
    end


      
    it "dashboard_energy_import_netto" do
      the_present.should be_within(0.294, some_tolerance)
      the_future.should  be_within(0.726, some_tolerance)
      the_relative_increase.should be_within(147.2, some_tolerance)
      the_absolute_increase.should be_within(0.4, some_tolerance)
    end


      
    it "dashboard_reduction_of_co2_emissions_versus_1990" do
      the_present.should be_within(0.084, some_tolerance)
      the_future.should  be_within(-0.347, some_tolerance)
      the_relative_increase.should be_within(-511.1, some_tolerance)
      the_absolute_increase.should be_within(-0.4, some_tolerance)
    end


      
    it "dashboard_renewability" do
      the_present.should be_within(0.033, some_tolerance)
      the_future.should  be_within(0.298, some_tolerance)
      the_relative_increase.should be_within(814.2, some_tolerance)
      the_absolute_increase.should be_within(0.3, some_tolerance)
    end


      
    it "dashboard_security_of_supply" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.742, some_tolerance)
      the_relative_increase.should be_within(174024358.6, some_tolerance)
      the_absolute_increase.should be_within(0.7, some_tolerance)
    end


      
    it "dashboard_share_of_renewable_electricity" do
      the_present.should be_within(0.098, some_tolerance)
      the_future.should  be_within(0.7, some_tolerance)
      the_relative_increase.should be_within(615.5, some_tolerance)
      the_absolute_increase.should be_within(0.6, some_tolerance)
    end


      
    it "dashboard_total_costs" do
      the_present.should be_within(48.437, some_tolerance)
      the_future.should  be_within(80.068, some_tolerance)
      the_relative_increase.should be_within(65.3, some_tolerance)
      the_absolute_increase.should be_within(31.6, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_agriculture" do
      the_present.should be_within(2109325263.244, some_tolerance)
      the_future.should  be_within(3009747168.3, some_tolerance)
      the_relative_increase.should be_within(42.7, some_tolerance)
      the_absolute_increase.should be_within(900421905.1, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_buildings" do
      the_present.should be_within(5346359830.651, some_tolerance)
      the_future.should  be_within(4412581084.729, some_tolerance)
      the_relative_increase.should be_within(-17.5, some_tolerance)
      the_absolute_increase.should be_within(-933778745.9, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_households" do
      the_present.should be_within(7813038899.502, some_tolerance)
      the_future.should  be_within(7869693628.253, some_tolerance)
      the_relative_increase.should be_within(0.7, some_tolerance)
      the_absolute_increase.should be_within(56654728.8, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_industry_and_energy" do
      the_present.should be_within(23647581507.799, some_tolerance)
      the_future.should  be_within(49583744094.432, some_tolerance)
      the_relative_increase.should be_within(109.7, some_tolerance)
      the_absolute_increase.should be_within(25936162586.6, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_other" do
      the_present.should be_within(1444370733.371, some_tolerance)
      the_future.should  be_within(2547730388.35, some_tolerance)
      the_relative_increase.should be_within(76.4, some_tolerance)
      the_absolute_increase.should be_within(1103359655.0, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_transport" do
      the_present.should be_within(8076663885.401, some_tolerance)
      the_future.should  be_within(12644173006.715, some_tolerance)
      the_relative_increase.should be_within(56.6, some_tolerance)
      the_absolute_increase.should be_within(4567509121.3, some_tolerance)
    end


      
    it "dashboard_total_costs_per_household" do
      the_present.should be_within(6590.563, some_tolerance)
      the_future.should  be_within(10894.302, some_tolerance)
      the_relative_increase.should be_within(65.3, some_tolerance)
      the_absolute_increase.should be_within(4303.7, some_tolerance)
    end


      
    it "turk_number_of_households" do
      the_present.should be_within(7349500.0, some_tolerance)
      the_future.should  be_within(7349500.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_coal" do
      the_present.should be_within(4525.868, some_tolerance)
      the_future.should  be_within(7349.5, some_tolerance)
      the_relative_increase.should be_within(62.4, some_tolerance)
      the_absolute_increase.should be_within(2823.6, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_collective_heatpump_water_water_ts_electricity" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(2128.234, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(2128.2, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_combined_network_gas" do
      the_present.should be_within(6036264.993, some_tolerance)
      the_future.should  be_within(4093671.5, some_tolerance)
      the_relative_increase.should be_within(-32.2, some_tolerance)
      the_absolute_increase.should be_within(-1942593.5, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_crude_oil" do
      the_present.should be_within(91365.959, some_tolerance)
      the_future.should  be_within(80844.5, some_tolerance)
      the_relative_increase.should be_within(-11.5, some_tolerance)
      the_absolute_increase.should be_within(-10521.5, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_district_heating_steam_hot_water" do
      the_present.should be_within(100978.019, some_tolerance)
      the_future.should  be_within(47611.545, some_tolerance)
      the_relative_increase.should be_within(-52.8, some_tolerance)
      the_absolute_increase.should be_within(-53366.5, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_electricity" do
      the_present.should be_within(129397.747, some_tolerance)
      the_future.should  be_within(29398.0, some_tolerance)
      the_relative_increase.should be_within(-77.3, some_tolerance)
      the_absolute_increase.should be_within(-99999.7, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_heatpump_air_water_network_gas" do
      the_present.should be_within(0.712, some_tolerance)
      the_future.should  be_within(709.411, some_tolerance)
      the_relative_increase.should be_within(99515.0, some_tolerance)
      the_absolute_increase.should be_within(708.7, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_heatpump_ground_water_electricity" do
      the_present.should be_within(5506.287, some_tolerance)
      the_future.should  be_within(440970.0, some_tolerance)
      the_relative_increase.should be_within(7908.5, some_tolerance)
      the_absolute_increase.should be_within(435463.7, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_micro_chp_network_gas" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(918687.5, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(918687.5, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_network_gas" do
      the_present.should be_within(670698.346, some_tolerance)
      the_future.should  be_within(551212.5, some_tolerance)
      the_relative_increase.should be_within(-17.8, some_tolerance)
      the_absolute_increase.should be_within(-119485.8, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_wood_pellets" do
      the_present.should be_within(187980.942, some_tolerance)
      the_future.should  be_within(124941.5, some_tolerance)
      the_relative_increase.should be_within(-33.5, some_tolerance)
      the_absolute_increase.should be_within(-63039.4, some_tolerance)
    end


  end
end