desc <<-DESC
  Refreshes a graph.yml of a derived dataset
  Mandatory arguments:

  - DERIVED_DATASET      = derived dataset name
DESC

task refresh_graph: :environment do
  unless ENV['DERIVED_DATASET']
    raise(
      ArgumentError,
      'missing DERIVED_DATASET argument; if you want to refresh all graphs, ' \
      'use: rake refresh_graph DERIVED_DATASET=*'
    )
  end

  derived_datasets =
    if ENV['DERIVED_DATASET'] == '*'
      Atlas::Dataset::Derived.all
    else
      [Atlas::Dataset::Derived.find(ENV['DERIVED_DATASET'])]
    end

  derived_datasets.each do |derived_dataset|
    dataset = Atlas::Dataset::Full.find(derived_dataset.base_dataset)

    Atlas::GraphPersistor.call(
      dataset,
      derived_dataset.graph_path,
      export_modifier: Atlas::Scaler::GraphScaler.new(derived_dataset.scaling.factor)
    )

    puts "Succesfully refreshed the graph.yml for #{ derived_dataset.area }"
  end
end
