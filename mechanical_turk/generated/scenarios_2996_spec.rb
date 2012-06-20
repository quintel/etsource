require 'spec_helper'

describe "untitled" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2050, use_fce: false) do
      move_slider 203, 0.30000000000000004       # households_electricity_demand_per_person
      move_slider 204, 0.2       # households_cooling_demand_per_person
      move_slider 335, 0.2       # households_number_of_inhabitants
      move_slider 372, 0.0       # households_heat_demand_per_person
      move_slider 373, 0.2       # households_hot_water_demand_per_person
      move_slider 1, 0.5       # households_replacement_of_existing_houses
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
      move_slider 398, 2.5       # buildings_appliances_efficiency
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
      move_slider 214, 0.30000000000000004       # industry_heat_demand
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
      move_slider 198, -80.0       # policy_sustainability_co2_emissions
      move_slider 234, 50.0       # policy_sustainability_renewable_percentage
      move_slider 178, 250.0       # policy_area_onshore_land
      move_slider 179, 50.0       # policy_area_onshore_coast
      move_slider 233, 1500.0       # policy_area_offshore
      move_slider 193, 255.8       # policy_area_roofs_for_solar_panels
      move_slider 194, 50.0       # policy_area_land_for_solar_panels
      move_slider 195, 50.0       # policy_area_land_for_csp
      move_slider 206, 50.0       # policy_dependence_max_dependence
      move_slider 212, 25.0       # policy_dependence_max_electricity_dependence
      move_slider 208, 25.0       # policy_cost_total_energy_cost
      move_slider 207, 50.0       # policy_cost_electricity_cost
      move_slider 43, 4.7       # households_lighting_low_energy_light_bulb_share
      move_slider 44, 95.3       # households_lighting_light_emitting_diode_share
      move_slider 47, 78.5       # households_market_penetration_solar_panels
      move_slider 48, 0.0       # households_heating_solar_thermal_panels_share
      move_slider 51, 5.0       # households_heating_micro_chp_share
      move_slider 52, 3.0       # households_heating_electric_heater_share
      move_slider 146, 96.4       # transport_cars_electric_share
      move_slider 147, 0.20000000000000007       # transport_cars_diesel_share
      move_slider 148, 0.8       # transport_cars_gasoline_share
      move_slider 157, 0.0       # transport_trucks_gasoline_share
      move_slider 158, 0.0       # transport_trucks_diesel_share
      move_slider 159, 91.7       # transport_trucks_electric_share
      move_slider 217, 0.2       # industry_heating_oil_fired_heater_share
      move_slider 218, 0.0       # industry_heating_coal_fired_heater_share
      move_slider 219, 42.5       # industry_heating_biomass_fired_heater_share
      move_slider 223, 0.0       # agriculture_heating_oil_fired_heater_share
      move_slider 225, 23.033333333333328       # agriculture_heating_biomass_fired_heater_share
      move_slider 227, 52.33333333333336       # agriculture_heating_heat_pump_with_ts_share
      move_slider 228, 21.36666666666668       # agriculture_heating_geothermal_share
      move_slider 229, 0.0       # other_electricity_demand
      move_slider 230, -1.0       # other_heat_demand
      move_slider 238, 1.0       # transport_cars_lpg_share
      move_slider 239, 1.5999999999999999       # transport_cars_compressed_gas_share
      move_slider 240, 8.3       # transport_trucks_compressed_gas_share
      move_slider 242, 14.893617021276597       # households_heating_small_gas_chp_share
      move_slider 248, 0.6       # households_heating_oil_fired_heater_share
      move_slider 250, 0.0       # number_of_pulverized_coal
      move_slider 251, 0.0       # number_of_pulverized_coal_ccs
      move_slider 253, 0.0       # number_of_coal_iggc
      move_slider 254, 0.0       # number_of_coal_igcc_ccs
      move_slider 255, 0.0       # number_of_coal_oxyfuel_ccs
      move_slider 256, 0.0       # number_of_gas_conventional
      move_slider 257, 0.0       # number_of_gas_ccgt
      move_slider 258, 0.0       # number_of_oil_fired_plant
      move_slider 259, 1.0       # number_of_nuclear_3rd_gen
      move_slider 261, 0.0       # number_of_co_firing_coal
      move_slider 262, 0.0       # not found
      move_slider 263, 1174.1       # number_of_wind_onshore_land
      move_slider 264, 249.6       # number_of_wind_onshore_coast
      move_slider 265, 6230.5199999999995       # number_of_wind_offshore
      move_slider 266, 6.6       # number_of_hydro_river
      move_slider 267, 0.0       # number_of_hydro_mountain
      move_slider 268, 0.0       # not found
      move_slider 270, 100.0       # number_of_geothermal_electric
      move_slider 271, 6.81       # number_of_waste_incinerator
      move_slider 298, 0.0       # number_of_solar_pv_plants
      move_slider 299, 0.0       # number_of_concentrated_solar_power
      move_slider 315, 0.0       # number_of_coal_conventional
      move_slider 316, 0.0       # number_of_coal_lignite
      move_slider 317, 1.0       # households_heating_gas_fired_heat_pump_share
      move_slider 321, 7.38       # other_number_of_small_gas_chp
      move_slider 322, 32.3       # industry_number_of_gas_chp
      move_slider 323, 78.3       # not found
      move_slider 324, 0.0       # industry_number_of_biomass_chp
      move_slider 325, 138.39       # agriculture_number_of_small_gas_chp
      move_slider 326, 26.3       # industry_heating_combined_heat_power_share
      move_slider 327, 3.1000000000000005       # agriculture_heating_combined_heat_power_share
      move_slider 338, 14.1       # households_heating_heat_pump_ground_share
      move_slider 339, 15.600000000000001       # households_heating_heat_pump_add_on_share
      move_slider 340, 18.6       # households_heating_pellet_stove_share
      move_slider 341, 20.0       # households_heating_heat_network_share
      move_slider 343, 9.361702127659575       # households_heating_biomass_chp_share
      move_slider 344, 55.74468085106383       # households_heating_geothermal_share
      move_slider 346, 8.2       # households_hot_water_gas_water_heater_share
      move_slider 347, 0.9       # households_hot_water_electric_boiler_share
      move_slider 348, 50       # households_hot_water_solar_water_heater_share
      move_slider 349, 0.07777777777777778       # not found
      move_slider 351, 14.1       # households_cooling_heat_pump_ground_share
      move_slider 352, 1.0       # households_cooling_gas_fired_heat_pump_share
      move_slider 354, 8.469999999999999       # households_cooking_gas_share
      move_slider 355, 4.25       # households_cooking_electric_share
      move_slider 356, 3.0       # households_cooking_halogen_share
      move_slider 357, 84.28       # households_cooking_induction_share
      move_slider 374, 2.5000000000000004       # households_cooling_heat_pump_with_ts_share
      move_slider 375, 2.5       # households_heating_heat_pump_with_ts_share
      move_slider 384, 0.0       # not found
      move_slider 385, 0.0010000000000000495       # buildings_heating_biomass_chp_share
      move_slider 386, 0.09999999999999964       # buildings_heating_small_gas_chp_share
      move_slider 387, 1.7999999999999998       # buildings_heating_electric_heater_share
      move_slider 388, 0.8       # buildings_heating_heat_network_share
      move_slider 389, 6.198999999999997       # buildings_heating_solar_thermal_panels_share
      move_slider 390, 47.2       # buildings_heating_gas_fired_heat_pump_share
      move_slider 391, 54.100000000000016       # buildings_cooling_gas_fired_heat_pump_share
      move_slider 392, 30.666666666666657       # buildings_cooling_heat_pump_with_ts_share
      move_slider 393, 15.233333333333343       # buildings_cooling_airconditioning_share
      move_slider 394, 22.0       # buildings_heating_heat_pump_with_ts_share
      move_slider 395, 2.5       # buildings_ventilation_rate
      move_slider 396, 10.0       # buildings_recirculation
      move_slider 397, 43.9       # buildings_waste_heat_recovery
      move_slider 400, 2.0533333333333332       # buildings_lighting_fluorescent_tube_conventional_share
      move_slider 401, 18.28000000000001       # buildings_lighting_fluorescent_tube_high_performance_share
      move_slider 402, 79.66666666666663       # buildings_lighting_led_tube_share
      move_slider 403, 26.5       # buildings_lighting_motion_detection
      move_slider 404, 20.5       # buildings_lighting_daylight_dependent_control
      move_slider 405, 100.0       # buildings_market_penetration_solar_panels
      move_slider 406, 16.5       # buildings_heating_biomass_fired_heater_share
      move_slider 409, 2.0       # buildings_heating_oil_fired_heater_share
      move_slider 411, 0.6000000000000001       # households_heating_coal_fired_heater_share
      move_slider 413, 0.6       # number_of_nuclear_conventional
      move_slider 416, 0.0       # number_of_gas_ccgt_ccs
      move_slider 488, 4.6       # green_gas_total_share
      move_slider 489, 95.4       # natural_gas_total_share
      move_slider 246, 0.16666666666666666       # agriculture_heating_gas_fired_heater_share
      move_slider 353, 82.4       # households_cooling_airconditioning_share
      move_slider 383, 3.4000000000000004       # buildings_heating_gas_fired_heater_share
      move_slider 333, 8.0       # households_heating_gas_combi_heater_share
      move_slider 245, 1.1102230246251565e-16       # households_lighting_incandescent_share
      move_slider 216, 31.0       # industry_heating_gas_fired_heater_share
      move_slider 296, 98.2       # not found
      move_slider 297, 1.8       # not found
      move_slider 292, 68.2       # transport_diesel_share
      move_slider 293, 31.799999999999997       # transport_biodiesel_share
      move_slider 294, 69.5       # transport_gasoline_share
      move_slider 295, 30.5       # transport_bio_ethanol_share
      move_slider 428, 2.0666666666666664       # transport_trains_diesel_share
      move_slider 425, 98.5       # transport_ships_diesel_share
      move_slider 423, 97.5       # transport_planes_fossil_fuel_share
      move_slider 424, 2.5       # transport_planes_bio_ethanol_share
      move_slider 418, 7.588888888888886       # not found
      move_slider 419, 4.4       # not found
      move_slider 420, 33.6       # households_hot_water_heat_pump_ground_share
      move_slider 421, 4.7       # households_hot_water_heat_network_share
      move_slider 435, 0.9       # households_hot_water_oil_fired_heater_share
      move_slider 426, 1.5       # transport_ships_bio_diesel_share
      move_slider 429, 87.93333333333332       # transport_trains_electric_share
      move_slider 427, 10.0       # transport_trains_coal_share
      move_slider 422, 0.0       # number_of_lignite_chp
      move_slider 441, 7.5       # households_heating_gas_fired_heater_share
      move_slider 446, 27.200000000000003       # households_hot_water_gas_fired_heater_share
      move_slider 444, 18.6       # households_hot_water_biomass_heater_share
      move_slider 445, 5.0       # households_hot_water_micro_chp_share
      move_slider 439, 0.0       # households_hot_water_fuel_cell_share
      move_slider 443, 0.9       # households_hot_water_coal_fired_heater_hotwater_share
      move_slider 436, 0.0       # households_cooking_biomass_share
      move_slider 551, 0.0       # number_of_central_coal_chp
      move_slider 277, 0.0       # number_of_decentral_coal_chp_fixed
      move_slider 276, 0.0       # number_of_large_gas_chp
      move_slider 275, 570.9       # number_of_small_chp_fixed
      move_slider 274, 211468.4       # number_of_micro_chp_fixed
      move_slider 582, 23.5       # households_heating_district_heating_network_share
    end
  end

  after :all do
    print_comparison('localhost') if ENV["LOCALHOST"]
    print_comparison('beta') if ENV["BETA"]
  end

  describe "gqueries" do
      
    it "dashboard_bio_footprint" do
      the_present.should be_within(0.224, some_tolerance)
      the_future.should  be_within(0.973, some_tolerance)
      the_relative_increase.should be_within(333.4, some_tolerance)
      the_absolute_increase.should be_within(0.7, some_tolerance)
    end


      
    it "dashboard_employment" do
      the_present.should be_within(29409.913, some_tolerance)
      the_future.should  be_within(91282.039, some_tolerance)
      the_relative_increase.should be_within(210.4, some_tolerance)
      the_absolute_increase.should be_within(61872.1, some_tolerance)
    end


      
    it "dashboard_energy_demand_primary_of_final" do
      the_present.should be_within(3461730879704.038, some_tolerance)
      the_future.should  be_within(1926965082143.042, some_tolerance)
      the_relative_increase.should be_within(-44.3, some_tolerance)
      the_absolute_increase.should be_within(-1534765797561.0, some_tolerance)
    end


      
    it "dashboard_energy_import_netto" do
      the_present.should be_within(0.294, some_tolerance)
      the_future.should  be_within(0.748, some_tolerance)
      the_relative_increase.should be_within(154.4, some_tolerance)
      the_absolute_increase.should be_within(0.5, some_tolerance)
    end


      
    it "dashboard_reduction_of_co2_emissions_versus_1990" do
      the_present.should be_within(0.084, some_tolerance)
      the_future.should  be_within(-0.801, some_tolerance)
      the_relative_increase.should be_within(-1048.6, some_tolerance)
      the_absolute_increase.should be_within(-0.9, some_tolerance)
    end


      
    it "dashboard_renewability" do
      the_present.should be_within(0.033, some_tolerance)
      the_future.should  be_within(0.609, some_tolerance)
      the_relative_increase.should be_within(1771.5, some_tolerance)
      the_absolute_increase.should be_within(0.6, some_tolerance)
    end


      
    it "dashboard_security_of_supply" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.999, some_tolerance)
      the_relative_increase.should be_within(234244776.9, some_tolerance)
      the_absolute_increase.should be_within(1.0, some_tolerance)
    end


      
    it "dashboard_share_of_renewable_electricity" do
      the_present.should be_within(0.098, some_tolerance)
      the_future.should  be_within(1.086, some_tolerance)
      the_relative_increase.should be_within(1010.9, some_tolerance)
      the_absolute_increase.should be_within(1.0, some_tolerance)
    end


      
    it "dashboard_total_costs" do
      the_present.should be_within(48.437, some_tolerance)
      the_future.should  be_within(47.107, some_tolerance)
      the_relative_increase.should be_within(-2.7, some_tolerance)
      the_absolute_increase.should be_within(-1.3, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_agriculture" do
      the_present.should be_within(2109325263.244, some_tolerance)
      the_future.should  be_within(1791803977.529, some_tolerance)
      the_relative_increase.should be_within(-15.1, some_tolerance)
      the_absolute_increase.should be_within(-317521285.7, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_buildings" do
      the_present.should be_within(5346359830.651, some_tolerance)
      the_future.should  be_within(3792809600.965, some_tolerance)
      the_relative_increase.should be_within(-29.1, some_tolerance)
      the_absolute_increase.should be_within(-1553550229.7, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_households" do
      the_present.should be_within(7813038899.502, some_tolerance)
      the_future.should  be_within(6571314580.519, some_tolerance)
      the_relative_increase.should be_within(-15.9, some_tolerance)
      the_absolute_increase.should be_within(-1241724319.0, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_industry_and_energy" do
      the_present.should be_within(23647581507.799, some_tolerance)
      the_future.should  be_within(29350541971.422, some_tolerance)
      the_relative_increase.should be_within(24.1, some_tolerance)
      the_absolute_increase.should be_within(5702960463.6, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_other" do
      the_present.should be_within(1444370733.371, some_tolerance)
      the_future.should  be_within(1601904171.896, some_tolerance)
      the_relative_increase.should be_within(10.9, some_tolerance)
      the_absolute_increase.should be_within(157533438.5, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_transport" do
      the_present.should be_within(8076663885.401, some_tolerance)
      the_future.should  be_within(3998493168.792, some_tolerance)
      the_relative_increase.should be_within(-50.5, some_tolerance)
      the_absolute_increase.should be_within(-4078170716.6, some_tolerance)
    end


      
    it "dashboard_total_costs_per_household" do
      the_present.should be_within(6590.563, some_tolerance)
      the_future.should  be_within(6409.534, some_tolerance)
      the_relative_increase.should be_within(-2.7, some_tolerance)
      the_absolute_increase.should be_within(-181.0, some_tolerance)
    end


      
    it "turk_number_of_households" do
      the_present.should be_within(7349500.0, some_tolerance)
      the_future.should  be_within(7349500.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_coal" do
      the_present.should be_within(4525.868, some_tolerance)
      the_future.should  be_within(44097.0, some_tolerance)
      the_relative_increase.should be_within(874.3, some_tolerance)
      the_absolute_increase.should be_within(39571.1, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_collective_heatpump_water_water_ts_electricity" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(591.176, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(591.2, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_combined_network_gas" do
      the_present.should be_within(6036264.993, some_tolerance)
      the_future.should  be_within(1734482.0, some_tolerance)
      the_relative_increase.should be_within(-71.3, some_tolerance)
      the_absolute_increase.should be_within(-4301783.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_crude_oil" do
      the_present.should be_within(91365.959, some_tolerance)
      the_future.should  be_within(44097.0, some_tolerance)
      the_relative_increase.should be_within(-51.7, some_tolerance)
      the_absolute_increase.should be_within(-47269.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_district_heating_steam_hot_water" do
      the_present.should be_within(100978.019, some_tolerance)
      the_future.should  be_within(372429.331, some_tolerance)
      the_relative_increase.should be_within(268.8, some_tolerance)
      the_absolute_increase.should be_within(271451.3, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_electricity" do
      the_present.should be_within(129397.747, some_tolerance)
      the_future.should  be_within(220485.0, some_tolerance)
      the_relative_increase.should be_within(70.4, some_tolerance)
      the_absolute_increase.should be_within(91087.3, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_heatpump_air_water_network_gas" do
      the_present.should be_within(0.712, some_tolerance)
      the_future.should  be_within(236.47, some_tolerance)
      the_relative_increase.should be_within(33105.0, some_tolerance)
      the_absolute_increase.should be_within(235.8, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_heatpump_ground_water_electricity" do
      the_present.should be_within(5506.287, some_tolerance)
      the_future.should  be_within(1036279.5, some_tolerance)
      the_relative_increase.should be_within(18719.9, some_tolerance)
      the_absolute_increase.should be_within(1030773.2, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_micro_chp_network_gas" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(367475.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(367475.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_network_gas" do
      the_present.should be_within(670698.346, some_tolerance)
      the_future.should  be_within(551212.5, some_tolerance)
      the_relative_increase.should be_within(-17.8, some_tolerance)
      the_absolute_increase.should be_within(-119485.8, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_wood_pellets" do
      the_present.should be_within(187980.942, some_tolerance)
      the_future.should  be_within(1367007.0, some_tolerance)
      the_relative_increase.should be_within(627.2, some_tolerance)
      the_absolute_increase.should be_within(1179026.1, some_tolerance)
    end


  end
end