require 'spec_helper'

describe "biogas_production" do
  context "without any updates" do
    before :all do
      load_scenario
    end

    it "check that numbers are correctly assigned" do
      @future.custom("V(a_biogas_chp, demand)").should == 2000
      @future.custom('V(b_greengas_distribution, demand)').should == 8000
    end

    describe "max_demand/max_demand_recursive" do
      it "returns max_demand of a converter if defined." do
        @future.custom("V(g_corn_production, max_demand_recursive)").should == 500
        @future.custom("V(f_manure_production, max_demand_recursive)").should == 6000
      end

      it "works in a recursive way" do
        @future.custom("V(d_biogas_distribution, max_demand_recursive)").should == 6500
      end

      # is that what we want?
      it "if no max_demand defined, take the SUM of max_demands of all the links to the right " do
        @future.custom("V(e_biogas_production, max_demand_recursive)").should == 6500
      end
    end
  end

  context "updating a_biogas_chp using an input" do
    before :all do
      load_scenario do
        move_slider 13, 5000
      end
    end

    it "check that numbers are correctly assigned" do
      @future.custom("V(a_biogas_chp, demand)").should == 5000
    end
  end

  context "updating a_biogas_chp using an input" do
    before :all do
      load_scenario do
        @future.custom_update "UPDATE(L(a_biogas_chp), demand, USER_INPUT())", 5000
      end
    end

    it "check that numbers are correctly assigned" do
      @future.custom("V(a_biogas_chp, demand)").should == 5000
    end
  end
end