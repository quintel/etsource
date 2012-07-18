require 'spec_helper'

describe "transport_efficiency_electric_vehicles_spec" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2050, use_fce: false) do
      move_slider 171, 1.1       # households_replacement_of_existing_houses
    end
  end

  describe "custom" do
    it "V(FIRST(OUTPUT_SLOTS(V(transport_car_using_electricity),car_kms)), conversion)" do
      the_future.should be_within(the_present*1.011**40, 5.0)
    end
    it "SUM(M(OUTPUT_SLOTS(L(transport_car_using_electricity),loss), conversion))" do
      f = the_future("1 - V(FIRST(OUTPUT_SLOTS(V(transport_car_using_electricity),car_kms)), conversion)")
      the_future.should be_within(f, 5)
    end
  end
end