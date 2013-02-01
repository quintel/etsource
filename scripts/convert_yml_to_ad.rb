require_relative '../lib/etsource'
require 'yaml'

unless ARGV.size == 1
  raise(ArgumentError, "Please provide origin_dir")
end

origin_dir = ARGV[0]

Dir.glob("#{origin_dir}/**/*.yml").each do |file_name|
  contents = YAML.load_file(file_name).to_hash
  input = ETSource::Input.new(file_name, contents)
  input.save!
end
