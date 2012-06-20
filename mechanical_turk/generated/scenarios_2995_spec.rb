require 'spec_helper'

describe "untitled" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2050, use_fce: false) do
      move_slider 335, 0.2       # households_number_of_inhabitants
      move_slider 203, 0.5       # households_electricity_demand_per_person
      move_slider 372, -1       # households_heat_demand_per_person
      move_slider 204, 1       # households_cooling_demand_per_person
      move_slider 373, 0       # households_hot_water_demand_per_person
      move_slider 1, 0.2       # households_replacement_of_existing_houses
      move_slider 336, 2.2       # households_insulation_level_old_houses
      move_slider 337, 3.5       # households_insulation_level_new_houses
      move_slider 333, 21.9       # households_heating_gas_combi_heater_share
      move_slider 48, 0.5       # households_heating_solar_thermal_panels_share
      move_slider 51, 25       # households_heating_micro_chp_share
      move_slider 52, 0       # households_heating_electric_heater_share
      move_slider 242, 66.66666666666666       # households_heating_small_gas_chp_share
      move_slider 248, 1       # households_heating_oil_fired_heater_share
      move_slider 317, 5       # households_heating_gas_fired_heat_pump_share
      move_slider 338, 10       # households_heating_heat_pump_ground_share
      move_slider 339, 10       # households_heating_heat_pump_add_on_share
      move_slider 340, 1       # households_heating_pellet_stove_share
      move_slider 341, 33.33333333333333       # households_heating_heat_network_share
      move_slider 343, 0.0       # households_heating_biomass_chp_share
      move_slider 344, 0.0       # households_heating_geothermal_share
      move_slider 375, 15       # households_heating_heat_pump_with_ts_share
      move_slider 411, 0.1       # households_heating_coal_fired_heater_share
      move_slider 346, 7.5       # households_hot_water_gas_water_heater_share
      move_slider 347, 0.0       # households_hot_water_electric_boiler_share
      move_slider 348, 4       # households_hot_water_solar_water_heater_share
      move_slider 349, 94       # not found
      move_slider 354, 20       # households_cooking_gas_share
      move_slider 355, 10       # households_cooking_electric_share
      move_slider 356, 30       # households_cooking_halogen_share
      move_slider 357, 40       # households_cooking_induction_share
      move_slider 6, 50       # households_efficiency_fridge_freezer
      move_slider 359, 60       # households_efficiency_dish_washer
      move_slider 360, 10       # households_efficiency_vacuum_cleaner
      move_slider 361, 55       # households_efficiency_washing_machine
      move_slider 362, 60       # households_efficiency_dryer
      move_slider 363, 10       # households_efficiency_television
      move_slider 364, 20       # households_efficiency_computer_media
      move_slider 412, 0       # households_efficiency_other
      move_slider 43, 25       # households_lighting_low_energy_light_bulb_share
      move_slider 44, 75       # households_lighting_light_emitting_diode_share
      move_slider 245, 0       # households_lighting_incandescent_share
      move_slider 366, 70       # households_behavior_standby_killer_turn_off_appliances
      move_slider 368, 70       # households_behavior_turn_off_the_light
      move_slider 370, 70       # households_behavior_close_windows_turn_off_heating
      move_slider 371, 50       # households_efficiency_low_temperature_washing
      move_slider 47, 50       # households_market_penetration_solar_panels
      move_slider 376, 0.2       # buildings_number_of_buildings
      move_slider 377, 0.5       # buildings_electricity_per_student_employee
      move_slider 378, -1       # buildings_heat_per_employee_student
      move_slider 408, 0.2       # buildings_cooling_per_student_employee
      move_slider 381, 2.2       # buildings_insulation_level
      move_slider 382, 3       # not found
      move_slider 383, 12.6       # buildings_heating_gas_fired_heater_share
      move_slider 384, 0       # not found
      move_slider 385, 5       # buildings_heating_biomass_chp_share
      move_slider 386, 4.9       # buildings_heating_small_gas_chp_share
      move_slider 387, 0       # buildings_heating_electric_heater_share
      move_slider 388, 0.1       # buildings_heating_heat_network_share
      move_slider 389, 15       # buildings_heating_solar_thermal_panels_share
      move_slider 390, 10       # buildings_heating_gas_fired_heat_pump_share
      move_slider 394, 40       # buildings_heating_heat_pump_with_ts_share
      move_slider 406, 7.4       # buildings_heating_biomass_fired_heater_share
      move_slider 409, 5       # buildings_heating_oil_fired_heater_share
      move_slider 395, 1.8       # buildings_ventilation_rate
      move_slider 396, 30       # buildings_recirculation
      move_slider 397, 40       # buildings_waste_heat_recovery
      move_slider 398, 1       # buildings_appliances_efficiency
      move_slider 400, 0       # buildings_lighting_fluorescent_tube_conventional_share
      move_slider 401, 25       # buildings_lighting_fluorescent_tube_high_performance_share
      move_slider 402, 75       # buildings_lighting_led_tube_share
      move_slider 403, 90       # buildings_lighting_motion_detection
      move_slider 404, 90       # buildings_lighting_daylight_dependent_control
      move_slider 405, 50       # buildings_market_penetration_solar_panels
      move_slider 141, 0.8       # transport_cars
      move_slider 142, 0.8       # transport_trucks
      move_slider 143, 1       # transport_trains
      move_slider 144, 0       # transport_domestic_flights
      move_slider 145, 1       # transport_inland_navigation
      move_slider 148, 23       # transport_cars_gasoline_share
      move_slider 146, 40       # transport_cars_electric_share
      move_slider 147, 30       # transport_cars_diesel_share
      move_slider 238, 2       # transport_cars_lpg_share
      move_slider 239, 5       # transport_cars_compressed_gas_share
      move_slider 158, 82       # transport_trucks_diesel_share
      move_slider 157, 3       # transport_trucks_gasoline_share
      move_slider 159, 10       # transport_trucks_electric_share
      move_slider 240, 5       # transport_trucks_compressed_gas_share
      move_slider 171, 1       # transport_efficiency_electric_vehicles
      move_slider 186, 1       # transport_efficiency_combustion_engine_cars
      move_slider 328, 0.5       # transport_efficiency_combustion_engine_trucks
      move_slider 187, 0.3       # transport_efficiency_ships
      move_slider 188, 0.3       # transport_efficiency_airplanes
      move_slider 241, 0.3       # transport_efficiency_trains
      move_slider 213, 1       # industry_electricity_demand
      move_slider 214, 1       # industry_heat_demand
      move_slider 202, 1       # industry_non_energetic_other_demand
      move_slider 205, 1       # industry_non_energetic_oil_demand
      move_slider 169, 0.5       # industry_efficiency_electricity
      move_slider 170, 0.5       # industry_heat_from_fuels
      move_slider 216, 53       # industry_heating_gas_fired_heater_share
      move_slider 217, 10       # industry_heating_oil_fired_heater_share
      move_slider 218, 2       # industry_heating_coal_fired_heater_share
      move_slider 219, 10       # industry_heating_biomass_fired_heater_share
      move_slider 326, 25       # industry_heating_combined_heat_power_share
      move_slider 322, 125       # industry_number_of_gas_chp
      move_slider 323, 0       # not found
      move_slider 324, 30       # industry_number_of_biomass_chp
      move_slider 220, 0.4       # agriculture_electricity_demand
      move_slider 221, 0.1       # agriculture_heat_demand
      move_slider 246, 20       # agriculture_heating_gas_fired_heater_share
      move_slider 223, 5       # agriculture_heating_oil_fired_heater_share
      move_slider 225, 10       # agriculture_heating_biomass_fired_heater_share
      move_slider 227, 25       # agriculture_heating_heat_pump_with_ts_share
      move_slider 228, 20       # agriculture_heating_geothermal_share
      move_slider 327, 20       # agriculture_heating_combined_heat_power_share
      move_slider 325, 3000       # agriculture_number_of_small_gas_chp
      move_slider 229, 1       # other_electricity_demand
      move_slider 230, 0.1       # other_heat_demand
      move_slider 321, 127       # other_number_of_small_gas_chp
      move_slider 198, -80       # policy_sustainability_co2_emissions
      move_slider 234, 50       # policy_sustainability_renewable_percentage
      move_slider 178, 1000       # policy_area_onshore_land
      move_slider 179, 150       # policy_area_onshore_coast
      move_slider 233, 1500       # policy_area_offshore
      move_slider 193, 266.7       # policy_area_roofs_for_solar_panels
      move_slider 194, 100       # policy_area_land_for_solar_panels
      move_slider 195, 5       # policy_area_land_for_csp
      move_slider 206, 100       # policy_dependence_max_dependence
      move_slider 212, 100       # policy_dependence_max_electricity_dependence
      move_slider 208, 50       # policy_cost_total_energy_cost
      move_slider 207, 50       # policy_cost_electricity_cost
      move_slider 11, 120       # costs_oil
      move_slider 57, 120       # costs_coal
      move_slider 58, 120       # costs_gas
      move_slider 59, 120       # costs_biomass
      move_slider 16, 120       # investment_costs_combustion_gas_plant
      move_slider 17, 120       # investment_costs_combustion_oil_plant
      move_slider 18, 120       # investment_costs_combustion_coal_plant
      move_slider 19, 120       # investment_costs_combustion_biomass_plant
      move_slider 231, 120       # investment_costs_combustion_waste_incinerator
      move_slider 180, 50       # om_costs_combustion_gas_plant
      move_slider 181, 50       # om_costs_combustion_oil_plant
      move_slider 182, 50       # om_costs_combustion_coal_plant
      move_slider 183, 50       # om_costs_combustion_biomass_plant
      move_slider 232, 50       # om_costs_combustion_waste_incinerator
      move_slider 185, 300       # costs_uranium
      move_slider 136, 100       # investment_costs_nuclear_nuclear_plant
      move_slider 121, 50       # om_costs_nuclear_nuclear_plant
      move_slider 12, -15       # investment_costs_wind_onshore
      move_slider 14, -25       # investment_costs_wind_offshore
      move_slider 126, 5       # om_costs_wind_onshore
      move_slider 127, 10       # om_costs_wind_offshore
      move_slider 114, 10       # investment_costs_water_river
      move_slider 116, -80       # not found
      move_slider 129, 0       # om_costs_water_river
      move_slider 130, 0       # not found
      move_slider 133, -80       # investment_costs_solar_solar_panels
      move_slider 134, -20       # investment_costs_solar_concentrated_solar_power
      move_slider 247, -30       # investment_costs_earth_geothermal_electricity
      move_slider 132, 0       # om_costs_earth_geothermal_electricity
      move_slider 137, 100       # costs_co2
      move_slider 138, 0       # costs_co2_free_allocation
      move_slider 139, -5       # om_costs_co2_ccs
      move_slider 140, -10       # investment_costs_co2_ccs
      move_slider 250, 0       # number_of_pulverized_coal
      move_slider 251, 0       # number_of_pulverized_coal_ccs
      move_slider 253, 0       # number_of_coal_iggc
      move_slider 254, 0.3       # number_of_coal_igcc_ccs
      move_slider 255, 0       # number_of_coal_oxyfuel_ccs
      move_slider 315, 0       # number_of_coal_conventional
      move_slider 316, 0       # number_of_coal_lignite
      move_slider 256, 0       # number_of_gas_conventional
      move_slider 257, 1       # number_of_gas_ccgt
      move_slider 416, 0       # number_of_gas_ccgt_ccs
      move_slider 258, 0       # number_of_oil_fired_plant
      move_slider 259, 0       # number_of_nuclear_3rd_gen
      move_slider 413, 0       # number_of_nuclear_conventional
      move_slider 488, 25       # green_gas_total_share
      move_slider 489, 75       # natural_gas_total_share
      move_slider 261, 0       # number_of_co_firing_coal
      move_slider 262, 0       # not found
      move_slider 263, 2000       # number_of_wind_onshore_land
      move_slider 264, 1000       # number_of_wind_onshore_coast
      move_slider 265, 4000       # number_of_wind_offshore
      move_slider 266, 4       # number_of_hydro_river
      move_slider 268, 1       # not found
      move_slider 270, 0       # number_of_geothermal_electric
      move_slider 298, 100       # number_of_solar_pv_plants
      move_slider 299, 0       # number_of_concentrated_solar_power
      move_slider 271, 10       # number_of_waste_incinerator
      move_slider 292, 85       # transport_diesel_share
      move_slider 293, 15       # transport_biodiesel_share
      move_slider 294, 85       # transport_gasoline_share
      move_slider 295, 15       # transport_bio_ethanol_share
      move_slider 296, 75       # not found
      move_slider 297, 25       # not found
      move_slider 441, 7.5       # households_heating_gas_fired_heater_share
      move_slider 446, 49.400000000000006       # households_hot_water_gas_fired_heater_share
      move_slider 420, 15.0       # households_hot_water_heat_pump_ground_share
      move_slider 444, 1.0       # households_hot_water_biomass_heater_share
      move_slider 445, 25.0       # households_hot_water_micro_chp_share
      move_slider 421, 1.0       # households_hot_water_heat_network_share
      move_slider 439, 0.0       # households_hot_water_fuel_cell_share
      move_slider 435, 1.0       # households_hot_water_oil_fired_heater_share
      move_slider 443, 0.1       # households_hot_water_coal_fired_heater_hotwater_share
      move_slider 351, 10.0       # households_cooling_heat_pump_ground_share
      move_slider 374, 20.0       # households_cooling_heat_pump_with_ts_share
      move_slider 352, 5.0       # households_cooling_gas_fired_heat_pump_share
      move_slider 353, 65.0       # households_cooling_airconditioning_share
      move_slider 436, 0.0       # households_cooking_biomass_share
      move_slider 392, 40.0       # buildings_cooling_heat_pump_with_ts_share
      move_slider 391, 10.0       # buildings_cooling_gas_fired_heat_pump_share
      move_slider 393, 50.0       # buildings_cooling_airconditioning_share
      move_slider 551, 0.0       # number_of_central_coal_chp
      move_slider 277, 0.0       # number_of_decentral_coal_chp_fixed
      move_slider 276, 0.0       # number_of_large_gas_chp
      move_slider 275, 3556.7       # number_of_small_chp_fixed
      move_slider 274, 743406.8       # number_of_micro_chp_fixed
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
      the_future.should  be_within(1.852, some_tolerance)
      the_relative_increase.should be_within(725.2, some_tolerance)
      the_absolute_increase.should be_within(1.6, some_tolerance)
    end


      
    it "dashboard_employment" do
      the_present.should be_within(29409.913, some_tolerance)
      the_future.should  be_within(63269.864, some_tolerance)
      the_relative_increase.should be_within(115.1, some_tolerance)
      the_absolute_increase.should be_within(33860.0, some_tolerance)
    end


      
    it "dashboard_energy_demand_primary_of_final" do
      the_present.should be_within(3461730879704.038, some_tolerance)
      the_future.should  be_within(3146939086158.544, some_tolerance)
      the_relative_increase.should be_within(-9.1, some_tolerance)
      the_absolute_increase.should be_within(-314791793545.5, some_tolerance)
    end


      
    it "dashboard_energy_import_netto" do
      the_present.should be_within(0.294, some_tolerance)
      the_future.should  be_within(0.878, some_tolerance)
      the_relative_increase.should be_within(198.8, some_tolerance)
      the_absolute_increase.should be_within(0.6, some_tolerance)
    end


      
    it "dashboard_reduction_of_co2_emissions_versus_1990" do
      the_present.should be_within(0.084, some_tolerance)
      the_future.should  be_within(-0.476, some_tolerance)
      the_relative_increase.should be_within(-664.0, some_tolerance)
      the_absolute_increase.should be_within(-0.6, some_tolerance)
    end


      
    it "dashboard_renewability" do
      the_present.should be_within(0.033, some_tolerance)
      the_future.should  be_within(0.402, some_tolerance)
      the_relative_increase.should be_within(1135.5, some_tolerance)
      the_absolute_increase.should be_within(0.4, some_tolerance)
    end


      
    it "dashboard_security_of_supply" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(1.0, some_tolerance)
      the_relative_increase.should be_within(234448299.1, some_tolerance)
      the_absolute_increase.should be_within(1.0, some_tolerance)
    end


      
    it "dashboard_share_of_renewable_electricity" do
      the_present.should be_within(0.098, some_tolerance)
      the_future.should  be_within(0.866, some_tolerance)
      the_relative_increase.should be_within(785.8, some_tolerance)
      the_absolute_increase.should be_within(0.8, some_tolerance)
    end


      
    it "dashboard_total_costs" do
      the_present.should be_within(48.437, some_tolerance)
      the_future.should  be_within(90.921, some_tolerance)
      the_relative_increase.should be_within(87.7, some_tolerance)
      the_absolute_increase.should be_within(42.5, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_agriculture" do
      the_present.should be_within(2109325263.244, some_tolerance)
      the_future.should  be_within(2955919305.828, some_tolerance)
      the_relative_increase.should be_within(40.1, some_tolerance)
      the_absolute_increase.should be_within(846594042.6, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_buildings" do
      the_present.should be_within(5346359830.651, some_tolerance)
      the_future.should  be_within(4085397870.881, some_tolerance)
      the_relative_increase.should be_within(-23.6, some_tolerance)
      the_absolute_increase.should be_within(-1260961959.8, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_households" do
      the_present.should be_within(7813038899.502, some_tolerance)
      the_future.should  be_within(7180510485.795, some_tolerance)
      the_relative_increase.should be_within(-8.1, some_tolerance)
      the_absolute_increase.should be_within(-632528413.7, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_industry_and_energy" do
      the_present.should be_within(23647581507.799, some_tolerance)
      the_future.should  be_within(61121560267.618, some_tolerance)
      the_relative_increase.should be_within(158.5, some_tolerance)
      the_absolute_increase.should be_within(37473978759.8, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_other" do
      the_present.should be_within(1444370733.371, some_tolerance)
      the_future.should  be_within(2877010509.407, some_tolerance)
      the_relative_increase.should be_within(99.2, some_tolerance)
      the_absolute_increase.should be_within(1432639776.0, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_transport" do
      the_present.should be_within(8076663885.401, some_tolerance)
      the_future.should  be_within(12700978446.074, some_tolerance)
      the_relative_increase.should be_within(57.3, some_tolerance)
      the_absolute_increase.should be_within(4624314560.7, some_tolerance)
    end


      
    it "dashboard_total_costs_per_household" do
      the_present.should be_within(6590.563, some_tolerance)
      the_future.should  be_within(12371.097, some_tolerance)
      the_relative_increase.should be_within(87.7, some_tolerance)
      the_absolute_increase.should be_within(5780.5, some_tolerance)
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
      the_future.should  be_within(3547.056, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(3547.1, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_combined_network_gas" do
      the_present.should be_within(6036264.993, some_tolerance)
      the_future.should  be_within(2381238.0, some_tolerance)
      the_relative_increase.should be_within(-60.6, some_tolerance)
      the_absolute_increase.should be_within(-3655027.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_crude_oil" do
      the_present.should be_within(91365.959, some_tolerance)
      the_future.should  be_within(73495.0, some_tolerance)
      the_relative_increase.should be_within(-19.6, some_tolerance)
      the_absolute_increase.should be_within(-17871.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_district_heating_steam_hot_water" do
      the_present.should be_within(100978.019, some_tolerance)
      the_future.should  be_within(34517.284, some_tolerance)
      the_relative_increase.should be_within(-65.8, some_tolerance)
      the_absolute_increase.should be_within(-66460.7, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_electricity" do
      the_present.should be_within(129397.747, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-129397.7, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_heatpump_air_water_network_gas" do
      the_present.should be_within(0.712, some_tolerance)
      the_future.should  be_within(1182.352, some_tolerance)
      the_relative_increase.should be_within(165925.0, some_tolerance)
      the_absolute_increase.should be_within(1181.6, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_heatpump_ground_water_electricity" do
      the_present.should be_within(5506.287, some_tolerance)
      the_future.should  be_within(734950.0, some_tolerance)
      the_relative_increase.should be_within(13247.5, some_tolerance)
      the_absolute_increase.should be_within(729443.7, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_micro_chp_network_gas" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(1837375.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(1837375.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_network_gas" do
      the_present.should be_within(670698.346, some_tolerance)
      the_future.should  be_within(551212.5, some_tolerance)
      the_relative_increase.should be_within(-17.8, some_tolerance)
      the_absolute_increase.should be_within(-119485.8, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_wood_pellets" do
      the_present.should be_within(187980.942, some_tolerance)
      the_future.should  be_within(73495.0, some_tolerance)
      the_relative_increase.should be_within(-60.9, some_tolerance)
      the_absolute_increase.should be_within(-114485.9, some_tolerance)
    end


  end
end