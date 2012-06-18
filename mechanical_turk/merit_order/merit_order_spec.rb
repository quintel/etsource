# Reported bug on et-model.com by Wouter Meyers on Fri Apr 13, 2012
# as described here: https://github.com/dennisschoenmakers/etmodel/issues/695

require 'spec_helper'

describe "merit order module" do
  context "for the start scenario" do
    before(:all) do
      load_scenario(area_code: "nl", end_year: 2050) do
      end
    end
    
    it "merit_order_nuclear_iii_full_load_hours_in_merit_order_table" do
      the_future.should be_within(4380, 100.0)
    end

    it "merit_order_coal_igcc_full_load_hours_in_merit_order_table" do
      the_future.should be_within(4380, 100.0)
    end

    it "merit_order_coal_pwd_full_load_hours_in_merit_order_table" do
      the_future.should be_within(4380, 100.0)
    end

    it "merit_order_coal_chp_full_load_hours_in_merit_order_table" do
      the_future.should be_within(4380, 100.0)
    end

    it "merit_order_gas_ccgt_full_load_hours_in_merit_order_table" do
      the_future.should be_within(4380, 100.0)
    end
  end

  context "when removing power plants" do
    before(:all) do
      load_scenario(area_code: "nl", end_year: 2050) do
        move_slider 257, 0 # number of gas ccgt
        move_slider 259, 0 # number of nuclear plants
        move_slider 250, 0 # number of coal pwd
      end
    end

    it "merit_order_gas_ccgt_full_load_hours_in_merit_order_table" do
      the_future.should be == 0.0
    end
 
    it "merit_order_nuclear_iii_full_load_hours_in_merit_order_table" do
      the_future.should be == 0.0
    end
      
    it "merit_order_coal_pwd_full_load_hours_in_merit_order_table" do
      the_future.should be == 0.0
    end
  end

  context "when adding wind power" do
    before(:all) do
      load_scenario(area_code: "nl", end_year: 2050) do
        move_slider 265, 4000 # number of wind offshore turbines
      end
    end

    it "should lower full load hours of central production power plants" do
      # to_f makes nil values to 0.0. nil happen for NaN, Infinites and nil
      the_absolute_increase.to_f.should <= 0.0
      the_absolute_increase.to_f.should <= 0.0
      the_absolute_increase.to_f.should <= 0.0
    end
  end
  
  context "when fuel costs change" do
    before(:all) do
      load_scenario(area_code: "nl", end_year: 2050) do
      end
    end

    it "merit_order_gas_ccgt_full_load_hours_in_merit_order_table" do
      move_slider 58, -50 # % decrease of natural gas costs
      the_absolute_increase.should > 0.0
    #  @scenario.merit_order_nuclear_iii_full_load_hours_in_merit_order_table.should decrease
    #  @scenario.merit_order_coal_pwd_full_load_hours_in_merit_order_table.should decrease
    end
    
    it "merit_order_coal_pwd_full_load_hours_in_merit_order_table" do
        move_slider 57, 300 # % decrease of coal costs
        the_absolute_increase.should < 0.0
    end
  end

end