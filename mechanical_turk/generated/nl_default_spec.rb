# This is an auto-generated files.
# You can overwrite by running in the etengine path:
#   $ rake gql:test:generate
#
# You can overwrite the tolerance percentage:
#   $ rake gql:test TOLERANCE=1 
# A test will pass if the result is within 1 percent (default 3).
#
# The template resides in:
#   lib/templates/mechanical_turk_spec.erb

require 'spec_helper'

describe "nl" do
  context "without any updates" do
    before :all do
      load_gql
    end

    
    it "dashboard_security_of_supply" do
      the_present.should be_within(3.1172364689524557e-07, some_tolerance)
      the_future.should be_within(3.1172364689524557e-07,   some_tolerance)
    end
    
    it "dashboard_bio_footprint" do
      the_present.should be_within(0.2810848591972449, some_tolerance)
      the_future.should be_within(0.28108485919724485,   some_tolerance)
    end
    
    it "dashboard_employment" do
      the_present.should be_within(29213.489621824792, some_tolerance)
      the_future.should be_within(29213.489621824792,   some_tolerance)
    end
    
    it "dashboard_energy_demand_primary_of_final" do
      the_present.should be_within(3461122259486.1797, some_tolerance)
      the_future.should be_within(3461122259486.18,   some_tolerance)
    end
    
    it "dashboard_energy_import_netto" do
      the_present.should be_within(0.2936960038451643, some_tolerance)
      the_future.should be_within(0.9633104353609985,   some_tolerance)
    end
    
    it "dashboard_reduction_of_co2_emissions_versus_1990" do
      the_present.should be_within(0.08952421216819206, some_tolerance)
      the_future.should be_within(0.089516983010826,   some_tolerance)
    end
    
    it "dashboard_renewability" do
      the_present.should be_within(0.03056041265459937, some_tolerance)
      the_future.should be_within(0.03056041265459937,   some_tolerance)
    end
    
    it "dashboard_share_of_renewable_electricity" do
      the_present.should be_within(0.09330363917350881, some_tolerance)
      the_future.should be_within(0.09330363917350881,   some_tolerance)
    end
    
    it "dashboard_total_costs" do
      the_present.should be_within(47.288425380076944, some_tolerance)
      the_future.should be_within(47.28842472830254,   some_tolerance)
    end
    
    it "dashboard_total_costs_assigned_to_agriculture" do
      the_present.should be_within(2059292878.4614902, some_tolerance)
      the_future.should be_within(2059292850.0783417,   some_tolerance)
    end
    
    it "dashboard_total_costs_assigned_to_buildings" do
      the_present.should be_within(5219546229.68799, some_tolerance)
      the_future.should be_within(5219546157.747201,   some_tolerance)
    end
    
    it "dashboard_total_costs_assigned_to_households" do
      the_present.should be_within(7627716975.574428, some_tolerance)
      the_future.should be_within(7627716870.44192,   some_tolerance)
    end
    
    it "dashboard_total_costs_assigned_to_industry_and_energy" do
      the_present.should be_within(23086669960.49224, some_tolerance)
      the_future.should be_within(23086669642.289627,   some_tolerance)
    end
    
    it "dashboard_total_costs_assigned_to_other" do
      the_present.should be_within(1410110814.5424504, some_tolerance)
      the_future.should be_within(1410110795.1069515,   some_tolerance)
    end
    
    it "dashboard_total_costs_assigned_to_transport" do
      the_present.should be_within(7885088521.318333, some_tolerance)
      the_future.should be_within(7885088412.638484,   some_tolerance)
    end
    
    it "dashboard_total_costs_per_household" do
      the_present.should be_within(6434.237074641396, some_tolerance)
      the_future.should be_within(6434.236985958573,   some_tolerance)
    end
    
  end
end