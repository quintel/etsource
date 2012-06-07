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
    TOLERANCE = ENV.fetch('TOLERANCE', 3.0) # 3%
    
    before :all do
      load_gql
    end

    
    it "check dashboard_security_of_supply" do
      @present.dashboard_security_of_supply.should be_within(3.1172364689524557e-07, TOLERANCE)
      @future.dashboard_security_of_supply.should be_within(3.1172364689524557e-07, TOLERANCE)
    end
    
    it "check dashboard_bio_footprint" do
      @present.dashboard_bio_footprint.should be_within(0.2810848591972449, TOLERANCE)
      @future.dashboard_bio_footprint.should be_within(0.28108485919724485, TOLERANCE)
    end
    
    it "check dashboard_employment" do
      @present.dashboard_employment.should be_within(29213.489621824792, TOLERANCE)
      @future.dashboard_employment.should be_within(29213.489621824792, TOLERANCE)
    end
    
    it "check dashboard_energy_demand_primary_of_final" do
      @present.dashboard_energy_demand_primary_of_final.should be_within(3461122259486.1797, TOLERANCE)
      @future.dashboard_energy_demand_primary_of_final.should be_within(3461122259486.1797, TOLERANCE)
    end
    
    it "check dashboard_energy_import_netto" do
      @present.dashboard_energy_import_netto.should be_within(0.2936960038451643, TOLERANCE)
      @future.dashboard_energy_import_netto.should be_within(0.7980140276645232, TOLERANCE)
    end
    
    it "check dashboard_reduction_of_co2_emissions_versus_1990" do
      @present.dashboard_reduction_of_co2_emissions_versus_1990.should be_within(0.08952421216819206, TOLERANCE)
      @future.dashboard_reduction_of_co2_emissions_versus_1990.should be_within(0.08951698301082556, TOLERANCE)
    end
    
    it "check dashboard_renewability" do
      @present.dashboard_renewability.should be_within(0.03056041265459937, TOLERANCE)
      @future.dashboard_renewability.should be_within(0.03056041265459937, TOLERANCE)
    end
    
    it "check dashboard_share_of_renewable_electricity" do
      @present.dashboard_share_of_renewable_electricity.should be_within(0.09330363917350881, TOLERANCE)
      @future.dashboard_share_of_renewable_electricity.should be_within(0.09330363917350881, TOLERANCE)
    end
    
    it "check dashboard_total_costs" do
      @present.dashboard_total_costs.should be_within(47.288425380076944, TOLERANCE)
      @future.dashboard_total_costs.should be_within(47.28842472830254, TOLERANCE)
    end
    
    it "check dashboard_total_costs_assigned_to_agriculture" do
      @present.dashboard_total_costs_assigned_to_agriculture.should be_within(2059292878.4614902, TOLERANCE)
      @future.dashboard_total_costs_assigned_to_agriculture.should be_within(2059292850.0783417, TOLERANCE)
    end
    
    it "check dashboard_total_costs_assigned_to_buildings" do
      @present.dashboard_total_costs_assigned_to_buildings.should be_within(5219546229.68799, TOLERANCE)
      @future.dashboard_total_costs_assigned_to_buildings.should be_within(5219546157.747201, TOLERANCE)
    end
    
    it "check dashboard_total_costs_assigned_to_households" do
      @present.dashboard_total_costs_assigned_to_households.should be_within(7627716975.574428, TOLERANCE)
      @future.dashboard_total_costs_assigned_to_households.should be_within(7627716870.44192, TOLERANCE)
    end
    
    it "check dashboard_total_costs_assigned_to_industry_and_energy" do
      @present.dashboard_total_costs_assigned_to_industry_and_energy.should be_within(23086669960.49224, TOLERANCE)
      @future.dashboard_total_costs_assigned_to_industry_and_energy.should be_within(23086669642.289627, TOLERANCE)
    end
    
    it "check dashboard_total_costs_assigned_to_other" do
      @present.dashboard_total_costs_assigned_to_other.should be_within(1410110814.5424504, TOLERANCE)
      @future.dashboard_total_costs_assigned_to_other.should be_within(1410110795.1069515, TOLERANCE)
    end
    
    it "check dashboard_total_costs_assigned_to_transport" do
      @present.dashboard_total_costs_assigned_to_transport.should be_within(7885088521.318333, TOLERANCE)
      @future.dashboard_total_costs_assigned_to_transport.should be_within(7885088412.638484, TOLERANCE)
    end
    
    it "check dashboard_total_costs_per_household" do
      @present.dashboard_total_costs_per_household.should be_within(6434.237074641396, TOLERANCE)
      @future.dashboard_total_costs_per_household.should be_within(6434.236985958573, TOLERANCE)
    end
    
  end
end