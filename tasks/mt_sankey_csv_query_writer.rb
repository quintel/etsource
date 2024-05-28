require 'yaml'
require 'fileutils'

def format_filename_part(text)
  text.downcase.gsub(' ', '_')
end

desc "Create Sankey files from a YAML configuration"
task :create_sankey_files, [:yaml_file, :base_path] do |t, args|
  yaml_file = args[:yaml_file] || 'config/sankey_csv.yml'
  base_path = args[:base_path] || 'gqueries/mechnical_turk/sankey/download'

  # Load YAML content from the file
  data = YAML.load_file(yaml_file)

  # Check if the base directory exists, create if not
  FileUtils.mkdir_p(base_path)

  grouped_data = Hash.new { |hash, key| hash[key] = [] }

  # Process each row in the YAML file
  data['rows'].each do |row|
    # Create a key based on Group, Carrier, and Type
    key = [row['Group'], row['Carrier'], row['Type']]
    grouped_data[key] << row['Value']
  end

  # Create files for each grouped key
  grouped_data.each do |key, values|
    formatted_group = format_filename_part(key[0])
    formatted_carrier = format_filename_part(key[1])
    formatted_type = format_filename_part(key[2])

    file_name = "turk_sankey_#{formatted_group}_#{formatted_carrier}_#{formatted_type}.gql"
    file_path = File.join(base_path, file_name)

    # Construct the query content with each value on a new line
    query_values = values.map { |value| "Q(#{value})" }.join(",\n      ")
    file_content = <<-FILE_CONTENT
- query =
    SUM(
      #{query_values}
    )
- unit = PJ
    FILE_CONTENT

    # Write the content to the file
    File.open(file_path, 'w') { |file| file.write(file_content) }
    puts "File created: #{file_path}"
  end
end