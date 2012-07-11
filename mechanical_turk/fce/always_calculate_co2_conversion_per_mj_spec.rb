require 'spec_helper'

# Issue: https://github.com/dennisschoenmakers/etengine/issues/361
# Issue: https://github.com/dennisschoenmakers/etengine/issues/362
describe "FCE, if not using FCE should still calculate co2_conversion based on sliders" do

  before(:all) do 
    load_scenario(area_code: "nl", end_year: 2050, use_fce: false) do
      move_slider 563, '0.0'       # coal_from_south_africa_share
      move_slider 564, '0.0'       # coal_from_north_america_share
      move_slider 565, '0.0'       # coal_from_australia_share
      move_slider 566, '0.0'       # coal_from_eastern_europe_share
      move_slider 567, '0.0'       # coal_from_south_america_share
      move_slider 568, '0.0'       # coal_from_south_america_share
      move_slider 569, '100.0'     # coal_from_east_asia_share
    end
  end

  it "coal_conversion_in_fuel_chain_emissions" do
    the_value.should be_within(98.329, some_tolerance)
  end

  it "V(CARRIER(coal),co2_per_mj)" do
    the_present.should be_within(0.0926, some_tolerance)
    the_future.should be_within(0.0983, some_tolerance)
  end

  # assigns the other steps too:
  # co2_exploration_per_mj: 0.0
  # co2_extraction_per_mj: 0.00485538
  # co2_treatment_per_mj: 0.00126224
  # co2_transportation_per_mj: 0.00037335
  # co2_conversion_per_mj: 0.0983293
  # co2_waste_treatment_per_mj: 0.0
  it "V(CARRIER(coal),co2_exploration_per_mj)" do
    the_future.should be_within(0.0, some_tolerance)
  end

  it "V(CARRIER(coal),co2_extraction_per_mj)" do
    the_future.round(5).should == 0.00485538.round(5)
  end

  it "V(CARRIER(coal),co2_treatment_per_mj)" do
    the_future.round(5).should == 0.00126224.round(5)
  end

  it "V(CARRIER(coal),co2_transportation_per_mj)" do
    the_future.round(5).should == 0.00037335.round(5)
  end

  it "V(CARRIER(coal),co2_waste_treatment_per_mj)" do
    the_future.should be_within(0.0, some_tolerance)
  end

  it "dashboard_reduction_of_co2_emissions_versus_1990" do
    the_future.should  be_within(0.09, some_tolerance)
  end
end

describe "FCE, blank" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2050, use_fce: false) do
#      move_slider 563, "26.2"       # coal_from_south_africa_share
#      move_slider 564, "17.0"       # coal_from_north_america_share
    end
  end

  it "coal_conversion_in_fuel_chain_emissions" do
    #the_value.should be_within(0.74, some_tolerance)
    the_value.should be_within(92.6, some_tolerance)
  end

end

describe "FCE, if not using FCE should still calculate co2_conversion based on sliders" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2050, use_fce: false) do
      move_slider 563, "26.2"       # coal_from_south_africa_share
      move_slider 564, "17.0"       # coal_from_north_america_share
    end
  end

  it "coal_conversion_in_fuel_chain_emissions" do
    #the_value.should be_within(0.74, some_tolerance)
    the_value.should be_within(92.6, 1)
  end

  it "dashboard_reduction_of_co2_emissions_versus_1990" do
    the_present.should be_within(0.081, some_tolerance)
    the_future.should  be_within(0.081, some_tolerance)
  end
end

describe "FCE, use_fce=TRUE" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2050, use_fce: true) do
      #move_slider 563, "26.2"       # coal_from_south_africa_share
      #move_slider 564, "17.0"       # coal_from_north_america_share
    end
  end

  it "dashboard_reduction_of_co2_emissions_versus_1990" do
    the_future.should  be_within(0.104, some_tolerance)
  end
end