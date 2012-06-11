require 'spec_helper'

# UPDATED:
# The bugs in the inputs were fixed. The problematic before state is in this 
# commit:
# https://github.com/dennisschoenmakers/etsource/commit/0795e93fc6b44fe883f186a7b6bed45ca74ff82f

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

    # describe "Gives the wrong value for" do
    #   it "V(households_appliances_washing_machine_electricity,demand)" do
    #     # this gives the WRONG VALUE. it forgets to add the second input.
    #     the_future.should be_within(2756830000, some_tolerance)
    #   end
    # end
    
    it "V(households_appliances_washing_machine_electricity,demand)" do
      # this now gives the correct VALUE
      the_future.should be_within(2205464000, some_tolerance)
    end
  
  end
end

