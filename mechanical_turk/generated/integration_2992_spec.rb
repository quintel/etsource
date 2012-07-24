require 'spec_helper'

describe "untitled" do
  before :all do
    load_scenario(area_code: "nl", end_year: 2020, use_fce: false) do
    end
  end

  after :all do
    print_comparison('localhost') if ENV["LOCALHOST"]
    print_comparison('beta') if ENV["BETA"]
  end

  describe "gqueries" do
      
    it "1990_in_co2_emissions" do
      the_present.should be_within(151.2, some_tolerance)
      the_future.should  be_within(151.2, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "1990_in_co2_emissions_corrected_for_import" do
      the_present.should be_within(151.2, some_tolerance)
      the_future.should  be_within(151.2, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "actual_1990_in_co2_emissions_table" do
      the_value.should be_within(151.2, some_tolerance)
    end


      
    it "actual_2010_in_co2_emissions_table" do
      the_value.should be_within(164.764, some_tolerance)
    end


      
    it "actual_20xx_in_co2_emissions_table" do
      the_value.should be_within(164.763, some_tolerance)
    end


      
    it "actual_co2_emitted_in_co2_emissions_waterfall" do
      the_value.should be_within(164.763, some_tolerance)
    end


      
    it "all_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(25.915, some_tolerance)
    end


      
    it "ambient_cold_in_source_of_cooling_in_buildings" do
      the_present.should be_within(37.8, some_tolerance)
      the_future.should  be_within(37.8, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "ambient_cold_in_source_of_cooling_in_households" do
      the_present.should be_within(8.004, some_tolerance)
      the_future.should  be_within(8.004, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "ambient_heat_in_effect_of_insulation_in_households2" do
      the_present.should be_within(0.271, some_tolerance)
      the_future.should  be_within(0.271, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "ambient_heat_in_source_of_heat_and_electricity_used_in_households" do
      the_present.should be_within(1.094, some_tolerance)
      the_future.should  be_within(1.094, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "ambient_heat_in_source_of_heat_in_agriculture" do
      the_present.should be_within(0.45, some_tolerance)
      the_future.should  be_within(0.45, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "ambient_heat_in_source_of_heat_in_buildings" do
      the_present.should be_within(7.184, some_tolerance)
      the_future.should  be_within(7.184, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "ambient_heat_in_source_of_heat_production" do
      the_present.should be_within(53.748, some_tolerance)
      the_future.should  be_within(53.748, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "appliances_in_use_of_electricity_in_buildings" do
      the_present.should be_within(33.6, some_tolerance)
      the_future.should  be_within(33.6, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "assigned_co2_emission_in_co2_emissions_waterfall" do
      the_value.should be_within(-1.403, some_tolerance)
    end


      
    it "bio_ethanol_in_use_of_transport_fuels" do
      the_present.should be_within(5.614, some_tolerance)
      the_future.should  be_within(5.614, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "bio_fuels_agriculture_in_mekko_of_final_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "bio_fuels_agriculture_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "bio_fuels_buildings_in_mekko_of_final_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "bio_fuels_buildings_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "bio_fuels_households_in_mekko_of_final_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "bio_fuels_households_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "bio_fuels_industry_in_mekko_of_final_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "bio_fuels_industry_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "bio_fuels_other_in_mekko_of_final_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "bio_fuels_other_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "bio_fuels_transport_in_mekko_of_final_demand" do
      the_present.should be_within(9.577, some_tolerance)
      the_future.should  be_within(9.577, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "bio_fuels_transport_in_mekko_of_primary_demand" do
      the_present.should be_within(9.577, some_tolerance)
      the_future.should  be_within(9.577, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "biodiesel_in_use_of_transport_fuels" do
      the_present.should be_within(3.963, some_tolerance)
      the_future.should  be_within(3.963, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "biomass_agriculture_in_mekko_of_final_demand" do
      the_present.should be_within(0.8, some_tolerance)
      the_future.should  be_within(0.8, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "biomass_agriculture_in_mekko_of_primary_demand" do
      the_present.should be_within(0.885, some_tolerance)
      the_future.should  be_within(0.885, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "biomass_buildings_in_mekko_of_final_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "biomass_buildings_in_mekko_of_primary_demand" do
      the_present.should be_within(10.155, some_tolerance)
      the_future.should  be_within(10.155, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "biomass_conversion_in_fuel_chain_emissions" do
      the_value.should be_within(0.029, some_tolerance)
    end


      
    it "biomass_households_in_mekko_of_final_demand" do
      the_present.should be_within(9.32, some_tolerance)
      the_future.should  be_within(9.32, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "biomass_households_in_mekko_of_primary_demand" do
      the_present.should be_within(17.354, some_tolerance)
      the_future.should  be_within(17.354, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "biomass_in_future_energy_imports" do
      the_value.should be_within(17.647, some_tolerance)
    end


      
    it "biomass_in_source_of_electricity_production" do
      the_present.should be_within(19.148, some_tolerance)
      the_future.should  be_within(19.148, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "biomass_industry_in_mekko_of_final_demand" do
      the_present.should be_within(3.33, some_tolerance)
      the_future.should  be_within(3.33, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "biomass_industry_in_mekko_of_primary_demand" do
      the_present.should be_within(44.199, some_tolerance)
      the_future.should  be_within(44.199, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "biomass_other_in_mekko_of_final_demand" do
      the_present.should be_within(1.84, some_tolerance)
      the_future.should  be_within(1.84, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "biomass_other_in_mekko_of_primary_demand" do
      the_present.should be_within(2.012, some_tolerance)
      the_future.should  be_within(2.012, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "biomass_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(0.828, some_tolerance)
    end


      
    it "biomass_plants_in_power_plant_properties" do
      the_value.should be_within(19.148, some_tolerance)
    end


      
    it "biomass_plants_investm_in_power_plant_properties" do
      the_value.should be_within(1456.743, some_tolerance)
    end


      
    it "biomass_plants_plants_in_power_plant_properties" do
      the_value.should be_within(11.172, some_tolerance)
    end


      
    it "biomass_plants_prod_in_power_plant_properties" do
      the_value.should be_within(19.148, some_tolerance)
    end


      
    it "biomass_transport_in_mekko_of_final_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "biomass_transport_in_mekko_of_primary_demand" do
      the_present.should be_within(0.546, some_tolerance)
      the_future.should  be_within(0.546, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "biomass_value_in_present_energy_imports" do
      the_value.should be_within(66.699, some_tolerance)
    end


      
    it "bmu_wind_inland_in_expert_predictions" do
      the_value.should be_within(70.902, some_tolerance)
    end


      
    it "bmu_wind_offshore_in_expert_predictions" do
      the_value.should be_within(156.527, some_tolerance)
    end


      
    it "centrally_produced_electricity_in_source_of_heat_and_electricity_in_agriculture" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "centrally_produced_electricity_in_source_of_heat_and_electricity_in_industry" do
      the_present.should be_within(8.62, some_tolerance)
      the_future.should  be_within(8.62, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "centrally_produced_electricity_in_source_of_heat_and_electricity_in_other_sector" do
      the_present.should be_within(1.44, some_tolerance)
      the_future.should  be_within(1.44, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "centrally_produced_in_source_of_electricity_in_buildings" do
      the_present.should be_within(114.12, some_tolerance)
      the_future.should  be_within(114.12, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "centrally_produced_in_source_of_electricity_in_households" do
      the_present.should be_within(88.69, some_tolerance)
      the_future.should  be_within(88.69, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "chp_electricity_in_source_of_heat_and_electricity_in_agriculture" do
      the_present.should be_within(43.92, some_tolerance)
      the_future.should  be_within(43.92, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "chp_electricity_in_source_of_heat_and_electricity_in_other_sector" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "chp_fossil_electricity_in_source_of_heat_and_electricity_in_industry" do
      the_present.should be_within(60.807, some_tolerance)
      the_future.should  be_within(60.807, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "chp_fossil_heat_in_source_of_heat_and_electricity_in_industry" do
      the_present.should be_within(114.858, some_tolerance)
      the_future.should  be_within(114.858, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "chp_heat_in_source_of_heat_and_electricity_in_agriculture" do
      the_present.should be_within(53.416, some_tolerance)
      the_future.should  be_within(53.416, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "chp_heat_in_source_of_heat_and_electricity_in_other_sector" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "chp_renewable_electricity_in_source_of_heat_and_electricity_in_industry" do
      the_present.should be_within(6.513, some_tolerance)
      the_future.should  be_within(6.513, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "chp_renewable_heat_in_source_of_heat_and_electricity_in_industry" do
      the_present.should be_within(11.402, some_tolerance)
      the_future.should  be_within(11.402, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "chps_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(-178.2, some_tolerance)
      the_future.should  be_within(-178.2, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "chps_in_source_of_electricity_in_buildings" do
      the_present.should be_within(5.76, some_tolerance)
      the_future.should  be_within(5.76, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "cleaning_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(22.055, some_tolerance)
      the_future.should  be_within(22.055, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "co2_emission_exported_electricity_in_co2_emissions_with_import_and_export" do
      the_present.should be_within(1.403, some_tolerance)
      the_future.should  be_within(1.403, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "co2_emission_imported_electricity_in_co2_emissions_with_import_and_export" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "co2_emission_in_co2_emissions" do
      the_present.should be_within(163.361, some_tolerance)
      the_future.should  be_within(163.359, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "co2_emission_in_co2_emissions_corrected_for_import" do
      the_present.should be_within(163.361, some_tolerance)
      the_future.should  be_within(163.359, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "co2_emission_local_production_in_co2_emissions_with_import_and_export" do
      the_present.should be_within(163.361, some_tolerance)
      the_future.should  be_within(163.359, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "co2_emission_rights_in_breakdown_converter_costs" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "co2_emission_rights_in_breakdown_electricity_costs" do
      the_present.should be_within(0.047, some_tolerance)
      the_future.should  be_within(0.047, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "co2_emission_rights_in_breakdown_electricity_costs_corrected_for_electricity_imbalance" do
      the_present.should be_within(0.045, some_tolerance)
      the_future.should  be_within(0.045, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "co2_emission_rights_in_breakdown_heating_costs" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "coal_agriculture_in_mekko_of_final_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "coal_agriculture_in_mekko_of_primary_demand" do
      the_present.should be_within(0.517, some_tolerance)
      the_future.should  be_within(0.517, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "coal_buildings_in_mekko_of_final_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "coal_buildings_in_mekko_of_primary_demand" do
      the_present.should be_within(74.441, some_tolerance)
      the_future.should  be_within(74.441, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "coal_conversion_in_fuel_chain_emissions" do
      the_value.should be_within(92.677, some_tolerance)
    end


      
    it "coal_extraction_in_fuel_chain_emissions" do
      the_value.should be_within(3.834, some_tolerance)
    end


      
    it "coal_households_in_mekko_of_final_demand" do
      the_present.should be_within(0.23, some_tolerance)
      the_future.should  be_within(0.23, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "coal_households_in_mekko_of_primary_demand" do
      the_present.should be_within(61.459, some_tolerance)
      the_future.should  be_within(61.459, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "coal_in_future_energy_imports" do
      the_value.should be_within(332.651, some_tolerance)
    end


      
    it "coal_in_heating_heat_network" do
      the_present.should be_within(84.293, some_tolerance)
      the_future.should  be_within(84.293, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "coal_in_source_of_electricity_production" do
      the_present.should be_within(97.456, some_tolerance)
      the_future.should  be_within(97.456, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "coal_in_use_of_transport_fuels" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "coal_industry_in_mekko_of_final_demand" do
      the_present.should be_within(80.23, some_tolerance)
      the_future.should  be_within(80.23, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "coal_industry_in_mekko_of_primary_demand" do
      the_present.should be_within(166.091, some_tolerance)
      the_future.should  be_within(166.091, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "coal_other_in_mekko_of_final_demand" do
      the_present.should be_within(7.911, some_tolerance)
      the_future.should  be_within(7.911, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "coal_other_in_mekko_of_primary_demand" do
      the_present.should be_within(13.631, some_tolerance)
      the_future.should  be_within(13.631, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "coal_power_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(4.174, some_tolerance)
    end


      
    it "coal_power_plants_in_power_plant_properties" do
      the_value.should be_within(97.456, some_tolerance)
    end


      
    it "coal_power_plants_investment_in_power_plant_properties" do
      the_value.should be_within(6786.03, some_tolerance)
    end


      
    it "coal_power_plants_number_of_plants_in_power_plant_properties" do
      the_value.should be_within(5.564, some_tolerance)
    end


      
    it "coal_power_plants_prod_in_power_plant_properties" do
      the_value.should be_within(97.456, some_tolerance)
    end


      
    it "coal_transport_in_mekko_of_final_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "coal_transport_in_mekko_of_primary_demand" do
      the_present.should be_within(4.031, some_tolerance)
      the_future.should  be_within(4.031, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "coal_transportation_in_fuel_chain_emissions" do
      the_value.should be_within(0.373, some_tolerance)
    end


      
    it "coal_treatment_in_fuel_chain_emissions" do
      the_value.should be_within(0.739, some_tolerance)
    end


      
    it "coal_value_in_present_energy_imports" do
      the_value.should be_within(332.651, some_tolerance)
    end


      
    it "coastal_in_targeted_area_use_for_wind_turbines" do
      the_present.should be_within(0.117, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-0.1, some_tolerance)
    end


      
    it "collective_chps_in_source_of_electricity_in_households" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "conventional_in_comparison_of_demand_micro_chp_versus_conventional" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "cooking_from_biomass_in_source_of_cooking_in_households" do
      the_present.should be_within(0.007, some_tolerance)
      the_future.should  be_within(0.007, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "cooking_from_electricity_in_source_of_cooking_in_households" do
      the_present.should be_within(4.447, some_tolerance)
      the_future.should  be_within(4.447, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "cooking_from_gas_in_source_of_cooking_in_households" do
      the_present.should be_within(10.846, some_tolerance)
      the_future.should  be_within(10.846, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "cooking_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(4.447, some_tolerance)
      the_future.should  be_within(4.447, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "cooling_demand_in_effect_of_insulation_in_households" do
      the_present.should be_within(10.672, some_tolerance)
      the_future.should  be_within(10.672, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "cooling_demand_in_use_of_final_demand_in_buildings" do
      the_present.should be_within(48.6, some_tolerance)
      the_future.should  be_within(48.6, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "cooling_demand_in_use_of_final_demand_in_households" do
      the_present.should be_within(2.668, some_tolerance)
      the_future.should  be_within(2.668, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "cooling_from_electricity_in_source_of_cooling_in_buildings" do
      the_present.should be_within(10.8, some_tolerance)
      the_future.should  be_within(10.8, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "cooling_from_electricity_in_source_of_cooling_in_households" do
      the_present.should be_within(2.668, some_tolerance)
      the_future.should  be_within(2.668, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "cooling_from_gas_in_source_of_cooling_in_buildings" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "cooling_from_gas_in_source_of_cooling_in_households" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "cooling_in_use_of_electricity_in_buildings" do
      the_present.should be_within(10.8, some_tolerance)
      the_future.should  be_within(10.8, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "cooling_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(2.668, some_tolerance)
      the_future.should  be_within(2.668, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "cost_of_capital_in_breakdown_converter_costs" do
      the_present.should be_within(0.076, some_tolerance)
      the_future.should  be_within(0.076, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "cost_of_capital_in_breakdown_electricity_costs" do
      the_present.should be_within(1.661, some_tolerance)
      the_future.should  be_within(1.661, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "cost_of_capital_in_breakdown_electricity_costs_corrected_for_electricity_imbalance" do
      the_present.should be_within(1.612, some_tolerance)
      the_future.should  be_within(1.612, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "cost_of_capital_in_breakdown_heating_costs" do
      the_present.should be_within(1.422, some_tolerance)
      the_future.should  be_within(1.422, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "costs_of_biomass_chp_in_overview_costs_of_electricity_production" do
      the_value.should be_within(195.334, some_tolerance)
    end


      
    it "costs_of_co_firing_coal_in_overview_costs_of_electricity_production" do
      the_value.should be_within(103.267, some_tolerance)
    end


      
    it "costs_of_coal_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(71.827, some_tolerance)
    end


      
    it "costs_of_coal_chp_in_overview_costs_of_electricity_production" do
      the_value.should be_within(53.887, some_tolerance)
    end


      
    it "costs_of_coal_conventional_in_overview_costs_of_electricity_production" do
      the_value.should be_within(52.861, some_tolerance)
    end


      
    it "costs_of_coal_igcc_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(74.801, some_tolerance)
    end


      
    it "costs_of_coal_igcc_in_overview_costs_of_electricity_production" do
      the_value.should be_within(62.579, some_tolerance)
    end


      
    it "costs_of_coal_lignite_in_overview_costs_of_electricity_production" do
      the_value.should be_within(36.407, some_tolerance)
    end


      
    it "costs_of_coal_oxyfuel_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(82.514, some_tolerance)
    end


      
    it "costs_of_coal_powder_in_overview_costs_of_electricity_production" do
      the_value.should be_within(51.288, some_tolerance)
    end


      
    it "costs_of_gas_ccgt_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(81.666, some_tolerance)
    end


      
    it "costs_of_gas_ccgt_in_overview_costs_of_electricity_production" do
      the_value.should be_within(58.436, some_tolerance)
    end


      
    it "costs_of_gas_chp_central_in_overview_costs_of_electricity_production" do
      the_value.should be_within(81.115, some_tolerance)
    end


      
    it "costs_of_gas_chp_industry_in_overview_costs_of_electricity_production" do
      the_value.should be_within(107.254, some_tolerance)
    end


      
    it "costs_of_gas_conventional_in_overview_costs_of_electricity_production" do
      the_value.should be_within(92.331, some_tolerance)
    end


      
    it "costs_of_gas_turbine_in_overview_costs_of_electricity_production" do
      the_value.should be_within(127.815, some_tolerance)
    end


      
    it "costs_of_geothermal_well_in_overview_costs_of_electricity_production" do
      the_value.should be_within(161.312, some_tolerance)
    end


      
    it "costs_of_hydro_mountain_in_overview_costs_of_electricity_production" do
      the_value.should be_within(28.446, some_tolerance)
    end


      
    it "costs_of_hydro_river_in_overview_costs_of_electricity_production" do
      the_value.should be_within(111.0, some_tolerance)
    end


      
    it "costs_of_nuclear_3rd_generation_in_overview_costs_of_electricity_production" do
      the_value.should be_within(51.85, some_tolerance)
    end


      
    it "costs_of_nuclear_conventional_in_overview_costs_of_electricity_production" do
      the_value.should be_within(43.858, some_tolerance)
    end


      
    it "costs_of_oil_plant_in_overview_costs_of_electricity_production" do
      the_value.should be_within(111.061, some_tolerance)
    end


      
    it "costs_of_solar_csp_in_overview_costs_of_electricity_production" do
      the_value.should be_within(606.167, some_tolerance)
    end


      
    it "costs_of_solar_pv_centrally_in_overview_costs_of_electricity_production" do
      the_value.should be_within(243.059, some_tolerance)
    end


      
    it "costs_of_solar_pv_on_roofs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(nil, some_tolerance)
    end


      
    it "costs_of_waste_incinerator_in_overview_costs_of_electricity_production" do
      the_value.should be_within(81.767, some_tolerance)
    end


      
    it "costs_of_wind_coastal_in_overview_costs_of_electricity_production" do
      the_value.should be_within(59.085, some_tolerance)
    end


      
    it "costs_of_wind_inland_in_overview_costs_of_electricity_production" do
      the_value.should be_within(70.902, some_tolerance)
    end


      
    it "costs_of_wind_offshore_in_overview_costs_of_electricity_production" do
      the_value.should be_within(156.527, some_tolerance)
    end


      
    it "crude_oil_conversion_in_fuel_chain_emissions" do
      the_value.should be_within(75.5, some_tolerance)
    end


      
    it "crude_oil_extraction_in_fuel_chain_emissions" do
      the_value.should be_within(4.83, some_tolerance)
    end


      
    it "crude_oil_transportation_in_fuel_chain_emissions" do
      the_value.should be_within(0.88, some_tolerance)
    end


      
    it "crude_oil_treatment_in_fuel_chain_emissions" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "csp_in_targeted_area_use_for_solar_power" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "current_cost_electricity_network_in_annual_costs_of_infrastructure" do
      the_present.should be_within(1810000000.0, some_tolerance)
      the_future.should  be_within(1810000000.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "current_cost_gas_network_in_annual_costs_of_infrastructure" do
      the_present.should be_within(1452000000.0, some_tolerance)
      the_future.should  be_within(1452000000.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "depreciation_in_breakdown_converter_costs" do
      the_present.should be_within(0.084, some_tolerance)
      the_future.should  be_within(0.084, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "depreciation_in_breakdown_electricity_costs" do
      the_present.should be_within(1.13, some_tolerance)
      the_future.should  be_within(1.13, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "depreciation_in_breakdown_electricity_costs_corrected_for_electricity_imbalance" do
      the_present.should be_within(1.097, some_tolerance)
      the_future.should  be_within(1.097, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "depreciation_in_breakdown_heating_costs" do
      the_present.should be_within(3.587, some_tolerance)
      the_future.should  be_within(3.587, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "diesel_in_use_of_transport_fuels" do
      the_present.should be_within(278.767, some_tolerance)
      the_future.should  be_within(278.767, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "diff_1990_in_co2_emissions_table" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "diff_2010_in_co2_emissions_table" do
      the_value.should be_within(-1.403, some_tolerance)
    end


      
    it "diff_20xx_in_co2_emissions_table" do
      the_value.should be_within(-1.403, some_tolerance)
    end


      
    it "electric_heaters_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(9.941, some_tolerance)
      the_future.should  be_within(9.941, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "electric_vehicles_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(0.02, some_tolerance)
      the_future.should  be_within(0.02, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "electricity_agriculture_in_mekko_of_final_demand" do
      the_value.should be_within(26.6, some_tolerance)
    end


      
    it "electricity_buildings_in_mekko_of_final_demand" do
      the_value.should be_within(120.0, some_tolerance)
    end


      
    it "electricity_cars_in_use_of_final_demand_in_transport" do
      the_present.should be_within(0.02, some_tolerance)
      the_future.should  be_within(0.02, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "electricity_demand_excluding_heating_in_use_of_final_demand_in_households" do
      the_present.should be_within(80.926, some_tolerance)
      the_future.should  be_within(80.926, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "electricity_demand_in_effect_of_insulation_in_buildings" do
      the_present.should be_within(120.0, some_tolerance)
      the_future.should  be_within(120.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "electricity_demand_in_use_of_final_demand_in_buildings" do
      the_present.should be_within(105.6, some_tolerance)
      the_future.should  be_within(105.6, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "electricity_households_in_mekko_of_final_demand" do
      the_present.should be_within(88.93, some_tolerance)
      the_future.should  be_within(88.93, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "electricity_import_in_targeted_import_share" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(nil, some_tolerance)
      the_relative_increase.should be_within(nil, some_tolerance)
      the_absolute_increase.should be_within(nil, some_tolerance)
    end


      
    it "electricity_in_breakdown_of_total_costs" do
      the_present.should be_within(9.42, some_tolerance)
      the_future.should  be_within(9.42, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "electricity_in_breakdown_of_total_costs_per_household" do
      the_present.should be_within(1281.734, some_tolerance)
      the_future.should  be_within(1281.734, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "electricity_in_future_energy_imports" do
      the_value.should be_within(-12.252, some_tolerance)
    end


      
    it "electricity_in_source_of_heat_and_electricity_used_in_households" do
      the_present.should be_within(88.93, some_tolerance)
      the_future.should  be_within(88.93, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "electricity_in_use_of_final_demand_in_agriculture" do
      the_present.should be_within(26.6, some_tolerance)
      the_future.should  be_within(26.6, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "electricity_in_use_of_final_demand_in_industry" do
      the_present.should be_within(137.14, some_tolerance)
      the_future.should  be_within(137.14, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "electricity_in_use_of_final_demand_in_other_sector" do
      the_present.should be_within(1.44, some_tolerance)
      the_future.should  be_within(1.44, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "electricity_industry_in_mekko_of_final_demand" do
      the_present.should be_within(159.66, some_tolerance)
      the_future.should  be_within(159.66, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "electricity_other_in_mekko_of_final_demand" do
      the_present.should be_within(1.44, some_tolerance)
      the_future.should  be_within(1.44, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "electricity_trains_in_use_of_final_demand_in_transport" do
      the_present.should be_within(6.2, some_tolerance)
      the_future.should  be_within(6.2, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "electricity_transport_in_mekko_of_final_demand" do
      the_present.should be_within(6.22, some_tolerance)
      the_future.should  be_within(6.22, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "electricity_trucks_in_use_of_final_demand_in_transport" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "electricity_value_in_present_energy_imports" do
      the_value.should be_within(-12.252, some_tolerance)
    end


      
    it "energy_import_in_targeted_import_share" do
      the_present.should be_within(0.293, some_tolerance)
      the_future.should  be_within(nil, some_tolerance)
      the_relative_increase.should be_within(nil, some_tolerance)
      the_absolute_increase.should be_within(nil, some_tolerance)
    end


      
    it "energy_used_for_heat_in_households" do
      the_present.should be_within(10.615, some_tolerance)
      the_future.should  be_within(10.615, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "eupvt_solar_panels_in_expert_predictions" do
      the_value.should be_within(nil, some_tolerance)
    end


      
    it "final_demand_greengas_agriculture_in_gas_flow_to_sectors" do
      the_value.should be_within(0.018, some_tolerance)
    end


      
    it "final_demand_greengas_buildings_in_gas_flow_to_sectors" do
      the_value.should be_within(0.112, some_tolerance)
    end


      
    it "final_demand_greengas_energy_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "final_demand_greengas_households_in_gas_flow_to_sectors" do
      the_value.should be_within(0.218, some_tolerance)
    end


      
    it "final_demand_greengas_industry_in_gas_flow_to_sectors" do
      the_value.should be_within(0.191, some_tolerance)
    end


      
    it "final_demand_greengas_other_in_gas_flow_to_sectors" do
      the_value.should be_within(0.035, some_tolerance)
    end


      
    it "final_demand_greengas_transport_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "final_demand_natural_gas_agriculture_in_gas_flow_to_sectors" do
      the_value.should be_within(30.082, some_tolerance)
    end


      
    it "final_demand_natural_gas_buildings_in_gas_flow_to_sectors" do
      the_value.should be_within(186.588, some_tolerance)
    end


      
    it "final_demand_natural_gas_energy_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "final_demand_natural_gas_households_in_gas_flow_to_sectors" do
      the_value.should be_within(361.542, some_tolerance)
    end


      
    it "final_demand_natural_gas_industry_in_gas_flow_to_sectors" do
      the_value.should be_within(316.309, some_tolerance)
    end


      
    it "final_demand_natural_gas_other_in_gas_flow_to_sectors" do
      the_value.should be_within(58.145, some_tolerance)
    end


      
    it "final_demand_natural_gas_transport_in_gas_flow_to_sectors" do
      the_value.should be_within(0.46, some_tolerance)
    end


      
    it "fossil_heat_in_source_of_heat_and_electricity_used_in_households" do
      the_present.should be_within(324.914, some_tolerance)
      the_future.should  be_within(324.914, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "fossil_heat_in_source_of_heat_production" do
      the_present.should be_within(1096.493, some_tolerance)
      the_future.should  be_within(1096.493, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "fossil_heat_in_use_of_final_demand_in_agriculture" do
      the_present.should be_within(94.659, some_tolerance)
      the_future.should  be_within(94.659, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "fossil_heat_in_use_of_final_demand_in_industry" do
      the_present.should be_within(436.446, some_tolerance)
      the_future.should  be_within(436.446, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "fossil_heat_in_use_of_final_demand_in_other_sector" do
      the_present.should be_within(81.331, some_tolerance)
      the_future.should  be_within(81.331, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "fridges_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(15.438, some_tolerance)
      the_future.should  be_within(15.438, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "fuel_cars_in_use_of_final_demand_in_transport" do
      the_present.should be_within(351.992, some_tolerance)
      the_future.should  be_within(351.992, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "fuel_cell_in_source_of_electricity_in_households" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "fuel_cost_in_breakdown_converter_costs" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "fuel_cost_in_breakdown_electricity_costs" do
      the_present.should be_within(5.996, some_tolerance)
      the_future.should  be_within(5.996, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "fuel_cost_in_breakdown_electricity_costs_corrected_for_electricity_imbalance" do
      the_present.should be_within(5.817, some_tolerance)
      the_future.should  be_within(5.817, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "fuel_cost_in_breakdown_heating_costs" do
      the_present.should be_within(8.472, some_tolerance)
      the_future.should  be_within(8.472, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "fuel_domestic_flights_in_use_of_final_demand_in_transport" do
      the_present.should be_within(2.1, some_tolerance)
      the_future.should  be_within(2.1, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "fuel_inland_navigation_in_use_of_final_demand_in_transport" do
      the_present.should be_within(6.6, some_tolerance)
      the_future.should  be_within(6.6, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "fuel_trains_in_use_of_final_demand_in_transport" do
      the_present.should be_within(1.43, some_tolerance)
      the_future.should  be_within(1.43, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "fuel_trucks_in_use_of_final_demand_in_transport" do
      the_present.should be_within(120.868, some_tolerance)
      the_future.should  be_within(120.868, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "fuels_in_breakdown_of_total_costs" do
      the_present.should be_within(9.459, some_tolerance)
      the_future.should  be_within(9.459, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "fuels_in_breakdown_of_total_costs_per_household" do
      the_present.should be_within(1286.966, some_tolerance)
      the_future.should  be_within(1286.966, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "future_demand_in_source_of_electricity_in_buildings" do
      the_value.should be_within(120.0, some_tolerance)
    end


      
    it "future_demand_in_source_of_electricity_in_households" do
      the_value.should be_within(88.93, some_tolerance)
    end


      
    it "future_demand_in_source_of_electricity_production" do
      the_value.should be_within(418.259, some_tolerance)
    end


      
    it "future_peak_electricity_demand" do
      the_value.should be_within(18900.383, some_tolerance)
    end


      
    it "future_total_investment_costs_power_production_corrected_for_imbalance" do
      the_value.should be_within(29262135987.086, some_tolerance)
    end


      
    it "gas_agriculture_in_mekko_of_final_demand" do
      the_present.should be_within(30.1, some_tolerance)
      the_future.should  be_within(30.1, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "gas_agriculture_in_mekko_of_primary_demand" do
      the_present.should be_within(131.551, some_tolerance)
      the_future.should  be_within(131.551, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "gas_buildings_in_mekko_of_final_demand" do
      the_present.should be_within(186.7, some_tolerance)
      the_future.should  be_within(186.7, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "gas_buildings_in_mekko_of_primary_demand" do
      the_present.should be_within(316.039, some_tolerance)
      the_future.should  be_within(316.039, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "gas_conversion_in_fuel_chain_emissions" do
      the_value.should be_within(55.279, some_tolerance)
    end


      
    it "gas_extraction_in_fuel_chain_emissions" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "gas_households_in_mekko_of_final_demand" do
      the_present.should be_within(361.76, some_tolerance)
      the_future.should  be_within(361.76, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "gas_households_in_mekko_of_primary_demand" do
      the_present.should be_within(464.586, some_tolerance)
      the_future.should  be_within(464.586, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "gas_in_future_energy_imports" do
      the_value.should be_within(203.415, some_tolerance)
    end


      
    it "gas_in_source_of_electricity_production" do
      the_present.should be_within(264.287, some_tolerance)
      the_future.should  be_within(264.287, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "gas_industry_in_mekko_of_final_demand" do
      the_present.should be_within(316.5, some_tolerance)
      the_future.should  be_within(316.5, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "gas_industry_in_mekko_of_primary_demand" do
      the_present.should be_within(645.296, some_tolerance)
      the_future.should  be_within(645.296, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "gas_other_in_mekko_of_final_demand" do
      the_present.should be_within(58.18, some_tolerance)
      the_future.should  be_within(58.18, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "gas_other_in_mekko_of_primary_demand" do
      the_present.should be_within(72.338, some_tolerance)
      the_future.should  be_within(72.338, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "gas_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(17.773, some_tolerance)
    end


      
    it "gas_plants_in_power_plant_properties" do
      the_value.should be_within(264.446, some_tolerance)
    end


      
    it "gas_plants_investm_in_power_plant_properties" do
      the_value.should be_within(14148.004, some_tolerance)
    end


      
    it "gas_plants_prod_in_power_plant_properties" do
      the_value.should be_within(264.446, some_tolerance)
    end


      
    it "gas_power_plants_plants_in_power_plant_properties" do
      the_value.should be_within(4021.263, some_tolerance)
    end


      
    it "gas_transport_in_mekko_of_final_demand" do
      the_present.should be_within(0.46, some_tolerance)
      the_future.should  be_within(0.46, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "gas_transport_in_mekko_of_primary_demand" do
      the_present.should be_within(6.299, some_tolerance)
      the_future.should  be_within(6.299, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "gas_transportation_in_fuel_chain_emissions" do
      the_value.should be_within(0.651, some_tolerance)
    end


      
    it "gas_treatment_in_fuel_chain_emissions" do
      the_value.should be_within(1.008, some_tolerance)
    end


      
    it "gas_value_in_present_energy_imports" do
      the_value.should be_within(-644.625, some_tolerance)
    end


      
    it "gasoline_in_use_of_transport_fuels" do
      the_present.should be_within(178.586, some_tolerance)
      the_future.should  be_within(178.586, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "geothermal_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(0.004, some_tolerance)
      the_future.should  be_within(0.004, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "geothermal_in_source_of_electricity_production" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "geothermal_in_source_of_heat_production" do
      the_present.should be_within(0.1, some_tolerance)
      the_future.should  be_within(0.1, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_agriculture_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.078, some_tolerance)
    end


      
    it "greengas_agriculture_in_gas_versus_other_primary_energy" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_agriculture_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_buildings_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.011, some_tolerance)
    end


      
    it "greengas_buildings_in_gas_versus_other_primary_energy" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_buildings_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_conversion_in_fuel_chain_emissions" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_energy_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.211, some_tolerance)
    end


      
    it "greengas_extraction_in_fuel_chain_emissions" do
      the_value.should be_within(17.827, some_tolerance)
    end


      
    it "greengas_households_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_households_in_gas_versus_other_primary_energy" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_households_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_in_gas_network_mix" do
      the_present.should be_within(0.979, some_tolerance)
      the_future.should  be_within(0.979, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_in_source_of_electricity_production" do
      the_present.should be_within(0.159, some_tolerance)
      the_future.should  be_within(0.159, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_in_use_of_transport_fuels" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_industry_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.132, some_tolerance)
    end


      
    it "greengas_industry_in_gas_versus_other_primary_energy" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_industry_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_other_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_other_in_gas_versus_other_primary_energy" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_other_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_to_electricity_production_agriculture_in_gas_flow_to_sectors" do
      the_value.should be_within(0.078, some_tolerance)
    end


      
    it "greengas_to_electricity_production_buildings_in_gas_flow_to_sectors" do
      the_value.should be_within(0.011, some_tolerance)
    end


      
    it "greengas_to_electricity_production_energy_in_gas_flow_to_sectors" do
      the_value.should be_within(0.211, some_tolerance)
    end


      
    it "greengas_to_electricity_production_households_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_to_electricity_production_industry_in_gas_flow_to_sectors" do
      the_value.should be_within(0.132, some_tolerance)
    end


      
    it "greengas_to_electricity_production_other_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_to_electricity_production_transport_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_transport_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_transport_in_gas_versus_other_primary_energy" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_transport_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_transportation_in_fuel_chain_emissions" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "greengas_treatment_in_fuel_chain_emissions" do
      the_value.should be_within(1.662, some_tolerance)
    end


      
    it "growth_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(227.41, some_tolerance)
      the_future.should  be_within(227.41, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_demand_buildings_in_effect_of_insulation_in_buildings" do
      the_present.should be_within(210.554, some_tolerance)
      the_future.should  be_within(210.554, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_demand_buildings_in_use_of_final_demand_in_buildings" do
      the_present.should be_within(151.599, some_tolerance)
      the_future.should  be_within(151.599, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_demand_including_electric_heating_in_effect_of_insulation_in_households" do
      the_present.should be_within(299.329, some_tolerance)
      the_future.should  be_within(299.329, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_demand_including_electric_heating_in_use_of_final_demand_in_households" do
      the_present.should be_within(299.329, some_tolerance)
      the_future.should  be_within(299.329, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_biomass_in_effect_of_insulation_in_households2" do
      the_present.should be_within(9.503, some_tolerance)
      the_future.should  be_within(9.503, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_biomass_in_source_of_heat_and_electricity_used_in_households" do
      the_present.should be_within(7.642, some_tolerance)
      the_future.should  be_within(7.642, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_biomass_in_source_of_heat_in_agriculture" do
      the_present.should be_within(0.658, some_tolerance)
      the_future.should  be_within(0.658, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_biomass_in_source_of_heat_in_buildings" do
      the_present.should be_within(0.07, some_tolerance)
      the_future.should  be_within(0.07, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_biomass_in_source_of_heat_in_industry" do
      the_present.should be_within(2.785, some_tolerance)
      the_future.should  be_within(2.785, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_biomass_in_source_of_heat_production" do
      the_present.should be_within(15.76, some_tolerance)
      the_future.should  be_within(15.76, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_biomass_in_use_of_final_demand_in_agriculture" do
      the_present.should be_within(0.658, some_tolerance)
      the_future.should  be_within(0.658, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_biomass_in_use_of_final_demand_in_industry" do
      the_present.should be_within(3.464, some_tolerance)
      the_future.should  be_within(3.464, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_biomass_in_use_of_final_demand_in_other_sector" do
      the_present.should be_within(1.88, some_tolerance)
      the_future.should  be_within(1.88, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_chp_in_source_of_heat_in_agriculture" do
      the_present.should be_within(55.0, some_tolerance)
      the_future.should  be_within(55.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_chp_in_source_of_heat_in_industry" do
      the_present.should be_within(153.04, some_tolerance)
      the_future.should  be_within(153.04, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_chp_in_source_of_heat_production" do
      the_present.should be_within(231.775, some_tolerance)
      the_future.should  be_within(231.775, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_chp_in_use_of_final_demand_in_industry" do
      the_present.should be_within(153.04, some_tolerance)
      the_future.should  be_within(153.04, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_coal_in_source_of_heat_in_industry" do
      the_present.should be_within(18.072, some_tolerance)
      the_future.should  be_within(18.072, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_district_heating_in_source_of_heat_used_in_households" do
      the_present.should be_within(9.266, some_tolerance)
      the_future.should  be_within(9.266, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_electricity_in_effect_of_insulation_in_households2" do
      the_present.should be_within(5.441, some_tolerance)
      the_future.should  be_within(5.441, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_electricity_in_source_of_heat_in_buildings" do
      the_present.should be_within(3.6, some_tolerance)
      the_future.should  be_within(3.6, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_electricity_in_source_of_heat_production" do
      the_present.should be_within(29.538, some_tolerance)
      the_future.should  be_within(29.538, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_electricity_in_source_of_heat_used_in_households" do
      the_present.should be_within(5.441, some_tolerance)
      the_future.should  be_within(5.441, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_fossil_fuels_in_effect_of_insulation_in_households2" do
      the_present.should be_within(285.544, some_tolerance)
      the_future.should  be_within(285.544, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_fossil_fuels_in_source_of_district_heating_in_buildings" do
      the_present.should be_within(8.995, some_tolerance)
      the_future.should  be_within(8.995, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_fossil_fuels_in_source_of_district_heating_in_households" do
      the_present.should be_within(11.354, some_tolerance)
      the_future.should  be_within(11.354, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_fossil_fuels_in_source_of_heat_in_buildings" do
      the_present.should be_within(140.814, some_tolerance)
      the_future.should  be_within(140.814, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_fossil_fuels_in_source_of_heat_used_in_households" do
      the_present.should be_within(273.799, some_tolerance)
      the_future.should  be_within(273.799, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_gas_in_source_of_heat_in_agriculture" do
      the_present.should be_within(27.074, some_tolerance)
      the_future.should  be_within(27.074, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_gas_in_source_of_heat_in_industry" do
      the_present.should be_within(200.489, some_tolerance)
      the_future.should  be_within(200.489, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_oil_in_source_of_heat_in_agriculture" do
      the_present.should be_within(12.619, some_tolerance)
      the_future.should  be_within(12.619, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_oil_in_source_of_heat_in_industry" do
      the_present.should be_within(158.605, some_tolerance)
      the_future.should  be_within(158.605, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_renewables_in_source_of_district_heating_in_buildings" do
      the_present.should be_within(0.005, some_tolerance)
      the_future.should  be_within(0.005, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_renewables_in_source_of_district_heating_in_households" do
      the_present.should be_within(0.006, some_tolerance)
      the_future.should  be_within(0.006, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_renewables_in_source_of_heat_used_in_buildings" do
      the_present.should be_within(7.254, some_tolerance)
      the_future.should  be_within(7.254, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_renewables_in_source_of_heat_used_in_households" do
      the_present.should be_within(10.823, some_tolerance)
      the_future.should  be_within(10.823, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_from_waste_in_source_of_heat_production" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_hot_water_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(12.45, some_tolerance)
      the_future.should  be_within(12.45, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_in_breakdown_of_total_costs" do
      the_present.should be_within(16.158, some_tolerance)
      the_future.should  be_within(16.158, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_in_breakdown_of_total_costs_per_household" do
      the_present.should be_within(2198.542, some_tolerance)
      the_future.should  be_within(2198.542, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_in_future_energy_imports" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "heat_in_use_of_electricity_in_buildings" do
      the_present.should be_within(3.6, some_tolerance)
      the_future.should  be_within(3.6, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heat_value_in_present_energy_imports" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "heatpumps_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(0.063, some_tolerance)
      the_future.should  be_within(0.063, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "heavy_fuel_oil_in_use_of_transport_fuels" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "high_voltage_network_in_annual_costs_of_infrastructure" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "hot_water_agriculture_in_mekko_of_final_demand" do
      the_present.should be_within(55.0, some_tolerance)
      the_future.should  be_within(55.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "hot_water_buildings_in_mekko_of_final_demand" do
      the_present.should be_within(9.0, some_tolerance)
      the_future.should  be_within(9.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "hot_water_demand_in_use_of_final_demand_in_households" do
      the_present.should be_within(95.748, some_tolerance)
      the_future.should  be_within(95.748, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "hot_water_from_district_heating_in_source_of_hot_water_in_households" do
      the_present.should be_within(2.238, some_tolerance)
      the_future.should  be_within(2.238, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "hot_water_from_electricity_in_source_of_hot_water_in_households" do
      the_present.should be_within(7.036, some_tolerance)
      the_future.should  be_within(7.036, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "hot_water_from_fossil_fuels_in_source_of_hot_water_in_households" do
      the_present.should be_within(85.482, some_tolerance)
      the_future.should  be_within(85.482, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "hot_water_from_renewables_in_source_of_hot_water_in_households" do
      the_present.should be_within(0.991, some_tolerance)
      the_future.should  be_within(0.991, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "hot_water_households_in_mekko_of_final_demand" do
      the_present.should be_within(11.36, some_tolerance)
      the_future.should  be_within(11.36, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "hot_water_industry_in_mekko_of_final_demand" do
      the_present.should be_within(153.04, some_tolerance)
      the_future.should  be_within(153.04, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "hot_water_other_in_mekko_of_final_demand" do
      the_present.should be_within(9.45, some_tolerance)
      the_future.should  be_within(9.45, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "hot_water_transport_in_mekko_of_final_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "hv_capacity_total_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "hv_mv_capacity_total_in_impact_on_electricity_grid" do
      the_value.should be_within(42000.0, some_tolerance)
    end


      
    it "hv_mv_capacity_used_in_impact_on_electricity_grid" do
      the_value.should be_within(30000.0, some_tolerance)
    end


      
    it "hv_mv_costs_coefficient_in_impact_on_electricity_grid" do
      the_value.should be_within(53846.154, some_tolerance)
    end


      
    it "hv_mv_delta_peak_load_max_in_impact_on_electricity_grid" do
      the_value.should be_within(0.822, some_tolerance)
    end


      
    it "hv_mv_networkcosts_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "hv_mv_required_expansion_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "hv_net_in_additional_infrastructure_investments" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(nil, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "hydro_in_source_of_electricity_production" do
      the_present.should be_within(0.36, some_tolerance)
      the_future.should  be_within(0.36, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "imported_electricity_agriculture_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "imported_electricity_buildings_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "imported_electricity_households_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "imported_electricity_industry_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "imported_electricity_other_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "imported_electricity_transport_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "imported_heat_in_source_of_heat_production" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "insulation_savings_buildings_in_effect_of_insulation_in_buildings" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "insulation_savings_new_houses_in_effect_of_insulation_in_households" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "insulation_savings_old_houses_in_effect_of_insulation_in_households" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "investment_for_biomass_chp_in_overview_costs_of_electricity_production" do
      the_value.should be_within(2.06, some_tolerance)
    end


      
    it "investment_for_co_firing_coal_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.789, some_tolerance)
    end


      
    it "investment_for_coal_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(2.434, some_tolerance)
    end


      
    it "investment_for_coal_chp_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.7, some_tolerance)
    end


      
    it "investment_for_coal_conventional_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.997, some_tolerance)
    end


      
    it "investment_for_coal_igcc_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(2.64, some_tolerance)
    end


      
    it "investment_for_coal_igcc_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.967, some_tolerance)
    end


      
    it "investment_for_coal_lignite_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.3, some_tolerance)
    end


      
    it "investment_for_coal_oxyfuel_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(3.795, some_tolerance)
    end


      
    it "investment_for_coal_powder_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.563, some_tolerance)
    end


      
    it "investment_for_gas_ccgt_ccs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.094, some_tolerance)
    end


      
    it "investment_for_gas_ccgt_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.765, some_tolerance)
    end


      
    it "investment_for_gas_chp_central_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.043, some_tolerance)
    end


      
    it "investment_for_gas_chp_industry_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.844, some_tolerance)
    end


      
    it "investment_for_gas_conventional_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.4, some_tolerance)
    end


      
    it "investment_for_gas_turbine_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.547, some_tolerance)
    end


      
    it "investment_for_geothermal_well_in_overview_costs_of_electricity_production" do
      the_value.should be_within(12.924, some_tolerance)
    end


      
    it "investment_for_hydro_mountain_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.236, some_tolerance)
    end


      
    it "investment_for_hydro_river_in_overview_costs_of_electricity_production" do
      the_value.should be_within(3.6, some_tolerance)
    end


      
    it "investment_for_nuclear_3rd_generation_in_overview_costs_of_electricity_production" do
      the_value.should be_within(3.094, some_tolerance)
    end


      
    it "investment_for_nuclear_conventional_in_overview_costs_of_electricity_production" do
      the_value.should be_within(2.0, some_tolerance)
    end


      
    it "investment_for_oil_plant_in_overview_costs_of_electricity_production" do
      the_value.should be_within(0.5, some_tolerance)
    end


      
    it "investment_for_solar_csp_in_overview_costs_of_electricity_production" do
      the_value.should be_within(3.5, some_tolerance)
    end


      
    it "investment_for_solar_pv_centrally_in_overview_costs_of_electricity_production" do
      the_value.should be_within(2.489, some_tolerance)
    end


      
    it "investment_for_solar_pv_on_roofs_in_overview_costs_of_electricity_production" do
      the_value.should be_within(nil, some_tolerance)
    end


      
    it "investment_for_waste_incinerator_in_overview_costs_of_electricity_production" do
      the_value.should be_within(4.639, some_tolerance)
    end


      
    it "investment_for_wind_coastal_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.392, some_tolerance)
    end


      
    it "investment_for_wind_inland_in_overview_costs_of_electricity_production" do
      the_value.should be_within(1.392, some_tolerance)
    end


      
    it "investment_for_wind_offshore_in_overview_costs_of_electricity_production" do
      the_value.should be_within(3.903, some_tolerance)
    end


      
    it "kerosine_in_use_of_transport_fuels" do
      the_present.should be_within(2.0, some_tolerance)
      the_future.should  be_within(2.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "lighting_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(26.412, some_tolerance)
      the_future.should  be_within(26.412, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "lighting_in_use_of_electricity_in_buildings" do
      the_present.should be_within(72.0, some_tolerance)
      the_future.should  be_within(72.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "lighting_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(14.229, some_tolerance)
      the_future.should  be_within(14.229, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "lignite_agriculture_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "lignite_buildings_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "lignite_households_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "lignite_industry_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "lignite_other_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "lignite_transport_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "low_voltage_network_in_annual_costs_of_infrastructure" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "lpg_in_use_of_transport_fuels" do
      the_present.should be_within(13.6, some_tolerance)
      the_future.should  be_within(13.6, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "lv_capacity_total_in_impact_on_electricity_grid" do
      the_value.should be_within(74803.2, some_tolerance)
    end


      
    it "lv_capacity_used_in_impact_on_electricity_grid" do
      the_value.should be_within(23376.0, some_tolerance)
    end


      
    it "lv_costs_coefficient_in_impact_on_electricity_grid" do
      the_value.should be_within(457051.659, some_tolerance)
    end


      
    it "lv_delta_peak_load_max_in_impact_on_electricity_grid" do
      the_value.should be_within(1.677, some_tolerance)
    end


      
    it "lv_mv_transformer_in_additional_infrastructure_investments" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "lv_net_in_additional_infrastructure_investments" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "lv_networkcosts_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "lv_required_expansion_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "media_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(13.784, some_tolerance)
      the_future.should  be_within(13.784, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "medium_voltage_network_in_annual_costs_of_infrastructure" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_central_gas_chp_capacity_in_merit_order_table" do
      the_value.should be_within(3035.755, some_tolerance)
    end


      
    it "merit_order_central_gas_chp_full_load_hours_in_merit_order_table" do
      the_present.should be_within(1118.0, some_tolerance)
      the_future.should  be_within(1118.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_central_gas_chp_operating_costs_in_merit_order_table" do
      the_value.should be_within(60.306, some_tolerance)
    end


      
    it "merit_order_central_gas_chp_position_in_merit_order_table" do
      the_value.should be_within(6.0, some_tolerance)
    end


      
    it "merit_order_central_gas_chp_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(1118.0, some_tolerance)
    end


      
    it "merit_order_co_firing_coal_capacity_in_merit_order_table" do
      the_present.should be_within(nil, some_tolerance)
      the_future.should  be_within(nil, some_tolerance)
      the_relative_increase.should be_within(nil, some_tolerance)
      the_absolute_increase.should be_within(nil, some_tolerance)
    end


      
    it "merit_order_co_firing_coal_full_load_hours_in_merit_order_table" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_co_firing_coal_operating_costs_in_merit_order_table" do
      the_value.should be_within(76.541, some_tolerance)
    end


      
    it "merit_order_co_firing_coal_position_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_co_firing_coal_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_coal_chp_capacity_in_merit_order_table" do
      the_value.should be_within(1484.8, some_tolerance)
    end


      
    it "merit_order_coal_chp_full_load_hours_in_merit_order_table" do
      the_present.should be_within(7708.8, some_tolerance)
      the_future.should  be_within(7708.8, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_coal_chp_operating_costs_in_merit_order_table" do
      the_value.should be_within(26.469, some_tolerance)
    end


      
    it "merit_order_coal_chp_position_in_merit_order_table" do
      the_value.should be_within(3.0, some_tolerance)
    end


      
    it "merit_order_coal_chp_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(7708.8, some_tolerance)
    end


      
    it "merit_order_coal_conv_capacity_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_coal_conv_full_load_hours_in_merit_order_table" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_coal_conv_operating_costs_in_merit_order_table" do
      the_value.should be_within(29.91, some_tolerance)
    end


      
    it "merit_order_coal_conv_position_in_merit_order_table" do
      the_value.should be_within(1000.0, some_tolerance)
    end


      
    it "merit_order_coal_conv_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_coal_igcc_capacity_in_merit_order_table" do
      the_value.should be_within(232.347, some_tolerance)
    end


      
    it "merit_order_coal_igcc_ccs_capacity_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_coal_igcc_ccs_full_load_hours_in_merit_order_table" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_coal_igcc_ccs_operating_costs_in_merit_order_table" do
      the_value.should be_within(28.369, some_tolerance)
    end


      
    it "merit_order_coal_igcc_ccs_position_in_merit_order_table" do
      the_value.should be_within(1000.0, some_tolerance)
    end


      
    it "merit_order_coal_igcc_ccs_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_coal_igcc_full_load_hours_in_merit_order_table" do
      the_present.should be_within(7884.0, some_tolerance)
      the_future.should  be_within(7884.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_coal_igcc_operating_costs_in_merit_order_table" do
      the_value.should be_within(23.206, some_tolerance)
    end


      
    it "merit_order_coal_igcc_position_in_merit_order_table" do
      the_value.should be_within(2.0, some_tolerance)
    end


      
    it "merit_order_coal_igcc_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(7884.0, some_tolerance)
    end


      
    it "merit_order_coal_pwd_capacity_in_merit_order_table" do
      the_value.should be_within(2387.556, some_tolerance)
    end


      
    it "merit_order_coal_pwd_ccs_capacity_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_coal_pwd_ccs_full_load_hours_in_merit_order_table" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_coal_pwd_ccs_operating_costs_in_merit_order_table" do
      the_value.should be_within(34.971, some_tolerance)
    end


      
    it "merit_order_coal_pwd_ccs_position_in_merit_order_table" do
      the_value.should be_within(1000.0, some_tolerance)
    end


      
    it "merit_order_coal_pwd_ccs_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_coal_pwd_full_load_hours_in_merit_order_table" do
      the_present.should be_within(7606.9, some_tolerance)
      the_future.should  be_within(7606.9, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_coal_pwd_operating_costs_in_merit_order_table" do
      the_value.should be_within(31.525, some_tolerance)
    end


      
    it "merit_order_coal_pwd_position_in_merit_order_table" do
      the_value.should be_within(4.0, some_tolerance)
    end


      
    it "merit_order_coal_pwd_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(7606.9, some_tolerance)
    end


      
    it "merit_order_gas_ccgt_capacity_in_merit_order_table" do
      the_value.should be_within(3675.306, some_tolerance)
    end


      
    it "merit_order_gas_ccgt_ccs_capacity_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_gas_ccgt_ccs_full_load_hours_in_merit_order_table" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_gas_ccgt_ccs_operating_costs_in_merit_order_table" do
      the_value.should be_within(57.259, some_tolerance)
    end


      
    it "merit_order_gas_ccgt_ccs_position_in_merit_order_table" do
      the_value.should be_within(1000.0, some_tolerance)
    end


      
    it "merit_order_gas_ccgt_ccs_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_gas_ccgt_full_load_hours_in_merit_order_table" do
      the_present.should be_within(4942.2, some_tolerance)
      the_future.should  be_within(4942.2, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_gas_ccgt_operating_costs_in_merit_order_table" do
      the_value.should be_within(44.224, some_tolerance)
    end


      
    it "merit_order_gas_ccgt_position_in_merit_order_table" do
      the_value.should be_within(5.0, some_tolerance)
    end


      
    it "merit_order_gas_ccgt_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(4942.2, some_tolerance)
    end


      
    it "merit_order_gas_conv_capacity_in_merit_order_table" do
      the_value.should be_within(3437.737, some_tolerance)
    end


      
    it "merit_order_gas_conv_full_load_hours_in_merit_order_table" do
      the_present.should be_within(101.6, some_tolerance)
      the_future.should  be_within(101.6, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_gas_conv_operating_costs_in_merit_order_table" do
      the_value.should be_within(65.874, some_tolerance)
    end


      
    it "merit_order_gas_conv_position_in_merit_order_table" do
      the_value.should be_within(7.0, some_tolerance)
    end


      
    it "merit_order_gas_conv_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(101.6, some_tolerance)
    end


      
    it "merit_order_gas_turbine_capacity_in_merit_order_table" do
      the_value.should be_within(192.531, some_tolerance)
    end


      
    it "merit_order_gas_turbine_full_load_hours_in_merit_order_table" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_gas_turbine_operating_costs_in_merit_order_table" do
      the_value.should be_within(77.979, some_tolerance)
    end


      
    it "merit_order_gas_turbine_position_in_merit_order_table" do
      the_value.should be_within(8.0, some_tolerance)
    end


      
    it "merit_order_gas_turbine_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_must_run_capacity_in_merit_order_table" do
      the_value.should be_within(7295.855, some_tolerance)
    end


      
    it "merit_order_must_run_full_load_hours_in_merit_order_table" do
      the_present.should be_within(4825.427, some_tolerance)
      the_future.should  be_within(4825.427, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_must_run_operating_costs_in_merit_order_table" do
      the_value.should be_within(88.102, some_tolerance)
    end


      
    it "merit_order_must_run_position_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_must_run_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(4825.427, some_tolerance)
    end


      
    it "merit_order_nuclear_iii_capacity_in_merit_order_table" do
      the_value.should be_within(473.344, some_tolerance)
    end


      
    it "merit_order_nuclear_iii_full_load_hours_in_merit_order_table" do
      the_present.should be_within(7884.0, some_tolerance)
      the_future.should  be_within(7884.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_nuclear_iii_operating_costs_in_merit_order_table" do
      the_value.should be_within(5.826, some_tolerance)
    end


      
    it "merit_order_nuclear_iii_position_in_merit_order_table" do
      the_value.should be_within(1.0, some_tolerance)
    end


      
    it "merit_order_nuclear_iii_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(7884.0, some_tolerance)
    end


      
    it "merit_order_oil_plant_capacity_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_oil_plant_full_load_hours_in_merit_order_table" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_oil_plant_operating_costs_in_merit_order_table" do
      the_value.should be_within(93.093, some_tolerance)
    end


      
    it "merit_order_oil_plant_position_in_merit_order_table" do
      the_value.should be_within(1000.0, some_tolerance)
    end


      
    it "merit_order_oil_plant_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_solar_pv_capacity_in_merit_order_table" do
      the_value.should be_within(112.45, some_tolerance)
    end


      
    it "merit_order_solar_pv_full_load_hours_in_merit_order_table" do
      the_present.should be_within(1050.0, some_tolerance)
      the_future.should  be_within(1050.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_solar_pv_operating_costs_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_solar_pv_position_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_solar_pv_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(1050.0, some_tolerance)
    end


      
    it "merit_order_wind_turbines_capacity_in_merit_order_table" do
      the_value.should be_within(1394.743, some_tolerance)
    end


      
    it "merit_order_wind_turbines_full_load_hours_in_merit_order_table" do
      the_present.should be_within(2699.612, some_tolerance)
      the_future.should  be_within(2699.612, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_wind_turbines_operating_costs_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_wind_turbines_position_in_merit_order_table" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "merit_order_wind_turbines_present_full_load_hours_in_merit_order_table" do
      the_value.should be_within(2699.612, some_tolerance)
    end


      
    it "micro_chp_in_comparison_of_demand_micro_chp_versus_conventional" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "micro_chp_in_source_of_electricity_in_households" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "minimum_available_capacity_in_security_of_supply" do
      the_present.should be_within(19724.755, some_tolerance)
      the_future.should  be_within(19724.755, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "mv_distribution_capacity_total_in_impact_on_electricity_grid" do
      the_value.should be_within(30301.7, some_tolerance)
    end


      
    it "mv_distribution_capacity_used_in_impact_on_electricity_grid" do
      the_value.should be_within(20619.5, some_tolerance)
    end


      
    it "mv_distribution_costs_coefficient_in_impact_on_electricity_grid" do
      the_value.should be_within(200000.0, some_tolerance)
    end


      
    it "mv_distribution_delta_peak_load_max_in_impact_on_electricity_grid" do
      the_value.should be_within(0.822, some_tolerance)
    end


      
    it "mv_distribution_in_additional_infrastructure_investments" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "mv_distribution_networkcosts_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "mv_distribution_required_expansion_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "mv_hv_transformer_in_additional_infrastructure_investments" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "mv_transport_capacity_total_in_impact_on_electricity_grid" do
      the_value.should be_within(21340.0, some_tolerance)
    end


      
    it "mv_transport_capacity_used_in_impact_on_electricity_grid" do
      the_value.should be_within(16490.0, some_tolerance)
    end


      
    it "mv_transport_costs_coefficient_in_impact_on_electricity_grid" do
      the_value.should be_within(150000.0, some_tolerance)
    end


      
    it "mv_transport_delta_peak_load_max_in_impact_on_electricity_grid" do
      the_value.should be_within(0.822, some_tolerance)
    end


      
    it "mv_transport_in_additional_infrastructure_investments" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "mv_transport_networkcosts_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "mv_transport_required_expansion_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "mvlv_capacity_total_in_impact_on_electricity_grid" do
      the_value.should be_within(42076.8, some_tolerance)
    end


      
    it "mvlv_capacity_used_in_impact_on_electricity_grid" do
      the_value.should be_within(25713.6, some_tolerance)
    end


      
    it "mvlv_costs_coefficient_in_impact_on_electricity_grid" do
      the_value.should be_within(85000.0, some_tolerance)
    end


      
    it "mvlv_delta_peak_load_max_in_impact_on_electricity_grid" do
      the_value.should be_within(1.174, some_tolerance)
    end


      
    it "mvlv_networkcosts_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "mvlv_required_expansion_in_impact_on_electricity_grid" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "natural_gas_agriculture_in_gas_use_for_electricity_production" do
      the_value.should be_within(120.438, some_tolerance)
    end


      
    it "natural_gas_agriculture_in_gas_versus_other_primary_energy" do
      the_present.should be_within(131.551, some_tolerance)
      the_future.should  be_within(131.551, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "natural_gas_buildings_in_gas_use_for_electricity_production" do
      the_value.should be_within(17.71, some_tolerance)
    end


      
    it "natural_gas_buildings_in_gas_versus_other_primary_energy" do
      the_present.should be_within(316.039, some_tolerance)
      the_future.should  be_within(316.039, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "natural_gas_energy_in_gas_use_for_electricity_production" do
      the_value.should be_within(326.195, some_tolerance)
    end


      
    it "natural_gas_households_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "natural_gas_households_in_gas_versus_other_primary_energy" do
      the_present.should be_within(464.586, some_tolerance)
      the_future.should  be_within(464.586, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "natural_gas_in_gas_network_mix" do
      the_present.should be_within(1624.34, some_tolerance)
      the_future.should  be_within(1624.34, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "natural_gas_in_use_of_transport_fuels" do
      the_present.should be_within(0.46, some_tolerance)
      the_future.should  be_within(0.46, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "natural_gas_industry_in_gas_use_for_electricity_production" do
      the_value.should be_within(203.698, some_tolerance)
    end


      
    it "natural_gas_industry_in_gas_versus_other_primary_energy" do
      the_present.should be_within(645.296, some_tolerance)
      the_future.should  be_within(645.296, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "natural_gas_other_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "natural_gas_other_in_gas_versus_other_primary_energy" do
      the_present.should be_within(72.338, some_tolerance)
      the_future.should  be_within(72.338, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "natural_gas_to_electricity_production_agriculture_in_gas_flow_to_sectors" do
      the_value.should be_within(120.438, some_tolerance)
    end


      
    it "natural_gas_to_electricity_production_buildings_in_gas_flow_to_sectors" do
      the_value.should be_within(17.71, some_tolerance)
    end


      
    it "natural_gas_to_electricity_production_energy_in_gas_flow_to_sectors" do
      the_value.should be_within(326.195, some_tolerance)
    end


      
    it "natural_gas_to_electricity_production_households_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "natural_gas_to_electricity_production_industry_in_gas_flow_to_sectors" do
      the_value.should be_within(203.698, some_tolerance)
    end


      
    it "natural_gas_to_electricity_production_other_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "natural_gas_to_electricity_production_transport_in_gas_flow_to_sectors" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "natural_gas_transport_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "natural_gas_transport_in_gas_versus_other_primary_energy" do
      the_present.should be_within(6.299, some_tolerance)
      the_future.should  be_within(6.299, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "net_electricity_export" do
      the_present.should be_within(12.252, some_tolerance)
      the_future.should  be_within(12.252, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "net_electricity_import" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "network_in_breakdown_of_total_costs" do
      the_present.should be_within(3.262, some_tolerance)
      the_future.should  be_within(3.262, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "network_in_breakdown_of_total_costs_per_household" do
      the_present.should be_within(443.84, some_tolerance)
      the_future.should  be_within(443.84, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "new_residences_in_number_of_residences" do
      the_present.should be_within(1121208.0, some_tolerance)
      the_future.should  be_within(1121208.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "non_energetic_fuels_in_breakdown_of_total_costs" do
      the_present.should be_within(7.081, some_tolerance)
      the_future.should  be_within(7.081, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "non_energetic_fuels_in_breakdown_of_total_costs_per_household" do
      the_present.should be_within(963.499, some_tolerance)
      the_future.should  be_within(963.499, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "non_energetic_oil_in_use_of_final_demand_in_industry" do
      the_present.should be_within(536.76, some_tolerance)
      the_future.should  be_within(536.76, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "non_energetic_other_in_use_of_final_demand_in_industry" do
      the_present.should be_within(173.76, some_tolerance)
      the_future.should  be_within(173.76, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "non_energetic_use_in_use_of_final_demand_in_other_sector" do
      the_present.should be_within(3.38, some_tolerance)
      the_future.should  be_within(3.38, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "nuclear_in_source_of_electricity_production" do
      the_present.should be_within(14.4, some_tolerance)
      the_future.should  be_within(14.4, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "nuclear_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(0.526, some_tolerance)
    end


      
    it "nuclear_plants_in_power_plant_properties" do
      the_value.should be_within(14.4, some_tolerance)
    end


      
    it "nuclear_plants_investm_in_power_plant_properties" do
      the_value.should be_within(1577.813, some_tolerance)
    end


      
    it "nuclear_plants_plants_in_power_plant_properties" do
      the_value.should be_within(0.319, some_tolerance)
    end


      
    it "nuclear_plants_prod_in_power_plant_properties" do
      the_value.should be_within(14.4, some_tolerance)
    end


      
    it "offshore_in_targeted_area_use_for_wind_turbines" do
      the_present.should be_within(0.285, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-0.3, some_tolerance)
    end


      
    it "oil_agriculture_in_mekko_of_final_demand" do
      the_present.should be_within(16.0, some_tolerance)
      the_future.should  be_within(16.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "oil_agriculture_in_mekko_of_primary_demand" do
      the_present.should be_within(16.0, some_tolerance)
      the_future.should  be_within(16.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "oil_buildings_in_mekko_of_final_demand" do
      the_present.should be_within(10.0, some_tolerance)
      the_future.should  be_within(10.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "oil_buildings_in_mekko_of_primary_demand" do
      the_present.should be_within(10.0, some_tolerance)
      the_future.should  be_within(10.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "oil_households_in_mekko_of_final_demand" do
      the_present.should be_within(4.37, some_tolerance)
      the_future.should  be_within(4.37, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "oil_households_in_mekko_of_primary_demand" do
      the_present.should be_within(4.37, some_tolerance)
      the_future.should  be_within(4.37, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "oil_in_future_energy_imports" do
      the_value.should be_within(1260.135, some_tolerance)
    end


      
    it "oil_in_source_of_electricity_production" do
      the_present.should be_within(6.634, some_tolerance)
      the_future.should  be_within(6.634, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "oil_industry_in_mekko_of_final_demand" do
      the_present.should be_within(727.85, some_tolerance)
      the_future.should  be_within(727.85, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "oil_industry_in_mekko_of_primary_demand" do
      the_present.should be_within(752.42, some_tolerance)
      the_future.should  be_within(752.42, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "oil_other_in_mekko_of_final_demand" do
      the_present.should be_within(9.17, some_tolerance)
      the_future.should  be_within(9.17, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "oil_other_in_mekko_of_primary_demand" do
      the_present.should be_within(9.17, some_tolerance)
      the_future.should  be_within(9.17, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "oil_power_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(0.339, some_tolerance)
    end


      
    it "oil_power_plants_in_power_plant_properties" do
      the_value.should be_within(6.634, some_tolerance)
    end


      
    it "oil_power_plants_investment_in_power_plant_properties" do
      the_value.should be_within(364.137, some_tolerance)
    end


      
    it "oil_power_plants_plants_in_power_plant_properties" do
      the_value.should be_within(13.312, some_tolerance)
    end


      
    it "oil_power_plants_prod_in_power_plant_properties" do
      the_value.should be_within(6.634, some_tolerance)
    end


      
    it "oil_transport_in_mekko_of_final_demand" do
      the_present.should be_within(475.773, some_tolerance)
      the_future.should  be_within(475.773, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "oil_transport_in_mekko_of_primary_demand" do
      the_present.should be_within(512.68, some_tolerance)
      the_future.should  be_within(512.68, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "oil_value_in_present_energy_imports" do
      the_value.should be_within(1225.658, some_tolerance)
    end


      
    it "old_residences_in_number_of_residences" do
      the_present.should be_within(6228292.0, some_tolerance)
      the_future.should  be_within(6228292.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "onshore_in_targeted_area_use_for_wind_turbines" do
      the_present.should be_within(0.633, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-0.6, some_tolerance)
    end


      
    it "operation_maintenance_cost_in_breakdown_converter_costs" do
      the_present.should be_within(0.068, some_tolerance)
      the_future.should  be_within(0.068, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "operation_maintenance_cost_in_breakdown_electricity_costs" do
      the_present.should be_within(0.861, some_tolerance)
      the_future.should  be_within(0.861, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "operation_maintenance_cost_in_breakdown_electricity_costs_corrected_for_electricity_imbalance" do
      the_present.should be_within(0.835, some_tolerance)
      the_future.should  be_within(0.835, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "operation_maintenance_cost_in_breakdown_heating_costs" do
      the_present.should be_within(2.871, some_tolerance)
      the_future.should  be_within(2.871, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "other_agriculture_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "other_agriculture_in_gas_versus_other_primary_energy" do
      the_present.should be_within(17.402, some_tolerance)
      the_future.should  be_within(17.402, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "other_buildings_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.12, some_tolerance)
    end


      
    it "other_buildings_in_gas_versus_other_primary_energy" do
      the_present.should be_within(134.773, some_tolerance)
      the_future.should  be_within(134.773, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "other_energy_in_gas_use_for_electricity_production" do
      the_value.should be_within(364.749, some_tolerance)
    end


      
    it "other_heat_in_source_of_heat_and_electricity_in_agriculture" do
      the_present.should be_within(42.371, some_tolerance)
      the_future.should  be_within(42.371, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "other_heat_in_source_of_heat_and_electricity_in_industry" do
      the_present.should be_within(370.567, some_tolerance)
      the_future.should  be_within(370.567, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "other_heat_in_source_of_heat_and_electricity_in_other_sector" do
      the_present.should be_within(74.107, some_tolerance)
      the_future.should  be_within(74.107, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "other_households_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "other_households_in_gas_versus_other_primary_energy" do
      the_present.should be_within(114.553, some_tolerance)
      the_future.should  be_within(114.553, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "other_in_use_of_final_electricity_demand_in_households" do
      the_present.should be_within(3.86, some_tolerance)
      the_future.should  be_within(3.86, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "other_industry_in_gas_use_for_electricity_production" do
      the_value.should be_within(56.97, some_tolerance)
    end


      
    it "other_industry_in_gas_versus_other_primary_energy" do
      the_present.should be_within(995.121, some_tolerance)
      the_future.should  be_within(995.121, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "other_other_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "other_other_in_gas_versus_other_primary_energy" do
      the_present.should be_within(25.319, some_tolerance)
      the_future.should  be_within(25.319, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "other_plants_capacity_in_power_plant_properties" do
      the_value.should be_within(0.801, some_tolerance)
    end


      
    it "other_plants_in_power_plant_properties" do
      the_value.should be_within(14.76, some_tolerance)
    end


      
    it "other_plants_investm_in_power_plant_properties" do
      the_value.should be_within(3292.905, some_tolerance)
    end


      
    it "other_plants_plants_in_power_plant_properties" do
      the_value.should be_within(130.134, some_tolerance)
    end


      
    it "other_plants_prod_in_power_plant_properties" do
      the_value.should be_within(14.76, some_tolerance)
    end


      
    it "other_transport_in_gas_use_for_electricity_production" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "other_transport_in_gas_versus_other_primary_energy" do
      the_present.should be_within(529.017, some_tolerance)
      the_future.should  be_within(529.017, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "percentage_renewable_electricity_in_renewable_electricity_share" do
      the_present.should be_within(9.877, some_tolerance)
      the_future.should  be_within(9.877, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "percentage_renewables_in_renewability" do
      the_present.should be_within(3.605, some_tolerance)
      the_future.should  be_within(3.605, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "power_plants_plants_in_power_plant_properties" do
      the_value.should be_within(4673.193, some_tolerance)
    end


      
    it "present_demand_in_source_of_electricity_in_buildings" do
      the_value.should be_within(120.0, some_tolerance)
    end


      
    it "present_demand_in_source_of_electricity_in_households" do
      the_value.should be_within(88.93, some_tolerance)
    end


      
    it "present_demand_in_source_of_electricity_production" do
      the_value.should be_within(418.259, some_tolerance)
    end


      
    it "present_peak_electricity_demand" do
      the_value.should be_within(18900.383, some_tolerance)
    end


      
    it "present_value_in_changes_in_centrally_produced_electricity" do
      the_value.should be_within(402.85, some_tolerance)
    end


      
    it "primary_energy_in_use_of_primary_energy" do
      the_present.should be_within(3452.295, some_tolerance)
      the_future.should  be_within(3452.295, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "primary_energy_of_electricity_export_in_use_of_primary_energy" do
      the_present.should be_within(25.389, some_tolerance)
      the_future.should  be_within(25.389, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "pv_in_targeted_area_use_for_solar_power" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "roof_use_in_targeted_area_use_for_solar_power" do
      the_present.should be_within(0.287, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(-100.0, some_tolerance)
      the_absolute_increase.should be_within(-0.3, some_tolerance)
    end


      
    it "share_of_households_in_final_demand" do
      the_present.should be_within(0.161, some_tolerance)
      the_future.should  be_within(0.161, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "solar_in_source_of_electricity_production" do
      the_present.should be_within(0.36, some_tolerance)
      the_future.should  be_within(0.36, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "solar_panels_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(-0.36, some_tolerance)
      the_future.should  be_within(-0.36, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "solar_panels_in_source_of_electricity_in_buildings" do
      the_present.should be_within(0.12, some_tolerance)
      the_future.should  be_within(0.12, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "solar_panels_in_source_of_electricity_in_households" do
      the_present.should be_within(0.24, some_tolerance)
      the_future.should  be_within(0.24, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "sts_coal_plants_in_expert_predictions" do
      the_value.should be_within(51.288, some_tolerance)
    end


      
    it "sts_gas_plants_in_expert_predictions" do
      the_value.should be_within(58.436, some_tolerance)
    end


      
    it "sustainable_electricity_agriculture_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "sustainable_electricity_buildings_in_mekko_of_primary_demand" do
      the_present.should be_within(5.428, some_tolerance)
      the_future.should  be_within(5.428, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "sustainable_electricity_households_in_mekko_of_primary_demand" do
      the_present.should be_within(4.365, some_tolerance)
      the_future.should  be_within(4.365, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "sustainable_electricity_industry_in_mekko_of_primary_demand" do
      the_present.should be_within(4.295, some_tolerance)
      the_future.should  be_within(4.295, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "sustainable_electricity_other_in_mekko_of_primary_demand" do
      the_present.should be_within(0.067, some_tolerance)
      the_future.should  be_within(0.067, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "sustainable_electricity_transport_in_mekko_of_primary_demand" do
      the_present.should be_within(0.289, some_tolerance)
      the_future.should  be_within(0.289, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "target_in_co2_emissions_with_import_and_export" do
      the_present.should be_within(nil, some_tolerance)
      the_future.should  be_within(nil, some_tolerance)
      the_relative_increase.should be_within(nil, some_tolerance)
      the_absolute_increase.should be_within(nil, some_tolerance)
    end


      
    it "total_investment_costs_power_production" do
      the_present.should be_within(30165576437.087, some_tolerance)
      the_future.should  be_within(30165576437.087, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "total_investment_costs_power_production_corrected_for_imbalance" do
      the_present.should be_within(29262135987.086, some_tolerance)
      the_future.should  be_within(29262135987.086, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "total_plants_investm_in_power_plant_properties" do
      the_value.should be_within(30165.576, some_tolerance)
    end


      
    it "total_plants_prod_future_in_power_plant_properties" do
      the_value.should be_within(431.172, some_tolerance)
    end


      
    it "total_plants_prod_present_in_power_plant_properties" do
      the_value.should be_within(431.172, some_tolerance)
    end


      
    it "trains_in_changes_in_centrally_produced_electricity" do
      the_present.should be_within(6.2, some_tolerance)
      the_future.should  be_within(6.2, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "uranium_agriculture_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "uranium_buildings_in_mekko_of_primary_demand" do
      the_present.should be_within(14.455, some_tolerance)
      the_future.should  be_within(14.455, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "uranium_conversion_in_fuel_chain_emissions" do
      the_value.should be_within(0.0, some_tolerance)
    end


      
    it "uranium_extraction_in_fuel_chain_emissions" do
      the_value.should be_within(0.005, some_tolerance)
    end


      
    it "uranium_households_in_mekko_of_primary_demand" do
      the_present.should be_within(11.233, some_tolerance)
      the_future.should  be_within(11.233, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "uranium_in_future_energy_imports" do
      the_value.should be_within(40.0, some_tolerance)
    end


      
    it "uranium_industry_in_mekko_of_primary_demand" do
      the_present.should be_within(11.696, some_tolerance)
      the_future.should  be_within(11.696, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "uranium_other_in_mekko_of_primary_demand" do
      the_present.should be_within(0.182, some_tolerance)
      the_future.should  be_within(0.182, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "uranium_transport_in_mekko_of_primary_demand" do
      the_present.should be_within(0.788, some_tolerance)
      the_future.should  be_within(0.788, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "uranium_transportation_in_fuel_chain_emissions" do
      the_value.should be_within(0.004, some_tolerance)
    end


      
    it "uranium_treatment_in_fuel_chain_emissions" do
      the_value.should be_within(0.154, some_tolerance)
    end


      
    it "uranium_value_in_present_energy_imports" do
      the_value.should be_within(40.0, some_tolerance)
    end


      
    it "waste_agriculture_in_mekko_of_final_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "waste_agriculture_in_mekko_of_primary_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "waste_buildings_in_mekko_of_final_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "waste_buildings_in_mekko_of_primary_demand" do
      the_present.should be_within(20.294, some_tolerance)
      the_future.should  be_within(20.294, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "waste_households_in_mekko_of_final_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "waste_households_in_mekko_of_primary_demand" do
      the_present.should be_within(15.772, some_tolerance)
      the_future.should  be_within(15.772, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "waste_in_source_of_electricity_production" do
      the_present.should be_within(14.04, some_tolerance)
      the_future.should  be_within(14.04, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "waste_industry_in_mekko_of_final_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "waste_industry_in_mekko_of_primary_demand" do
      the_present.should be_within(16.421, some_tolerance)
      the_future.should  be_within(16.421, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "waste_other_in_mekko_of_final_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "waste_other_in_mekko_of_primary_demand" do
      the_present.should be_within(0.256, some_tolerance)
      the_future.should  be_within(0.256, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "waste_transport_in_mekko_of_final_demand" do
      the_present.should be_within(0.0, some_tolerance)
      the_future.should  be_within(0.0, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "waste_transport_in_mekko_of_primary_demand" do
      the_present.should be_within(1.106, some_tolerance)
      the_future.should  be_within(1.106, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "wind_farms_capacity_in_power_plant_properties" do
      the_value.should be_within(1.474, some_tolerance)
    end


      
    it "wind_farms_in_power_plant_properties" do
      the_value.should be_within(14.328, some_tolerance)
    end


      
    it "wind_farms_investm_in_power_plant_properties" do
      the_value.should be_within(2539.944, some_tolerance)
    end


      
    it "wind_farms_plants_in_power_plant_properties" do
      the_value.should be_within(491.429, some_tolerance)
    end


      
    it "wind_farms_prod_in_power_plant_properties" do
      the_value.should be_within(14.328, some_tolerance)
    end


      
    it "wind_in_source_of_electricity_production" do
      the_present.should be_within(14.328, some_tolerance)
      the_future.should  be_within(14.328, some_tolerance)
      the_relative_increase.should be_within(0.0, some_tolerance)
      the_absolute_increase.should be_within(0.0, some_tolerance)
    end


      
    it "with_im_export_1990_in_co2_emissions_table" do
      the_value.should be_within(151.2, some_tolerance)
    end


      
    it "with_im_export_2010_in_co2_emissions_table" do
      the_value.should be_within(163.361, some_tolerance)
    end


      
    it "with_im_export_20xx_in_co2_emissions_table" do
      the_value.should be_within(163.359, some_tolerance)
    end


      
    it "wood_pellets_conversion_in_fuel_chain_emissions" do
      the_value.should be_within(0.029, some_tolerance)
    end


      
    it "wood_pellets_extraction_in_fuel_chain_emissions" do
      the_value.should be_within(1.147, some_tolerance)
    end


      
    it "wood_pellets_transportation_in_fuel_chain_emissions" do
      the_value.should be_within(8.081, some_tolerance)
    end


      
    it "wood_pellets_treatment_in_fuel_chain_emissions" do
      the_value.should be_within(0.0, some_tolerance)
    end


  end
end