require 'rspec'

# Define paths to the edge directories
ENERGY_EDGES_FOLDER = 'graphs/energy/edges' # Replace with actual path
MOLECULES_EDGES_FOLDER = 'graphs/molecules/edges' # Replace with actual path
GQUERIES_FOLDER = 'gqueries' # Replace with actual path to gqueries folder

# Regular expression to find the '- groups = [...]' line in edge files
EDGE_GROUPS_PATTERN = /^\s*- groups = \[(.+)\]/

# Regular expression to find `EG(...)` or `EDGE_GROUP(...)` in gql files
EDGE_GROUP_FUNCTION_PATTERN = /\b(EG|EDGE_GROUP)\(\s*([\w\d_]+)\s*\)/

# Collect all edge groups from edge files
def collect_edge_groups
  group_lines = Dir.glob("#{ENERGY_EDGES_FOLDER}/**/*.ad")
                   .concat(Dir.glob("#{MOLECULES_EDGES_FOLDER}/**/*.ad"))
                   .flat_map { |file| File.read(file).scan(EDGE_GROUPS_PATTERN).flatten }
  group_lines.flat_map { |line| line.split(',').map(&:strip) }.to_set
end

VALID_EDGE_GROUPS = collect_edge_groups

# Function to find all edge group arguments in a gql file
def find_edge_groups_in_file(file_path)
  content = File.read(file_path)
  content.scan(EDGE_GROUP_FUNCTION_PATTERN).map { |_, group| group }
end

# RSpec test
RSpec.describe 'EDGE_GROUP validation in GQL files' do
  Dir.glob(File.join(GQUERIES_FOLDER, '**', '*.gql')).each do |gql_file|

    it "validates edge groups in #{gql_file}" do
      edge_groups = find_edge_groups_in_file(gql_file)
      unmatched_edge_groups = edge_groups.reject { |group| VALID_EDGE_GROUPS.include?(group) }

      expect(unmatched_edge_groups).to be_empty, lambda {
        unmatched_edge_groups.map do |group|
          "Edge group '#{group}' in file '#{gql_file}' is not defined in any edge file."
        end.join("\n")
      }
    end
  end
end