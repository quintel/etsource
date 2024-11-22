require 'rspec'

# Define paths to the node directories
ENERGY_NODES_FOLDER = 'graphs/energy/nodes' # Replace with actual path
MOLECULES_NODES_FOLDER = 'graphs/molecules/nodes' # Replace with actual path
GQUERIES_FOLDER = 'gqueries' # Replace with actual path to gqueries folder

# Regular expression to find the '- groups = [...]' line in node files
GROUPS_PATTERN = /^\s*- groups = \[(.+)\]/

# Regular expression to find `GROUP(...)` or `G(...)` in gql files
GROUP_FUNCTION_PATTERN = /\b(GROUP|G)\(\s*([\w\d_]+)\s*\)/

# Collect all groups from node files
def collect_groups
  group_lines = Dir.glob("#{ENERGY_NODES_FOLDER}/**/*.ad")
                   .concat(Dir.glob("#{MOLECULES_NODES_FOLDER}/**/*.ad"))
                   .flat_map { |file| File.read(file).scan(GROUPS_PATTERN).flatten }
  group_lines.flat_map { |line| line.split(',').map(&:strip) }.to_set
end

VALID_GROUPS = collect_groups

# Function to find all group arguments in a gql file
def find_groups_in_file(file_path)
  content = File.read(file_path)
  content.scan(GROUP_FUNCTION_PATTERN).map { |_, group| group }
end

# RSpec test
RSpec.describe 'GROUP validation in GQL files' do
  Dir.glob(File.join(GQUERIES_FOLDER, '**', '*.gql')).each do |gql_file|

    it "validates groups in #{gql_file}" do
      groups = find_groups_in_file(gql_file)
      unmatched_groups = groups.reject { |group| VALID_GROUPS.include?(group) }

      expect(unmatched_groups).to be_empty, lambda {
        unmatched_groups.map do |group|
          "Group '#{group}' in file '#{gql_file}' is not defined in any node file."
        end.join("\n")
      }
    end
  end
end