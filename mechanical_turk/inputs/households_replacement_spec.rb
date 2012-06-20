require 'spec_helper'

describe "households_replacement" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2050, use_fce: false) do
      move_slider 1, 5.0       # households_replacement_of_existing_houses
    end
  end

  describe "custom" do
    it "AREA(number_of_existing_households)" do
      the_future.should be_within(1841200, 5.0)
    end
    it "V(households_old_houses_useful_demand_for_heating, preset_demand)" do
      the_future.should be_within(34701372273, 5.0)
    end
    it "V(households_new_houses_useful_demand_for_heating, preset_demand)" do
      the_future.should be_within(186186716490, 5.0)
    end
  end

  describe "gqueries" do
      
    it "dashboard_bio_footprint" do
      the_present.should be_within(0.309, some_tolerance)
      the_future.should  be_within(0.302, some_tolerance)
      the_relative_increase.should be_within(-2.5, some_tolerance)
      the_absolute_increase.should be_within(-0.0, some_tolerance)
    end
      
    it "dashboard_employment" do
      the_present.should be_within(29409.913, some_tolerance)
      the_future.should  be_within(29408.518, some_tolerance)
      the_relative_increase.should be_within(-0.0, some_tolerance)
      the_absolute_increase.should be_within(-1.4, some_tolerance)
    end
      
    it "dashboard_energy_demand_primary_of_final" do
      the_present.should be_within(3461730879704.038, some_tolerance)
      the_future.should  be_within(3381962505959.767, some_tolerance)
      the_relative_increase.should be_within(-2.3, some_tolerance)
      the_absolute_increase.should be_within(-79768373744.3, some_tolerance)
    end
      
    it "dashboard_energy_import_netto" do
      the_present.should be_within(0.294, some_tolerance)
      the_future.should  be_within(0.974, some_tolerance)
      the_relative_increase.should be_within(231.6, some_tolerance)
      the_absolute_increase.should be_within(0.7, some_tolerance)
    end
      
    it "dashboard_reduction_of_co2_emissions_versus_1990" do
      the_present.should be_within(0.084, some_tolerance)
      the_future.should  be_within(0.056, some_tolerance)
      the_relative_increase.should be_within(-33.7, some_tolerance)
      the_absolute_increase.should be_within(-0.0, some_tolerance)
    end
      
    it "dashboard_renewability" do
      the_present.should be_within(0.033, some_tolerance)
      the_future.should  be_within(0.032, some_tolerance)
      the_relative_increase.should be_within(-0.3, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "dashboard_security_of_supply" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-40.2, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "dashboard_share_of_renewable_electricity" do
      the_present.should be_within(0.098, some_tolerance)
      the_future.should  be_within(0.098, some_tolerance)
      the_relative_increase.should be_within(0.3, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end
      
    it "dashboard_total_costs" do
      the_present.should be_within(48.641, some_tolerance)
      the_future.should  be_within(47.958, some_tolerance)
      the_relative_increase.should be_within(-1.4, some_tolerance)
      the_absolute_increase.should be_within(-0.7, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_agriculture" do
      the_present.should be_within(2118194220.447, some_tolerance)
      the_future.should  be_within(2144137112.904, some_tolerance)
      the_relative_increase.should be_within(1.2, some_tolerance)
      the_absolute_increase.should be_within(25942892.5, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_buildings" do
      the_present.should be_within(5368839358.751, some_tolerance)
      the_future.should  be_within(5434595001.346, some_tolerance)
      the_relative_increase.should be_within(1.2, some_tolerance)
      the_absolute_increase.should be_within(65755642.6, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_households" do
      the_present.should be_within(7845889929.558, some_tolerance)
      the_future.should  be_within(6663297171.124, some_tolerance)
      the_relative_increase.should be_within(-15.1, some_tolerance)
      the_absolute_increase.should be_within(-1182592758.4, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_industry_and_energy" do
      the_present.should be_within(23747011117.821, some_tolerance)
      the_future.should  be_within(24037856097.793, some_tolerance)
      the_relative_increase.should be_within(1.2, some_tolerance)
      the_absolute_increase.should be_within(290844980.0, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_other" do
      the_present.should be_within(1450443794.952, some_tolerance)
      the_future.should  be_within(1468208316.744, some_tolerance)
      the_relative_increase.should be_within(1.2, some_tolerance)
      the_absolute_increase.should be_within(17764521.8, some_tolerance)
    end
      
    it "dashboard_total_costs_assigned_to_transport" do
      the_present.should be_within(8110623364.096, some_tolerance)
      the_future.should  be_within(8209959405.933, some_tolerance)
      the_relative_increase.should be_within(1.2, some_tolerance)
      the_absolute_increase.should be_within(99336041.8, some_tolerance)
    end
      
    it "dashboard_total_costs_per_household" do
      the_present.should be_within(6618.274, some_tolerance)
      the_future.should  be_within(6525.349, some_tolerance)
      the_relative_increase.should be_within(-1.4, some_tolerance)
      the_absolute_increase.should be_within(-92.9, some_tolerance)
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
      the_future.should  be_within(74516.145, some_tolerance)
      the_relative_increase.should be_within(-26.2, some_tolerance)
      the_absolute_increase.should be_within(-26461.9, some_tolerance)
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