desc <<-DESC
  dumps some node info from refinery
DESC

task refinery_dump: :environment do
  require 'json'
  # NODE_DEMANDS = %i[
  #   industry_useful_demand_for_other_ict_electricity
  #   industry_useful_demand_for_chemical_refineries_useable_heat
  #   industry_useful_demand_for_chemical_other_useable_heat
  #   industry_chemicals_fertilizers_production
  # ].freeze

  # PARENT_SHARE = [
  #   {
  #     from: :industry_useful_demand_for_other_ict_electricity,
  #     to: :industry_other_ict_potential_residual_heat_from_servers_electricity,
  #     carrier: :electricity
  #   },
  #   {
  #     from: :industry_useful_demand_for_chemical_refineries_useable_heat,
  #     to: :industry_chemicals_refineries_processes_potential_residual_heat,
  #     carrier: :useable_heat
  #   },
  #   {
  #     from: :industry_useful_demand_for_chemical_refineries_useable_heat,
  #     to: :industry_chemicals_refineries_flue_gasses_potential_residual_heat,
  #     carrier: :useable_heat
  #   },
  #   {
  #     from: :industry_useful_demand_for_chemical_other_useable_heat,
  #     to: :industry_chemicals_other_processes_potential_residual_heat,
  #     carrier: :useable_heat
  #   },
  #   {
  #     from: :industry_useful_demand_for_chemical_other_useable_heat,
  #     to: :industry_chemicals_other_flue_gasses_potential_residual_heat,
  #     carrier: :useable_heat
  #   },
  #   {
  #     from: :industry_chemicals_fertilizers_production,
  #     to: :industry_chemicals_fertilizers_processes_potential_residual_heat,
  #     carrier: :useable_heat
  #   },
  #   {
  #     from: :industry_chemicals_fertilizers_production,
  #     to: :industry_chemicals_fertilizers_flue_gasses_potential_residual_heat,
  #     carrier: :useable_heat
  #   }
  # ].freeze

  INPUT_START_VALUES = %w[
    # households_apartments_share
    # households_corner_houses_share
    # households_detached_houses_share
    # households_semi_detached_houses_share
    # households_terraced_houses_share
    # households_useful_demand_heat_per_person
    # households_insulation_level_apartments
    # households_insulation_level_corner_houses
    # households_insulation_level_detached_houses
    # households_insulation_level_semi_detached_houses
    # households_insulation_level_terraced_houses
    buildings_insulation_level
    buildings_useful_demand_for_space_heating = 0.0
  ].freeze

  AREA_ATTRIBUTES = %w[
    insulation_apartments_start_value
    insulation_corner_houses_start_value
    insulation_detached_houses_start_value
    insulation_semi_detached_houses_start_value
    insulation_terraced_houses_start_value
    insulation_buildings_start_value
  ].freeze

  result = {}

  datasets = Atlas::Dataset.all
    .select { |dataset| dataset.enabled && dataset.enabled[:etengine] }
    .sort_by(&:key)

  total = datasets.count
  count = 0

  datasets.each do |dataset|
    result[dataset.key] = {}

    AREA_ATTRIBUTES.each do |key|
      result[dataset.key][key] = dataset.public_send(key)
    end

    result[dataset.key]['households_number_of_residences'] = dataset.number_of_residences
    %w[apartments corner_houses detached_houses semi_detached_houses terraced_houses].each do |type|
      result[dataset.key]["households_#{type}_share"] = (
        dataset.public_send("number_of_#{type}") / dataset.number_of_residences
      )

      result[dataset.key]["households_insulation_level_#{type}"] = dataset.public_send(
        "insulation_#{type}_start_value"
      )
    end

    result[dataset.key]['buildings_insulation_level'] = dataset.insulation_buildings_start_value
    result[dataset.key]['households_useful_demand_heat_per_person'] = 0.0
    result[dataset.key]['buildings_useful_demand_for_space_heating'] = 0.0


    # graph = Atlas::Runner.new(dataset).calculate

    # NODE_DEMANDS.each do |node|
    #   result[dataset.key][node] = graph.node(node).get(:demand).to_f
    # end

    # PARENT_SHARE.each do |calc_share|
    #   name = "#{calc_share[:from]}_#{calc_share[:to]}_parent_share"
    #   result[dataset.key][name] = graph.node(calc_share[:from])
    #     .out_edges(calc_share[:carrier])
    #     .select{ |e| e.to == graph.node(calc_share[:to]) }
    #     .get(:parent_share)
    #     .to_a[0].to_f
    # end
    count += 1

    puts "(#{count}/#{total})" if (count % 100).zero?
  end

  path = 'dataset_values.json'
  File.open(path, 'w') do |file|
    JSON.dump(result, file)
  end
  puts File.read(path)
end
