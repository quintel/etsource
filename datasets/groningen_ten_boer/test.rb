require 'yaml'

y = YAML.load_file('graph_values.yml')

result = Hash[y.map do |method, values|
  [ method,
    if method =~ /demand/
      Hash[values.map do |k, v|
        [k, v / 1_000_000 ]
      end]
    elsif method == 'share_setter'
      Hash[values.map do |k, v|
        [k, v > 1.0 ? (v / 1_000_000) : v]
      end]
    else
      values
    end
  ]
end]

File.write("reformatted.yml", result.to_yaml)
