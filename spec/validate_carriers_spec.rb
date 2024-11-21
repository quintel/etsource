require 'rspec'
require 'set'

# Define the paths
CARRIERS_FOLDER = 'carriers' # Replace with the actual path to your carriers folder
GQUERIES_FOLDER = 'gqueries' # Replace with the actual path to your gqueries folder

# Get a list of all carrier files in the carriers folder
def collect_carrier_files
  Dir.glob(File.join(CARRIERS_FOLDER, '*.ad')).map { |file| File.basename(file, '.ad') }.to_set
end

VALID_CARRIERS = collect_carrier_files

# Regular expression to find `CARRIER(...)`
CARRIER_FUNCTION_PATTERN = /CARRIER\(\s*([\w\d_]+)\s*(?:,\s*[\w\d_]+\s*)?\)/

# Function to find all carrier arguments in a file
def find_carriers_in_file(file_path)
  content = File.read(file_path)
  content.scan(CARRIER_FUNCTION_PATTERN).flatten
end

# RSpec test
RSpec.describe 'Carrier validation in GQL files' do
  Dir.glob(File.join(GQUERIES_FOLDER, '**', '*.gql')).each do |gql_file|

    it "validates carriers in #{gql_file}" do
      carriers = find_carriers_in_file(gql_file)
      unmatched_carriers = carriers.reject { |carrier| VALID_CARRIERS.include?(carrier) }

      expect(unmatched_carriers).to be_empty, lambda {
        unmatched_carriers.map do |carrier|
          "Carrier '#{carrier}' in file '#{gql_file}' is not represented in the carriers folder."
        end.join("\n")
      }
    end
  end
end