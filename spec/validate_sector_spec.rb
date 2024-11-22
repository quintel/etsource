require 'rspec'
require 'set'

# Define the paths
SECTORS_FOLDER = 'graphs/energy/nodes' # Replace with the actual path to your nodes folder
GQUERIES_FOLDER = 'gqueries' # Replace with the actual path to your gqueries folder

# Get a list of all sector folder names in the nodes directory
def collect_sector_folders
  Dir.glob(File.join(SECTORS_FOLDER, '*')).select { |path| File.directory?(path) }.map { |folder| File.basename(folder) }.to_set
end

VALID_SECTORS = collect_sector_folders

# Regular expression to find `SECTOR(...)`
SECTOR_FUNCTION_PATTERN = /SECTOR\(\s*([\w\d_]+)\s*\)/

# Function to find all sector arguments in a file
def find_sectors_in_file(file_path)
  content = File.read(file_path)
  content.scan(SECTOR_FUNCTION_PATTERN).flatten
end

# RSpec test
RSpec.describe 'Sector validation in GQL files' do
  Dir.glob(File.join(GQUERIES_FOLDER, '**', '*.gql')).each do |gql_file|

    it "validates sectors in #{gql_file}" do
      sectors = find_sectors_in_file(gql_file)
      unmatched_sectors = sectors.reject { |sector| VALID_SECTORS.include?(sector) }

      expect(unmatched_sectors).to be_empty, lambda {
        unmatched_sectors.map do |sector|
          "Sector '#{sector}' in file '#{gql_file}' is not represented as a folder in the sectors directory."
        end.join("\n")
      }
    end
  end
end