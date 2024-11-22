require 'rspec'

# Define paths to edge directories
ENERGY_EDGES_FOLDER = 'graphs/energy/edges' # Replace with actual path
MOLECULES_EDGES_FOLDER = 'graphs/molecules/edges' # Replace with actual path
GQUERIES_FOLDER = 'gqueries' # Replace with actual path to gqueries folder

# Regular expression to find `EDGE(...)`
EDGE_FUNCTION_PATTERN = /EDGE\(\s*([\w\d_]+)\s*,\s*([\w\d_]+)\s*\)/

# Collect all edge files from energy and molecules edge directories
def collect_edge_files
  Dir.glob("#{ENERGY_EDGES_FOLDER}/**/*.ad") + Dir.glob("#{MOLECULES_EDGES_FOLDER}/**/*.ad")
end

# Normalize edge file names to a format like "node1-node2"
def extract_edge_names(edge_files)
  edge_files.map { |file| File.basename(file, '.ad') }.to_set
end

VALID_EDGES = extract_edge_names(collect_edge_files)

# Function to find all edge arguments in a file
def find_edges_in_file(file_path)
  content = File.read(file_path)
  content.scan(EDGE_FUNCTION_PATTERN)
end

# RSpec test
RSpec.describe 'EDGE validation in GQL files' do
  Dir.glob(File.join(GQUERIES_FOLDER, '**', '*.gql')).each do |gql_file|

    it "validates edges in #{gql_file}" do
      edges = find_edges_in_file(gql_file)
      unmatched_edges = edges.reject do |node1, node2|
        VALID_EDGES.include?("#{node1}-#{node2}") || VALID_EDGES.include?("#{node2}-#{node1}") ||
          VALID_EDGES.any? { |edge| edge.start_with?("#{node1}-#{node2}@") } || 
          VALID_EDGES.any? { |edge| edge.start_with?("#{node2}-#{node1}@") }
      end

      expect(unmatched_edges).to be_empty, lambda {
        unmatched_edges.map do |node1, node2|
          "Edge between '#{node1}' and '#{node2}' in file '#{gql_file}' does not exist in edge directories."
        end.join("\n")
      }
    end
  end
end