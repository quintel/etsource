require 'spec_helper'

describe "households_number_of_inhabitants" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2050, use_fce: false) do
      move_slider 335, 5.0       # households_replacement_of_existing_houses
    end
  end

  describe "custom" do
    it "AREA(number_inhabitants)" do
      the_future.should be_within(the_present*1.05, 5.0)
    end
    it "AREA(number_households)" do
      the_future.should be_within(the_present*1.05, 5.0)
    end
    query = <<-STR
      SUM(MAP(
        L(households_useful_demand_light,
          households_useful_demand_cooking_useable_heat,
          households_appliances_dishwasher_electricity,
          households_appliances_fridge_freezer_electricity,
          households_appliances_vacuum_cleaner_electricity,
          households_appliances_washing_machine_electricity,
          households_appliances_clothes_dryer_electricity,
          households_appliances_television_electricity,
          households_appliances_computer_media_electricity,
          households_useful_demand_hot_water,
          transport_useful_demand_car_kms,
         ), preset_demand)
      ) 
    STR
    it query do
      the_future.should be_within(the_present*1.05, 5.0)

    end
  end
end