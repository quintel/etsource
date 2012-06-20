require 'spec_helper'

describe "untitled" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2030, use_fce: false) do
      move_slider 198, -35.0       # policy_sustainability_co2_emissions
      move_slider 335, 0.5       # households_number_of_inhabitants
      move_slider 336, 1.5       # households_insulation_level_old_houses
      move_slider 337, 4.0       # households_insulation_level_new_houses
      move_slider 1, 1.0       # households_replacement_of_existing_houses
      move_slider 333, 0.0       # households_heating_gas_combi_heater_share
      move_slider 51, 0.0       # households_heating_micro_chp_share
      move_slider 338, 4.8       # households_heating_heat_pump_ground_share
      move_slider 47, 60.0       # households_market_penetration_solar_panels
      move_slider 245, 25.0       # households_lighting_incandescent_share
      move_slider 43, 20.4       # households_lighting_low_energy_light_bulb_share
      move_slider 44, 54.6       # households_lighting_light_emitting_diode_share
      move_slider 348, 10.0       # households_hot_water_solar_water_heater_share
      move_slider 351, 90.7       # households_cooling_heat_pump_ground_share
      move_slider 353, 9.3       # households_cooling_airconditioning_share
      move_slider 361, 33.6       # households_efficiency_washing_machine
      move_slider 6, 96.0       # households_efficiency_fridge_freezer
      move_slider 359, 25.6       # households_efficiency_dish_washer
      move_slider 366, 49.1       # households_behavior_standby_killer_turn_off_appliances
      move_slider 368, 80.6       # households_behavior_turn_off_the_light
      move_slider 370, 25.9       # households_behavior_close_windows_turn_off_heating
      move_slider 371, 75.0       # households_efficiency_low_temperature_washing
      move_slider 381, 2.0       # buildings_insulation_level
      move_slider 382, 4.0       # not found
      move_slider 392, 36.1       # buildings_cooling_heat_pump_with_ts_share
      move_slider 393, 38.9       # buildings_cooling_airconditioning_share
      move_slider 400, 0.0       # buildings_lighting_fluorescent_tube_conventional_share
      move_slider 401, 0.0       # buildings_lighting_fluorescent_tube_high_performance_share
      move_slider 402, 100.0       # buildings_lighting_led_tube_share
      move_slider 405, 50.0       # buildings_market_penetration_solar_panels
      move_slider 391, 25.0       # buildings_cooling_gas_fired_heat_pump_share
      move_slider 403, 69.4       # buildings_lighting_motion_detection
      move_slider 404, 100.0       # buildings_lighting_daylight_dependent_control
      move_slider 377, 0.0       # buildings_electricity_per_student_employee
      move_slider 398, 3.0       # buildings_appliances_efficiency
      move_slider 376, -2.0       # buildings_number_of_buildings
      move_slider 141, -3.0       # transport_cars
      move_slider 142, -1.0       # transport_trucks
      move_slider 143, 3.0       # transport_trains
      move_slider 144, -5.0       # transport_domestic_flights
      move_slider 146, 30.0       # transport_cars_electric_share
      move_slider 147, 0.0       # transport_cars_diesel_share
      move_slider 148, 35.4       # transport_cars_gasoline_share
      move_slider 239, 30.0       # transport_cars_compressed_gas_share
      move_slider 489, 92.0       # natural_gas_total_share
      move_slider 488, 8.0       # green_gas_total_share
      move_slider 186, 3.0       # transport_efficiency_combustion_engine_cars
      move_slider 171, 3.0       # transport_efficiency_electric_vehicles
      move_slider 328, 3.0       # transport_efficiency_combustion_engine_trucks
      move_slider 188, 3.0       # transport_efficiency_airplanes
      move_slider 246, 0.0       # agriculture_heating_gas_fired_heater_share
      move_slider 223, 8.2       # agriculture_heating_oil_fired_heater_share
      move_slider 327, 90.7       # agriculture_heating_combined_heat_power_share
      move_slider 220, -3.0       # agriculture_electricity_demand
      move_slider 221, -3.0       # agriculture_heat_demand
      move_slider 169, 2.0       # industry_efficiency_electricity
      move_slider 170, 2.0       # industry_heat_from_fuels
      move_slider 322, 91.8       # industry_number_of_gas_chp
      move_slider 324, 78.5       # industry_number_of_biomass_chp
      move_slider 265, 4074.4       # number_of_wind_offshore
      move_slider 264, 271.4       # number_of_wind_onshore_coast
      move_slider 263, 1000.0       # number_of_wind_onshore_land
      move_slider 298, 2.0       # number_of_solar_pv_plants
      move_slider 271, 8.0       # number_of_waste_incinerator
      move_slider 259, 0.0       # number_of_nuclear_3rd_gen
      move_slider 416, 1.0       # number_of_gas_ccgt_ccs
      move_slider 254, 2.0       # number_of_coal_igcc_ccs
      move_slider 250, 0.0       # number_of_pulverized_coal
      move_slider 292, 67.6       # transport_diesel_share
      move_slider 293, 32.4       # transport_biodiesel_share
      move_slider 560, 84.3       # share_coal_co_firing_coal
      move_slider 559, 15.7       # share_biocoal_co_firing_coal
      move_slider 208, 44.0       # policy_cost_total_energy_cost
      move_slider 11, 50.0       # costs_oil
      move_slider 58, 20.0       # costs_gas
      move_slider 133, -50.0       # investment_costs_solar_solar_panels
      move_slider 137, 1000.0       # costs_co2
      move_slider 138, 40.0       # costs_co2_free_allocation
      move_slider 121, 20.0       # om_costs_nuclear_nuclear_plant
      move_slider 234, 50.0       # policy_sustainability_renewable_percentage
      move_slider 256, 1.0       # number_of_gas_conventional
      move_slider 583, 0.0       # number_of_gas_turbines
      move_slider 257, 3.0       # number_of_gas_ccgt
      move_slider 325, 2071.7       # agriculture_number_of_small_gas_chp
      move_slider 205, -1.0       # industry_non_energetic_oil_demand
      move_slider 216, 41.0       # industry_heating_gas_fired_heater_share
      move_slider 217, 0.0       # industry_heating_oil_fired_heater_share
      move_slider 219, 17.6       # industry_heating_biomass_fired_heater_share
      move_slider 326, 38.0       # industry_heating_combined_heat_power_share
      move_slider 339, 60.0       # households_heating_heat_pump_add_on_share
      move_slider 582, 0.0       # households_heating_district_heating_network_share
      move_slider 375, 35.2       # households_heating_heat_pump_with_ts_share
      move_slider 340, 0.0       # households_heating_pellet_stove_share
      move_slider 52, 0.0       # households_heating_electric_heater_share
      move_slider 441, 0.0       # households_heating_gas_fired_heater_share
      move_slider 248, 0.0       # households_heating_oil_fired_heater_share
      move_slider 411, 0.0       # households_heating_coal_fired_heater_share
      move_slider 446, 62.1       # households_hot_water_gas_fired_heater_share
      move_slider 420, 14.8       # households_hot_water_heat_pump_ground_share
      move_slider 383, 25.0       # buildings_heating_gas_fired_heater_share
      move_slider 394, 25.9       # buildings_heating_heat_pump_with_ts_share
      move_slider 390, 49.1       # buildings_heating_gas_fired_heat_pump_share
      move_slider 387, 0.0       # buildings_heating_electric_heater_share
      move_slider 409, 0.0       # buildings_heating_oil_fired_heater_share
      move_slider 386, 0.0       # buildings_heating_small_gas_chp_share
      move_slider 388, 0.0       # buildings_heating_heat_network_share
      move_slider 159, 40.7       # transport_trucks_electric_share
      move_slider 158, 59.3       # transport_trucks_diesel_share
    end
  end

  after :all do
    print_comparison('localhost') if ENV["LOCALHOST"]
    print_comparison('beta') if ENV["BETA"]
  end

  describe "gqueries" do
      
    it "dashboard_bio_footprint" do
      the_present.should be_within(0.224, some_tolerance)
      the_future.should  be_within(1.453, some_tolerance)
      the_relative_increase.should be_within(547.1, some_tolerance)
      the_absolute_increase.should be_within(1.2, some_tolerance)
    end


      
    it "dashboard_employment" do
      the_present.should be_within(29409.913, some_tolerance)
      the_future.should  be_within(74000.212, some_tolerance)
      the_relative_increase.should be_within(151.6, some_tolerance)
      the_absolute_increase.should be_within(44590.3, some_tolerance)
    end


      
    it "dashboard_energy_demand_primary_of_final" do
      the_present.should be_within(3461730879704.038, some_tolerance)
      the_future.should  be_within(2068553975098.416, some_tolerance)
      the_relative_increase.should be_within(-40.2, some_tolerance)
      the_absolute_increase.should be_within(-1393176904605.6, some_tolerance)
    end


      
    it "dashboard_energy_import_netto" do
      the_present.should be_within(0.294, some_tolerance)
      the_future.should  be_within(0.592, some_tolerance)
      the_relative_increase.should be_within(101.6, some_tolerance)
      the_absolute_increase.should be_within(0.3, some_tolerance)
    end


      
    it "dashboard_reduction_of_co2_emissions_versus_1990" do
      the_present.should be_within(0.084, some_tolerance)
      the_future.should  be_within(-0.651, some_tolerance)
      the_relative_increase.should be_within(-871.4, some_tolerance)
      the_absolute_increase.should be_within(-0.7, some_tolerance)
    end


      
    it "dashboard_renewability" do
      the_present.should be_within(0.033, some_tolerance)
      the_future.should  be_within(0.414, some_tolerance)
      the_relative_increase.should be_within(1170.4, some_tolerance)
      the_absolute_increase.should be_within(0.4, some_tolerance)
    end


      
    it "dashboard_security_of_supply" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "dashboard_share_of_renewable_electricity" do
      the_present.should be_within(0.098, some_tolerance)
      the_future.should  be_within(1.321, some_tolerance)
      the_relative_increase.should be_within(1251.5, some_tolerance)
      the_absolute_increase.should be_within(1.2, some_tolerance)
    end


      
    it "dashboard_total_costs" do
      the_present.should be_within(48.437, some_tolerance)
      the_future.should  be_within(41.613, some_tolerance)
      the_relative_increase.should be_within(-14.1, some_tolerance)
      the_absolute_increase.should be_within(-6.8, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_agriculture" do
      the_present.should be_within(2109325263.244, some_tolerance)
      the_future.should  be_within(1556155245.889, some_tolerance)
      the_relative_increase.should be_within(-26.2, some_tolerance)
      the_absolute_increase.should be_within(-553170017.4, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_buildings" do
      the_present.should be_within(5346359830.651, some_tolerance)
      the_future.should  be_within(1992528083.616, some_tolerance)
      the_relative_increase.should be_within(-62.7, some_tolerance)
      the_absolute_increase.should be_within(-3353831747.0, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_households" do
      the_present.should be_within(7813038899.502, some_tolerance)
      the_future.should  be_within(5733062746.95, some_tolerance)
      the_relative_increase.should be_within(-26.6, some_tolerance)
      the_absolute_increase.should be_within(-2079976152.6, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_industry_and_energy" do
      the_present.should be_within(23647581507.799, some_tolerance)
      the_future.should  be_within(26520297329.837, some_tolerance)
      the_relative_increase.should be_within(12.1, some_tolerance)
      the_absolute_increase.should be_within(2872715822.0, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_other" do
      the_present.should be_within(1444370733.371, some_tolerance)
      the_future.should  be_within(2027205858.411, some_tolerance)
      the_relative_increase.should be_within(40.4, some_tolerance)
      the_absolute_increase.should be_within(582835125.0, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_transport" do
      the_present.should be_within(8076663885.401, some_tolerance)
      the_future.should  be_within(3783773429.104, some_tolerance)
      the_relative_increase.should be_within(-53.2, some_tolerance)
      the_absolute_increase.should be_within(-4292890456.3, some_tolerance)
    end


      
    it "dashboard_total_costs_per_household" do
      the_present.should be_within(6590.563, some_tolerance)
      the_future.should  be_within(5662.021, some_tolerance)
      the_relative_increase.should be_within(-14.1, some_tolerance)
      the_absolute_increase.should be_within(-928.5, some_tolerance)
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
      the_future.should  be_within(8323.758, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(8323.8, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_combined_network_gas" do
      the_present.should be_within(6036264.993, some_tolerance)
      the_future.should  be_within(4409478.663, some_tolerance)
      the_relative_increase.should be_within(-27.0, some_tolerance)
      the_absolute_increase.should be_within(-1626786.3, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_crude_oil" do
      the_present.should be_within(91365.959, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-91366.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_district_heating_steam_hot_water" do
      the_present.should be_within(100978.019, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-100978.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_electricity" do
      the_present.should be_within(129397.747, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-129397.7, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_heatpump_air_water_network_gas" do
      the_present.should be_within(0.712, some_tolerance)
      the_future.should  be_within(0.712, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_heatpump_ground_water_electricity" do
      the_present.should be_within(5506.287, some_tolerance)
      the_future.should  be_within(352776.0, some_tolerance)
      the_relative_increase.should be_within(6306.8, some_tolerance)
      the_absolute_increase.should be_within(347269.7, some_tolerance)
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