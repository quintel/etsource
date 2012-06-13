require 'spec_helper'

describe "untitled" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2050, use_fce: false) do
    end
  end

  after :all do
    print_comparison('beta') if ENV["LOCALHOST"]
    print_comparison('beta') if ENV["BETA"]
  end

  describe "gqueries" do
      
    it "dashboard_bio_footprint" do
      the_present.should be_within(0.281, some_tolerance)
      the_future.should  be_within(0.281, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "dashboard_employment" do
      the_present.should be_within(28439.961, some_tolerance)
      the_future.should  be_within(28439.961, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "dashboard_energy_demand_primary_of_final" do
      the_present.should be_within(3459160381069.281, some_tolerance)
      the_future.should  be_within(3459160381069.281, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "dashboard_energy_import_netto" do
      the_present.should be_within(0.293, some_tolerance)
      the_future.should  be_within(0.975, some_tolerance)
      the_relative_increase.should be_within(232.3, some_tolerance)
      the_absolute_increase.should be_within(0.7, some_tolerance)
    end
      
    it "dashboard_reduction_of_co2_emissions_versus_1990" do
      the_present.should be_within(0.089, some_tolerance)
      the_future.should  be_within(0.089, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "dashboard_renewability" do
      the_present.should be_within(0.031, some_tolerance)
      the_future.should  be_within(0.031, some_tolerance)
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
      the_present.should be_within(0.093, some_tolerance)
      the_future.should  be_within(0.093, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "dashboard_total_costs" do
      the_present.should be_within(42.855, some_tolerance)
      the_future.should  be_within(42.855, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_agriculture" do
      the_present.should be_within(1867394895.285, some_tolerance)
      the_future.should  be_within(1867394895.285, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_buildings" do
      the_present.should be_within(4733155777.388, some_tolerance)
      the_future.should  be_within(4733155777.388, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_households" do
      the_present.should be_within(6890174832.378, some_tolerance)
      the_future.should  be_within(6890174832.378, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_industry_and_energy" do
      the_present.should be_within(20935307495.242, some_tolerance)
      the_future.should  be_within(20935307495.242, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_other" do
      the_present.should be_within(1278707737.206, some_tolerance)
      the_future.should  be_within(1278707737.206, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_transport" do
      the_present.should be_within(7150305916.942, some_tolerance)
      the_future.should  be_within(7150305916.942, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "dashboard_total_costs_per_household" do
      the_present.should be_within(5831.015, some_tolerance)
      the_future.should  be_within(5831.015, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "number_of_households" do
      the_present.should be_within(, some_tolerance)
      the_future.should  be_within(, some_tolerance)
      the_relative_increase.should be_within(, some_tolerance)
      the_absolute_increase.should be_within(, some_tolerance)
    end
      
    it "number_of_households_space_heater_coal" do
      the_present.should be_within(4524.173, some_tolerance)
      the_future.should  be_within(4524.173, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "number_of_households_space_heater_collective_heatpump_water_water_ts_electricity" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(NaN, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "number_of_households_space_heater_combined_network_gas" do
      the_present.should be_within(6036756.75, some_tolerance)
      the_future.should  be_within(6036756.75, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "number_of_households_space_heater_crude_oil" do
      the_present.should be_within(91331.746, some_tolerance)
      the_future.should  be_within(91331.746, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "number_of_households_space_heater_district_heating_steam_hot_water" do
      the_present.should be_within(100503.531, some_tolerance)
      the_future.should  be_within(100503.531, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "number_of_households_space_heater_electricity" do
      the_present.should be_within(129349.292, some_tolerance)
      the_future.should  be_within(129349.292, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "number_of_households_space_heater_heatpump_air_water_network_gas" do
      the_present.should be_within(1.475, some_tolerance)
      the_future.should  be_within(1.475, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "number_of_households_space_heater_heatpump_ground_water_electricity" do
      the_present.should be_within(5504.225, some_tolerance)
      the_future.should  be_within(5504.225, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "number_of_households_space_heater_micro_chp_network_gas" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(NaN, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "number_of_households_space_heater_network_gas" do
      the_present.should be_within(670447.195, some_tolerance)
      the_future.should  be_within(670447.195, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "number_of_households_space_heater_wood_pellets" do
      the_present.should be_within(187910.55, some_tolerance)
      the_future.should  be_within(187910.55, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
  end
end