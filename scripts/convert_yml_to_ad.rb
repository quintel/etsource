require_relative '../lib/etsource'
require 'yaml'
require 'pry'

unless ARGV.size == 1
  raise(ArgumentError, "Please provide origin_dir")
end

origin_dir = ARGV[0]

Dir.glob("#{origin_dir}/**/*.yml").each do |file_name|
  contents = YAML.load_file(file_name).to_hash

  if contents.has_key?('comments')
    contents['description'] = contents.delete('comments')
    contents['description'] = nil if contents['description'].blank?
  end

  contents.each do |key, value|
    contents.delete(key) if value.nil? || value.blank?
  end

  file_name.gsub!(/\.yml$/, "")
  file_name.gsub!(/^#{origin_dir}\//, "")

  puts "Saving #{file_name}"
  puts "contents: #{contents}"

  input = ETSource::Input.new(file_name, contents)
  input.save!
end
