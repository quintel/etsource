# frozen_string_literal: true

require 'yaml'

DATASETS_DIR = 'datasets'
GRAPH_VALUES_FILE = 'graph_values.yml'

Dir.glob("#{DATASETS_DIR}/**/#{GRAPH_VALUES_FILE}") do |graph_file|
  yaml_contents = YAML.load_file(graph_file)

  nodes = yaml_contents.reject { |k, _v| k.include?('-') }.sort.to_h
  edges = yaml_contents.select { |k, _v| k.include?('-') }.sort.to_h

  File.write(graph_file, nodes.merge(edges).to_yaml)
end
