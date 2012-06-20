require 'spec_helper'

describe "untitled" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2030, use_fce: false) do
      move_slider 198, -53.5       # policy_sustainability_co2_emissions
      move_slider 203, 1.8       # households_electricity_demand_per_person
      move_slider 205, -1.5       # industry_non_energetic_oil_demand
      move_slider 169, 1.9       # industry_efficiency_electricity
      move_slider 170, 2.1       # industry_heat_from_fuels
      move_slider 216, 13.0       # industry_heating_gas_fired_heater_share
      move_slider 219, 34.3       # industry_heating_biomass_fired_heater_share
      move_slider 217, 0.0       # industry_heating_oil_fired_heater_share
      move_slider 326, 51.9       # industry_heating_combined_heat_power_share
      move_slider 218, 0.8       # industry_heating_coal_fired_heater_share
      move_slider 141, 1.0       # transport_cars
      move_slider 142, 1.4       # transport_trucks
      move_slider 143, 0.5       # transport_trains
      move_slider 145, 2.2       # transport_inland_navigation
      move_slider 146, 14.8       # transport_cars_electric_share
      move_slider 147, 66.7       # transport_cars_diesel_share
      move_slider 148, 14.8       # transport_cars_gasoline_share
      move_slider 238, 3.7       # transport_cars_lpg_share
      move_slider 239, 0.0       # transport_cars_compressed_gas_share
      move_slider 328, 1.6       # transport_efficiency_combustion_engine_trucks
      move_slider 186, 1.6       # transport_efficiency_combustion_engine_cars
      move_slider 187, 1.7       # transport_efficiency_ships
      move_slider 188, 1.2       # transport_efficiency_airplanes
      move_slider 376, -1.1       # buildings_number_of_buildings
      move_slider 377, -2.0       # buildings_electricity_per_student_employee
      move_slider 378, -1.0       # buildings_heat_per_employee_student
      move_slider 408, -1.2       # buildings_cooling_per_student_employee
      move_slider 398, 1.5       # buildings_appliances_efficiency
      move_slider 405, 25.0       # buildings_market_penetration_solar_panels
      move_slider 400, 8.4       # buildings_lighting_fluorescent_tube_conventional_share
      move_slider 402, 67.6       # buildings_lighting_led_tube_share
      move_slider 403, 34.3       # buildings_lighting_motion_detection
      move_slider 404, 38.0       # buildings_lighting_daylight_dependent_control
      move_slider 11, 45.0       # costs_oil
      move_slider 57, 20.0       # costs_coal
      move_slider 59, -10.0       # costs_biomass
      move_slider 17, -39.0       # investment_costs_combustion_oil_plant
      move_slider 259, 2.8       # number_of_nuclear_3rd_gen
      move_slider 551, 0.0       # number_of_central_coal_chp
      move_slider 250, 0.0       # number_of_pulverized_coal
      move_slider 256, 0.0       # number_of_gas_conventional
      move_slider 257, 4.6       # number_of_gas_ccgt
      move_slider 298, 0.0       # number_of_solar_pv_plants
      move_slider 261, 2.0       # number_of_co_firing_coal
      move_slider 271, 9.5       # number_of_waste_incinerator
      move_slider 292, 90.0       # transport_diesel_share
      move_slider 293, 10.0       # transport_biodiesel_share
      move_slider 294, 90.0       # transport_gasoline_share
      move_slider 295, 10.0       # transport_bio_ethanol_share
      move_slider 423, 97.5       # transport_planes_fossil_fuel_share
      move_slider 424, 2.5       # transport_planes_bio_ethanol_share
      move_slider 425, 85.2       # transport_ships_diesel_share
      move_slider 426, 14.8       # transport_ships_bio_diesel_share
      move_slider 489, 91.7       # natural_gas_total_share
      move_slider 488, 8.3       # green_gas_total_share
      move_slider 333, 40.9       # households_heating_gas_combi_heater_share
      move_slider 51, 5.6       # households_heating_micro_chp_share
      move_slider 582, 10.2       # households_heating_district_heating_network_share
      move_slider 48, 2.5       # households_heating_solar_thermal_panels_share
      move_slider 340, 11.1       # households_heating_pellet_stove_share
      move_slider 47, 9.4       # households_market_penetration_solar_panels
      move_slider 375, 17.4       # households_heating_heat_pump_with_ts_share
      move_slider 208, 34.0       # policy_cost_total_energy_cost
      move_slider 183, -39.0       # om_costs_combustion_biomass_plant
      move_slider 232, -50.0       # om_costs_combustion_waste_incinerator
      move_slider 185, -30.0       # costs_uranium
      move_slider 136, -17.0       # investment_costs_nuclear_nuclear_plant
      move_slider 58, 35.0       # costs_gas
      move_slider 133, -56.0       # investment_costs_solar_solar_panels
      move_slider 247, -4.0       # investment_costs_earth_geothermal_electricity
      move_slider 14, 33.0       # investment_costs_wind_offshore
      move_slider 234, 40.5       # policy_sustainability_renewable_percentage
      move_slider 336, 1.0       # households_insulation_level_old_houses
      move_slider 359, 24.4       # households_efficiency_dish_washer
      move_slider 6, 28.0       # households_efficiency_fridge_freezer
      move_slider 361, 19.4       # households_efficiency_washing_machine
      move_slider 362, 15.5       # households_efficiency_dryer
      move_slider 245, 80.0       # households_lighting_incandescent_share
      move_slider 43, 10.7       # households_lighting_low_energy_light_bulb_share
      move_slider 44, 9.3       # households_lighting_light_emitting_diode_share
      move_slider 370, 0.0       # households_behavior_close_windows_turn_off_heating
      move_slider 371, 0.0       # households_efficiency_low_temperature_washing
      move_slider 246, 20.3       # agriculture_heating_gas_fired_heater_share
      move_slider 228, 21.3       # agriculture_heating_geothermal_share
      move_slider 223, 0.0       # agriculture_heating_oil_fired_heater_share
    end
  end

  after :all do
    print_comparison('localhost') if ENV["LOCALHOST"]
    print_comparison('beta') if ENV["BETA"]
  end

  describe "gqueries" do
      
    it "dashboard_bio_footprint" do
      the_present.should be_within(0.224, some_tolerance)
      the_future.should  be_within(1.564, some_tolerance)
      the_relative_increase.should be_within(596.9, some_tolerance)
      the_absolute_increase.should be_within(1.3, some_tolerance)
    end


      
    it "dashboard_employment" do
      the_present.should be_within(29409.913, some_tolerance)
      the_future.should  be_within(37110.413, some_tolerance)
      the_relative_increase.should be_within(26.2, some_tolerance)
      the_absolute_increase.should be_within(7700.5, some_tolerance)
    end


      
    it "dashboard_energy_demand_primary_of_final" do
      the_present.should be_within(3461730879704.038, some_tolerance)
      the_future.should  be_within(2690293324864.722, some_tolerance)
      the_relative_increase.should be_within(-22.3, some_tolerance)
      the_absolute_increase.should be_within(-771437554839.3, some_tolerance)
    end


      
    it "dashboard_energy_import_netto" do
      the_present.should be_within(0.294, some_tolerance)
      the_future.should  be_within(0.76, some_tolerance)
      the_relative_increase.should be_within(158.6, some_tolerance)
      the_absolute_increase.should be_within(0.5, some_tolerance)
    end


      
    it "dashboard_reduction_of_co2_emissions_versus_1990" do
      the_present.should be_within(0.084, some_tolerance)
      the_future.should  be_within(-0.417, some_tolerance)
      the_relative_increase.should be_within(-593.6, some_tolerance)
      the_absolute_increase.should be_within(-0.5, some_tolerance)
    end


      
    it "dashboard_renewability" do
      the_present.should be_within(0.033, some_tolerance)
      the_future.should  be_within(0.254, some_tolerance)
      the_relative_increase.should be_within(679.1, some_tolerance)
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
      the_future.should  be_within(0.337, some_tolerance)
      the_relative_increase.should be_within(244.4, some_tolerance)
      the_absolute_increase.should be_within(0.2, some_tolerance)
    end


      
    it "dashboard_total_costs" do
      the_present.should be_within(48.437, some_tolerance)
      the_future.should  be_within(48.35, some_tolerance)
      the_relative_increase.should be_within(-0.2, some_tolerance)
      the_absolute_increase.should be_within(-0.1, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_agriculture" do
      the_present.should be_within(2109325263.244, some_tolerance)
      the_future.should  be_within(2234579099.296, some_tolerance)
      the_relative_increase.should be_within(5.9, some_tolerance)
      the_absolute_increase.should be_within(125253836.1, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_buildings" do
      the_present.should be_within(5346359830.651, some_tolerance)
      the_future.should  be_within(3368323184.35, some_tolerance)
      the_relative_increase.should be_within(-37.0, some_tolerance)
      the_absolute_increase.should be_within(-1978036646.3, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_households" do
      the_present.should be_within(7813038899.502, some_tolerance)
      the_future.should  be_within(9777290301.725, some_tolerance)
      the_relative_increase.should be_within(25.1, some_tolerance)
      the_absolute_increase.should be_within(1964251402.2, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_industry_and_energy" do
      the_present.should be_within(23647581507.799, some_tolerance)
      the_future.should  be_within(22348487837.759, some_tolerance)
      the_relative_increase.should be_within(-5.5, some_tolerance)
      the_absolute_increase.should be_within(-1299093670.0, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_other" do
      the_present.should be_within(1444370733.371, some_tolerance)
      the_future.should  be_within(1876028423.735, some_tolerance)
      the_relative_increase.should be_within(29.9, some_tolerance)
      the_absolute_increase.should be_within(431657690.4, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_transport" do
      the_present.should be_within(8076663885.401, some_tolerance)
      the_future.should  be_within(8745445809.594, some_tolerance)
      the_relative_increase.should be_within(8.3, some_tolerance)
      the_absolute_increase.should be_within(668781924.2, some_tolerance)
    end


      
    it "dashboard_total_costs_per_household" do
      the_present.should be_within(6590.563, some_tolerance)
      the_future.should  be_within(6578.7, some_tolerance)
      the_relative_increase.should be_within(-0.2, some_tolerance)
      the_absolute_increase.should be_within(-11.9, some_tolerance)
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
      the_future.should  be_within(4114.585, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(4114.6, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_combined_network_gas" do
      the_present.should be_within(6036264.993, some_tolerance)
      the_future.should  be_within(3191955.956, some_tolerance)
      the_relative_increase.should be_within(-47.1, some_tolerance)
      the_absolute_increase.should be_within(-2844309.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_crude_oil" do
      the_present.should be_within(91365.959, some_tolerance)
      the_future.should  be_within(91365.959, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_district_heating_steam_hot_water" do
      the_present.should be_within(100978.019, some_tolerance)
      the_future.should  be_within(338635.463, some_tolerance)
      the_relative_increase.should be_within(235.4, some_tolerance)
      the_absolute_increase.should be_within(237657.4, some_tolerance)
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
      the_future.should  be_within(5506.287, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_micro_chp_network_gas" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(411572.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(411572.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_network_gas" do
      the_present.should be_within(670698.346, some_tolerance)
      the_future.should  be_within(670698.346, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_wood_pellets" do
      the_present.should be_within(187980.942, some_tolerance)
      the_future.should  be_within(815794.5, some_tolerance)
      the_relative_increase.should be_within(334.0, some_tolerance)
      the_absolute_increase.should be_within(627813.6, some_tolerance)
    end


  end
end