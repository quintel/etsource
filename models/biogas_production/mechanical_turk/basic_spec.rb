require 'spec_helper'

context "biogas_production without any updates" do

  it "check that numbers are correctly assigned" do
    present("V(a_biogas_chp, demand)").should == 2000
    present('V(b_greengas_distribution, demand)').should == 8000
  end

  describe "max_demand/max_demand_recursive" do
    it "returns max_demand of a converter if defined." do
      present("V(g_corn_production, max_demand_recursive)").should == 500
      present("V(f_manure_production, max_demand_recursive)").should == 6000
    end

    it "works in a recursive way" do
      present("V(d_biogas_distribution, max_demand_recursive)").should == 6500
    end

    # is that what we want?
    it "if no max_demand defined, take the SUM of max_demands of all the links to the right " do
      present("V(e_biogas_production, max_demand_recursive)").should == 6500
    end
  end
end
