require 'spec_helper'

describe "untitled" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2030, use_fce: false) do
      move_slider 198, -35.0       # policy_sustainability_co2_emissions
      move_slider 47, 100.0       # households_market_penetration_solar_panels
      move_slider 405, 100.0       # buildings_market_penetration_solar_panels
      move_slider 263, 10000.0       # number_of_wind_onshore_land
      move_slider 264, 100.0       # number_of_wind_onshore_coast
      move_slider 265, 18335.0       # number_of_wind_offshore
      move_slider 250, 0.0       # number_of_pulverized_coal
      move_slider 253, 0.0       # number_of_coal_iggc
      move_slider 551, 0.0       # number_of_central_coal_chp
      move_slider 256, 0.0       # number_of_gas_conventional
      move_slider 261, 0.0       # number_of_co_firing_coal
      move_slider 489, 75.0       # natural_gas_total_share
      move_slider 488, 25.0       # green_gas_total_share
      move_slider 298, 10.0       # number_of_solar_pv_plants
      move_slider 146, 90.0       # transport_cars_electric_share
      move_slider 147, 5.0       # transport_cars_diesel_share
      move_slider 148, 5.0       # transport_cars_gasoline_share
      move_slider 238, 0.0       # transport_cars_lpg_share
      move_slider 239, 0.0       # transport_cars_compressed_gas_share
      move_slider 159, 90.0       # transport_trucks_electric_share
      move_slider 158, 10.0       # transport_trucks_diesel_share
      move_slider 208, 44.0       # policy_cost_total_energy_cost
      move_slider 58, 100.0       # costs_gas
      move_slider 11, 100.0       # costs_oil
      move_slider 57, 100.0       # costs_coal
      move_slider 12, -30.0       # investment_costs_wind_onshore
      move_slider 14, -30.0       # investment_costs_wind_offshore
      move_slider 126, 10.0       # om_costs_wind_onshore
      move_slider 127, 10.0       # om_costs_wind_offshore
      move_slider 133, -75.0       # investment_costs_solar_solar_panels
      move_slider 185, 100.0       # costs_uranium
      move_slider 259, 0.0       # number_of_nuclear_3rd_gen
      move_slider 234, 50.0       # policy_sustainability_renewable_percentage
      move_slider 216, 13.1       # industry_heating_gas_fired_heater_share
      move_slider 219, 25.0       # industry_heating_biomass_fired_heater_share
      move_slider 169, 1.0       # industry_efficiency_electricity
      move_slider 170, 1.0       # industry_heat_from_fuels
      move_slider 336, 1.4       # households_insulation_level_old_houses
      move_slider 337, 6.0       # households_insulation_level_new_houses
      move_slider 333, 0.0       # households_heating_gas_combi_heater_share
      move_slider 48, 15.0       # households_heating_solar_thermal_panels_share
      move_slider 339, 28.9       # households_heating_heat_pump_add_on_share
      move_slider 338, 0.0       # households_heating_heat_pump_ground_share
      move_slider 582, 0.0       # households_heating_district_heating_network_share
      move_slider 375, 48.1       # households_heating_heat_pump_with_ts_share
      move_slider 340, 0.0       # households_heating_pellet_stove_share
      move_slider 52, 0.0       # households_heating_electric_heater_share
      move_slider 441, 6.7       # households_heating_gas_fired_heater_share
    end
  end

  after :all do
    print_comparison('localhost') if ENV["LOCALHOST"]
    print_comparison('beta') if ENV["BETA"]
  end

  describe "gqueries" do
      
    it "dashboard_bio_footprint" do
      the_present.should be_within(0.224, some_tolerance)
      the_future.should  be_within(1.41, some_tolerance)
      the_relative_increase.should be_within(528.1, some_tolerance)
      the_absolute_increase.should be_within(1.2, some_tolerance)
    end


      
    it "dashboard_employment" do
      the_present.should be_within(29409.913, some_tolerance)
      the_future.should  be_within(95977.479, some_tolerance)
      the_relative_increase.should be_within(226.3, some_tolerance)
      the_absolute_increase.should be_within(66567.6, some_tolerance)
    end


      
    it "dashboard_energy_demand_primary_of_final" do
      the_present.should be_within(3461730879704.038, some_tolerance)
      the_future.should  be_within(2572273382600.124, some_tolerance)
      the_relative_increase.should be_within(-25.7, some_tolerance)
      the_absolute_increase.should be_within(-889457497103.9, some_tolerance)
    end


      
    it "dashboard_energy_import_netto" do
      the_present.should be_within(0.294, some_tolerance)
      the_future.should  be_within(0.367, some_tolerance)
      the_relative_increase.should be_within(24.8, some_tolerance)
      the_absolute_increase.should be_within(0.1, some_tolerance)
    end


      
    it "dashboard_reduction_of_co2_emissions_versus_1990" do
      the_present.should be_within(0.084, some_tolerance)
      the_future.should  be_within(-0.574, some_tolerance)
      the_relative_increase.should be_within(-780.0, some_tolerance)
      the_absolute_increase.should be_within(-0.7, some_tolerance)
    end


      
    it "dashboard_renewability" do
      the_present.should be_within(0.033, some_tolerance)
      the_future.should  be_within(0.474, some_tolerance)
      the_relative_increase.should be_within(1356.9, some_tolerance)
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
      the_future.should  be_within(2.158, some_tolerance)
      the_relative_increase.should be_within(2106.9, some_tolerance)
      the_absolute_increase.should be_within(2.1, some_tolerance)
    end


      
    it "dashboard_total_costs" do
      the_present.should be_within(48.437, some_tolerance)
      the_future.should  be_within(62.169, some_tolerance)
      the_relative_increase.should be_within(28.3, some_tolerance)
      the_absolute_increase.should be_within(13.7, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_agriculture" do
      the_present.should be_within(2109325263.244, some_tolerance)
      the_future.should  be_within(3345647955.747, some_tolerance)
      the_relative_increase.should be_within(58.6, some_tolerance)
      the_absolute_increase.should be_within(1236322692.5, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_buildings" do
      the_present.should be_within(5346359830.651, some_tolerance)
      the_future.should  be_within(8479980849.703, some_tolerance)
      the_relative_increase.should be_within(58.6, some_tolerance)
      the_absolute_increase.should be_within(3133621019.1, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_households" do
      the_present.should be_within(7813038899.502, some_tolerance)
      the_future.should  be_within(7745239320.262, some_tolerance)
      the_relative_increase.should be_within(-0.9, some_tolerance)
      the_absolute_increase.should be_within(-67799579.2, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_industry_and_energy" do
      the_present.should be_within(23647581507.799, some_tolerance)
      the_future.should  be_within(34941623527.099, some_tolerance)
      the_relative_increase.should be_within(47.8, some_tolerance)
      the_absolute_increase.should be_within(11294042019.3, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_other" do
      the_present.should be_within(1444370733.371, some_tolerance)
      the_future.should  be_within(2290948710.305, some_tolerance)
      the_relative_increase.should be_within(58.6, some_tolerance)
      the_absolute_increase.should be_within(846577976.9, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_transport" do
      the_present.should be_within(8076663885.401, some_tolerance)
      the_future.should  be_within(5365506187.766, some_tolerance)
      the_relative_increase.should be_within(-33.6, some_tolerance)
      the_absolute_increase.should be_within(-2711157697.6, some_tolerance)
    end


      
    it "dashboard_total_costs_per_household" do
      the_present.should be_within(6590.563, some_tolerance)
      the_future.should  be_within(8458.936, some_tolerance)
      the_relative_increase.should be_within(28.3, some_tolerance)
      the_absolute_increase.should be_within(1868.4, some_tolerance)
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
      the_future.should  be_within(11374.226, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(11374.2, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_combined_network_gas" do
      the_present.should be_within(6036264.993, some_tolerance)
      the_future.should  be_within(3225860.836, some_tolerance)
      the_relative_increase.should be_within(-46.6, some_tolerance)
      the_absolute_increase.should be_within(-2810404.2, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_crude_oil" do
      the_present.should be_within(91365.959, some_tolerance)
      the_future.should  be_within(91365.959, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
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
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-5506.3, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_micro_chp_network_gas" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_network_gas" do
      the_present.should be_within(670698.346, some_tolerance)
      the_future.should  be_within(492416.5, some_tolerance)
      the_relative_increase.should be_within(-26.6, some_tolerance)
      the_absolute_increase.should be_within(-178281.8, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_wood_pellets" do
      the_present.should be_within(187980.942, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-187980.9, some_tolerance)
    end


  end
end