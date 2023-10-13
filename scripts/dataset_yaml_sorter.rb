# frozen_string_literal: true

require 'yaml'

DATASETS_DIR = 'datasets'
GRAPH_VALUES_FILE = 'graph_values.yml'

Dir.glob("#{DATASETS_DIR}/**/#{GRAPH_VALUES_FILE}") do |graph_file|
  File.write(
    graph_file,
    YAML.load_file(graph_file)
      .sort
      .to_h
      .to_yaml
  )
end
