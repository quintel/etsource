require 'rspec'
require 'fileutils'

# Define the paths to the valid nodes
VALID_NODE_FOLDERS = [
  "graphs/energy/nodes",
  "graphs/molecules/nodes"
]

# Define the path to the queries folder
QUERIES_FOLDER = "gqueries" # Replace with the actual path to your queries folder
SKIP_FOLDER = "gqueries/mechanical_turk" # Folder to skip

# Function to collect all valid nodes
def collect_valid_nodes
  valid_nodes = []
  VALID_NODE_FOLDERS.each do |folder|
    next unless Dir.exist?(folder)

    Dir.glob(File.join(folder, '**', '*.ad')).each do |file|
      valid_nodes << File.basename(file, '.ad')
    end
  end

  # Normalize nodes by stripping common suffixes like ".final_demand"
  valid_nodes.map { |node| node.split('.').first }.to_set
end

VALID_NODES = collect_valid_nodes

# Regular expression to find `V(...)`
V_FUNCTION_PATTERN = /V\((.*?)\)/

# Function to properly parse arguments inside `V(...)`
def parse_arguments(arguments)
  parsed_args = []
  current_arg = ''
  paren_depth = 0

  arguments.each_char do |char|
    if char == ',' && paren_depth.zero?
      parsed_args << current_arg.strip
      current_arg = ''
    else
      paren_depth += 1 if char == '('
      paren_depth -= 1 if char == ')'
      current_arg += char
    end
  end

  parsed_args << current_arg.strip unless current_arg.empty?
  parsed_args
end

# Function to validate a single `.gql` file
def validate_gql_file(file_path)
  content = File.read(file_path)

  content.scan(V_FUNCTION_PATTERN).each do |match|
    arguments = match.first.strip

    # Parse the arguments properly
    args = parse_arguments(arguments)

    # Ignore the last argument (attribute or expression)
    nodes_to_check = args[0..-2]

    nodes_to_check.each do |node|
      # Skip capitalized words (functions)
      next if node.match?(/\A[A-Z]+\z/)

      # Normalize the node name
      normalized_node = node.split('.').first

      # Check if the node is valid
      unless VALID_NODES.include?(normalized_node)
        return false, node # Fail if an invalid node is found
      end
    end
  end

  [true, nil]
end

# RSpec test
RSpec.describe 'GQL file validation' do
  Dir.glob(File.join(QUERIES_FOLDER, '**', '*.gql')).each do |gql_file|
    next if gql_file.include?(SKIP_FOLDER)

    it "validates #{gql_file}" do
      is_valid, invalid_node = validate_gql_file(gql_file)
      expect(is_valid).to be_truthy, "Invalid node usage in file #{gql_file}. Problematic node: #{invalid_node}"
    end
  end
end