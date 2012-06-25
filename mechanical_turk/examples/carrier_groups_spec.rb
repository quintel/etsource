require 'spec_helper'

describe "test carrier_groups" do
  before :all do
    load_scenario(area_code: "nl")
  end

  it "SUM( V(INTERSECTION(SECTOR(agriculture),G(final_demand_cbs)), primary_demand_of( CARRIER(crude_oil, gasoline, diesel, lpg, kerosene, heavy_fuel_oil) )))" do
    the_present.should be_within(16_000_000_000, 30)
  end

  # SUM(
  #   M(
  #     L(INTERSECTION(SECTOR(agriculture),G(final_demand_cbs)) ),
  #     output_of( Q(turk_carrier_groups))
  #   )
  # )  
  it "SUM( M(L(INTERSECTION(SECTOR(agriculture),G(final_demand_cbs))), primary_demand_of( Q(turk_carrier_groups) )) )" do
    # CARRIER() is extracted to a gquery
    the_present.should be_within(16_000_000_000, 30)
  end

  it "SUM( M(L(INTERSECTION(SECTOR(agriculture),G(final_demand_cbs))), input_of( Q(turk_carrier_groups) )) )" do
    the_present.should be_within(0, 30)
  end

  it "SUM( M(L(INTERSECTION(SECTOR(agriculture),G(final_demand_cbs))), output_of( Q(turk_carrier_groups))))" do
    the_present.should be_within(0, 30)
  end

  it "SUM( V(INTERSECTION(SECTOR(agriculture),G(final_demand_cbs)), primary_demand_of( Q(turk_carrier_groups) )))" do
    # Using V()
    the_present.should be_within(16_000_000_000, 30)
  end
  

  it "SUM( V(INTERSECTION(SECTOR(agriculture),G(final_demand_cbs)), primary_demand_of( CARRIER(crude_oil) )))" do
    # works with single converter
    the_present.should be_within(16_000_000_000, 30)
  end

  it "SUM( V(INTERSECTION(SECTOR(agriculture),G(final_demand_cbs)), primary_demand_of( crude_oil )))" do
    # works with keys, instead of CARRIER() objects
    the_present.should be_within(16_000_000_000, 30)
  end
end
