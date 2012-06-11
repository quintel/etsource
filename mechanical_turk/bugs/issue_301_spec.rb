
require 'spec_helper'

# slider 368 tries to update with a decrease rate the following converter:
#   buildings_useful_demand_after_motion_detection_daylight_control_light
# but this does not work, because there is no preset demand on that
# converter. And decreasing nil with something gives nothing.

# Inputs 361 and 371 used to be old style input statements.
# appartently there was a bug, that the later input will overwrite
# the previous one... Hence the old way of doing things was wrong.

describe "households" do
  
  # ---- DEFAULT NUMBERS ---------------------------------------------
  #
  context "Not changing anything. the normal values." do

    before :all do
      load_scenario(area_code: "nl", end_year: 2050, use_fce: false)
    end

    it "V(households_final_demand_electricity,demand)" do
      the_future.should be_within(88_930_000_000, some_tolerance)
    end

    it "V(households_useful_demand_light,demand)" do
      the_future.should be_within(846_952_380, some_tolerance)
    end

    it "V(buildings_useful_demand_after_motion_detection_daylight_control_light,demand)" do
      the_future.should be_within(12284369344, some_tolerance)
    end

    it "V(households_appliances_other_electricity,demand)" do
      the_future.should be_within(3859562000, some_tolerance)
    end

    it "V(households_appliances_washing_machine_electricity,demand)" do
      the_future.should be_within(5513660000, some_tolerance)
    end
  end

  # ---- UPDATING THE OLD WAY ---------------------------------------------
  #
  context "move sliders using (old) inputs to 50" do
    before :all do
      load_scenario(area_code: "nl", end_year: 2050, use_fce: false, user_values: {
          '368' => 50.0,       # households_behavior_turn_off_the_light
          '412' => 50.0,       # households_efficiency_other
          '361' => 50.0,       # households_efficiency_washing_machine
          '371' => 50.0        # households_efficiency_low_temperature_washing
        })
    end

    it "V(households_final_demand_electricity,demand)" do
      the_future.should be_within(85_186_047_000, some_tolerance)
    end

    it "V(households_useful_demand_light,demand)" do
      the_future.should be_within(804604761, some_tolerance)
    end

    it "V(buildings_useful_demand_after_motion_detection_daylight_control_light,demand)" do
      the_future.should be_within(12284369344, some_tolerance)
    end

    it "V(households_appliances_other_electricity,demand)" do
      the_future.should be_within(1929781000, some_tolerance)
    end
    describe "Gives the wrong value for" do
      it "V(households_appliances_washing_machine_electricity,demand)" do
        # this gives the WRONG VALUE. it forgets to add the second input.
        the_future.should be_within(2756830000, some_tolerance)
      end
    end
  end

  # ---- UPDATING THE NEW WAY ---------------------------------------------
  #
  context "move sliders using the (new) Gqueries" do
    before :all do
      input_368 = Input.new(:lookup_id => 368, :updateable_period => 'future', :query => "UPDATE(V(households_useful_demand_light), preset_demand,     NEG(DIVIDE(USER_INPUT(),V(10.0))))")
      input_412 = Input.new(:lookup_id => 412, :updateable_period => 'future', :query => "UPDATE(V(households_appliances_other_electricity), preset_demand, NEG(USER_INPUT()))")
      input_361 = Input.new(:lookup_id => 361, :updateable_period => 'future', :query => "UPDATE(V(households_appliances_washing_machine_electricity), preset_demand, NEG(USER_INPUT()))")
      input_371 = Input.new(:lookup_id => 371, :updateable_period => 'future', :query => "UPDATE(V(households_appliances_washing_machine_electricity), preset_demand, NEG(DIVIDE(USER_INPUT(),V(2.5))))")
      
      load_scenario(area_code: "nl", end_year: 2050, use_fce: false) do
        move_slider input_368, "50.0%"       # households_behavior_turn_off_the_light
        move_slider input_412, "50.0%"       # households_efficiency_other
        move_slider input_361, "50.0%"       # households_efficiency_washing_machine
        move_slider input_371, "50.0%"       # households_efficiency_low_temperature_washing
      end
    end

    it "V(households_final_demand_electricity,demand)" do
      the_future.should be_within(85_186_047_000, some_tolerance)
    end

    it "V(households_useful_demand_light,demand)" do
      the_future.should be_within(804_604_761, some_tolerance)
    end

    it "V(buildings_useful_demand_after_motion_detection_daylight_control_light,demand)" do
      the_future.should be_within(12284369344, some_tolerance)
    end

    it "V(households_appliances_other_electricity,demand)" do
      the_future.should be_within(1929781000, some_tolerance)
    end

    it "V(households_appliances_washing_machine_electricity,demand)" do
      the_future.should be_within(2_205_464_000, some_tolerance)
    end
  end
end

