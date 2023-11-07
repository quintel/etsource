desc <<-DESC
  dumps some node info from refinery
DESC

task refinery_dump: :environment do
  require 'json'
  NODE_DEMANDS = %i[
    industry_useful_demand_for_other_ict_electricity
    industry_useful_demand_for_chemical_refineries_useable_heat
    industry_useful_demand_for_chemical_other_useable_heat
    industry_chemicals_fertilizers_production
  ].freeze

  PARENT_SHARE = [
    {
      from: :industry_useful_demand_for_other_ict_electricity,
      to: :industry_other_ict_potential_residual_heat_from_servers_electricity,
      carrier: :electricity
    },
    {
      from: :industry_useful_demand_for_chemical_refineries_useable_heat,
      to: :industry_chemicals_refineries_processes_potential_residual_heat,
      carrier: :useable_heat
    },
    {
      from: :industry_useful_demand_for_chemical_refineries_useable_heat,
      to: :industry_chemicals_refineries_flue_gasses_potential_residual_heat,
      carrier: :useable_heat
    },
    {
      from: :industry_useful_demand_for_chemical_other_useable_heat,
      to: :industry_chemicals_other_processes_potential_residual_heat,
      carrier: :useable_heat
    },
    {
      from: :industry_useful_demand_for_chemical_other_useable_heat,
      to: :industry_chemicals_other_flue_gasses_potential_residual_heat,
      carrier: :useable_heat
    },
    {
      from: :industry_chemicals_fertilizers_production,
      to: :industry_chemicals_fertilizers_processes_potential_residual_heat,
      carrier: :useable_heat
    },
    {
      from: :industry_chemicals_fertilizers_production,
      to: :industry_chemicals_fertilizers_flue_gasses_potential_residual_heat,
      carrier: :useable_heat
    }
  ].freeze

  result = {}

  datasets = Atlas::Dataset.all
    .select { |dataset| dataset.enabled && dataset.enabled[:etengine] }
    .sort_by(&:key)

  total = datasets.count
  count = 0

  datasets.each do |dataset|
    result[dataset.key] = {}
    graph = Atlas::Runner.new(dataset).calculate

    NODE_DEMANDS.each do |node|
      result[dataset.key][node] = graph.node(node).get(:demand).to_f
    end

    PARENT_SHARE.each do |calc_share|
      name = "#{calc_share[:from]}_#{calc_share[:to]}_parent_share"
      result[dataset.key][name] = graph.node(calc_share[:from])
        .out_edges(calc_share[:carrier])
        .select{ |e| e.to == graph.node(calc_share[:to]) }
        .get(:parent_share)
        .to_a[0].to_f
    end
    count += 1

    puts "(#{count}/#{total})" if (count % 100).zero?
  end

  path = 'result.json'
  File.open(path, 'w') do |file|
    JSON.dump(result, file)
  end
  puts File.read(path)
end
