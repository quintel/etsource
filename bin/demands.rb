#!/bin/env ruby

$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + '/../lib'))

require 'etsource'

nodes = {
  households_final_demand_coal:            "EB(residential, coal_and_peat)",
  households_final_demand_crude_oil:       "EB(residential, oil_products)",
  households_final_demand_network_gas:     "EB(residential, natural_gas)",
  households_final_demand_solar_thermal:   "EB(residential, 'Geothermal Solar, etc.')",
  households_final_demand_wood_pellets:    "EB(residential, biofuels_and_waste)",
  households_final_demand_electricity:     "EB(residential, electricity)",
  households_final_demand_steam_hot_water: "EB(residential, heat)"
}

nodes.each do |key, query|
  node = ETSource::Node.find(key)
  raise "missing #{key} here." unless node
  node.query = query
  node.save!
end
