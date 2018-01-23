desc <<-DESC
  Turns a set of initializer methods to a single initializer input
DESC

task init_methods_to_input: :environment do
  unless ENV['DERIVED_DATASET']
    raise(
      ArgumentError,
      'missing DERIVED_DATASET argument; if you want to refresh all graphs, ' \
      'use: rake refresh_graph DERIVED_DATASET=*'
    )
  end

  dataset = Atlas::Dataset::Derived.find(ENV['DERIVED_DATASET'])
  input_name = "initializer_methods_#{ dataset.key }"

  changes = YAML.load_file(dataset.dataset_dir.join('graph_values.yml'))
  input   = nil

  begin
    input = Atlas::InitializerInput.find(input_name)
  rescue
    input = Atlas::InitializerInput.new(
      key: input_name,
      ns:  'converted_initializer_methods'
    )
  end

  statements = []

  changes['demand_setter'].each do |key, value|
    statements.push("UPDATE(V(#{ key }), demand, #{ value.to_f })")
  end

  changes['preset_demand_setter'].each do |key, value|
    statements.push("UPDATE(V(#{ key }), preset_demand, #{ value.to_f })")
  end

  changes['number_of_units_setter'].each do |key, value|
    statements.push("UPDATE(V(#{ key }), number_of_units, #{ value.to_f })")
  end

  changes['share_setter'].each do |key, value|
    from, to, _ = key.to_s.split(/[-@]/)
    statements.push("UPDATE(LINK(#{ to }, #{ from }), share, #{ value.to_f })")
  end

  changes['conversion_setter'].each do |key, value|
    node_key, carrier = key.to_s.split('@').map(&:to_sym)

    statements.push("UPDATE(OUTPUT_SLOTS(V(#{ node_key }), #{ carrier }), conversion, #{ value.to_f })")
    statements.push("UPDATE(INPUT_SLOTS(V(#{ node_key }), #{ carrier }), conversion, #{ value.to_f })")
  end

  statements = statements.map { |s| "  #{ s }" }
  input.query = "EACH(\n#{ statements.join(",\n") }\n)"
  input.save!

  unless dataset.init.key?(input_name.to_sym)
    dataset.init[input_name] = 1
    dataset.save!
  end
end
