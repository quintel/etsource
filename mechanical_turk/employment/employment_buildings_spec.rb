require 'spec_helper'

describe "Buildings, Space Heating" do

  before(:each) do 
    load_scenario(area_code: "nl", end_year: 2050)
  end

  context "for the start scenario" do
    
    # For every space heating technology, the number_of_units should go to #HHs when slider = 100%
    it "turk_number_of_buildings_heating_gas_fired_heater" do
      move_slider 383, 100 #%
      the_future.should be_within(7349500.0, 10.0)
    end
    
    it "turk_number_of_buildings_heating_heat_pump_with_ts" do
      move_slider 394, 100 #%
      the_future.should be_within(7349500.0, 10.0)
    end
    
    it "turk_number_of_buildings_heating_gas_fired_heat_pump_share" do
      move_slider 390, 100 #%
      the_future.should be_within(7349500.0, 10.0)
    end
    
  end

end