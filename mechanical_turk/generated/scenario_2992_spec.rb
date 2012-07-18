require 'spec_helper'

describe "untitled" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2020, use_fce: false) do
    end
  end

  after :all do
    print_comparison('localhost') if ENV["LOCALHOST"]
    print_comparison('beta') if ENV["BETA"]
  end

  describe "gqueries" do
      
    it "dashboard_bio_footprint" do
      the_present.should be_within(0.224, some_tolerance)
      the_future.should  be_within(0.071, some_tolerance)
      the_relative_increase.should be_within(-68.5, some_tolerance)
      the_absolute_increase.should be_within(-0.2, some_tolerance)
    end


      
    it "dashboard_employment" do
      the_present.should be_within(25359.697, some_tolerance)
      the_future.should  be_within(25359.697, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "dashboard_energy_demand_primary_of_final" do
      the_present.should be_within(3452294571562.741, some_tolerance)
      the_future.should  be_within(3452294571562.74, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "dashboard_energy_import_netto" do
      the_present.should be_within(0.293, some_tolerance)
      the_future.should  be_within(0.533, some_tolerance)
      the_relative_increase.should be_within(82.0, some_tolerance)
      the_absolute_increase.should be_within(0.2, some_tolerance)
    end


      
    it "dashboard_reduction_of_co2_emissions_versus_1990" do
      the_present.should be_within(0.08, some_tolerance)
      the_future.should  be_within(0.08, some_tolerance)
      the_relative_increase.should be_within(-0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "dashboard_renewability" do
      the_present.should be_within(0.036, some_tolerance)
      the_future.should  be_within(0.036, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "dashboard_security_of_supply" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "dashboard_share_of_renewable_electricity" do
      the_present.should be_within(0.099, some_tolerance)
      the_future.should  be_within(0.099, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "dashboard_total_costs" do
      the_present.should be_within(45.38, some_tolerance)
      the_future.should  be_within(45.38, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_agriculture" do
      the_present.should be_within(1976189182.828, some_tolerance)
      the_future.should  be_within(1976189156.019, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(-26.8, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_buildings" do
      the_present.should be_within(5008909080.522, some_tolerance)
      the_future.should  be_within(5008909012.57, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(-68.0, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_households" do
      the_present.should be_within(7319896664.236, some_tolerance)
      the_future.should  be_within(7319896564.932, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(-99.3, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_industry_and_energy" do
      the_present.should be_within(22154996950.959, some_tolerance)
      the_future.should  be_within(22154996650.399, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(-300.6, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_other" do
      the_present.should be_within(1353205154.757, some_tolerance)
      the_future.should  be_within(1353205136.399, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(-18.4, some_tolerance)
    end


      
    it "dashboard_total_costs_assigned_to_transport" do
      the_present.should be_within(7566882207.213, some_tolerance)
      the_future.should  be_within(7566882104.559, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(-102.7, some_tolerance)
    end


      
    it "dashboard_total_costs_per_household" do
      the_present.should be_within(6174.58, some_tolerance)
      the_future.should  be_within(6174.58, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
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
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_combined_network_gas" do
      the_present.should be_within(6036264.993, some_tolerance)
      the_future.should  be_within(6036264.993, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_crude_oil" do
      the_present.should be_within(91365.959, some_tolerance)
      the_future.should  be_within(91365.959, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_district_heating_steam_hot_water" do
      the_present.should be_within(100978.019, some_tolerance)
      the_future.should  be_within(100978.019, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_electricity" do
      the_present.should be_within(129397.747, some_tolerance)
      the_future.should  be_within(129397.747, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_heatpump_air_water_network_gas" do
      the_present.should be_within(0.285, some_tolerance)
      the_future.should  be_within(0.285, some_tolerance)
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
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_network_gas" do
      the_present.should be_within(670698.346, some_tolerance)
      the_future.should  be_within(670698.346, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "turk_number_of_households_space_heater_wood_pellets" do
      the_present.should be_within(187980.942, some_tolerance)
      the_future.should  be_within(187980.942, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


  end
end