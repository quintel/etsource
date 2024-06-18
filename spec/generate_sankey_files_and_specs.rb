require 'fileutils'

def parse_coffee_file(file_path)
  charts = {}
  current_chart = nil
  nodes_section = false
  links_section = false

  File.readlines(file_path).each do |line|
    line = line.rstrip

    # Identify chart names and start parsing their content
    if line =~ /^\s{4}(\w+):\s*/
      current_chart = $1
      charts[current_chart] = { 'nodes' => [], 'links' => [] }
      next
    end

    if current_chart
      if line.strip.start_with?('nodes: [')
        nodes_section = true
        next
      elsif line.strip.start_with?('links: [')
        links_section = true
        next
      elsif line.strip.start_with?(']')
        nodes_section = false
        links_section = false
      end

      if nodes_section
        if line =~ /\s*\{id: '([^']*)',\s*column: (\d),\s*label: '([^']*)',\s*color: '([^']*)'\}/
          charts[current_chart]['nodes'] << { 'id' => $1, 'column' => $2.to_i, 'label' => $3, 'color' => $4 }
        elsif line =~ /\s*\{id: '([^']*)',\s*column: (\d),\s*label: '([^']*)'\}/
          charts[current_chart]['nodes'] << { 'id' => $1, 'column' => $2.to_i, 'label' => $3 }
        end
      end

      if links_section
        if line =~ /\s*\{left: '([^']*)',\s*right: '([^']*)',\s*gquery: '([^']*)',\s*color: '([^']*)'\}/
          charts[current_chart]['links'] << { 'left' => $1, 'right' => $2, 'gquery' => $3, 'color' => $4 }
        elsif line =~ /\s*\{left: '([^']*)',\s*right: '([^']*)',\s*gquery: '([^']*)'\}/
          charts[current_chart]['links'] << { 'left' => $1, 'right' => $2, 'gquery' => $3 }
        end
      end
    end
  end

  charts
end

def create_sankey_files(charts, base_dir)
  FileUtils.mkdir_p(base_dir) unless Dir.exists?(base_dir)

  charts.each do |chart_name, chart_data|
    chart_dir = File.join(base_dir, chart_name)
    FileUtils.mkdir_p(chart_dir) unless Dir.exists?(chart_dir)

    incoming_flows = Hash.new { |hash, key| hash[key] = [] }
    outgoing_flows = Hash.new { |hash, key| hash[key] = [] }

    chart_data['links'].each do |link|
      left = link['left']
      right = link['right']
      gquery = link['gquery']

      # Store incoming flows for each right node
      incoming_flows[right] << gquery

      # Store outgoing flows for each left node
      outgoing_flows[left] << gquery
    end

    # Generate files for incoming and outgoing flows of each middle subcolumn
    incoming_flows.each do |node, incoming_queries|
      if outgoing_flows[node]
        outgoing_queries = outgoing_flows[node]

        unless incoming_queries.empty?
          file_name = "mt_#{chart_name}_incoming_to_#{node}.gql"
          file_path = File.join(chart_dir, file_name)
          file_content = "- query = \n\t\tSUM(\n\t\t\t" + incoming_queries.map { |query| "Q(#{query})" }.join(",\n\t\t\t") + "\n\t\t)"
          File.write(file_path, file_content)
        end

        unless outgoing_queries.empty?
          file_name = "mt_#{chart_name}_outgoing_from_#{node}.gql"
          file_path = File.join(chart_dir, file_name)
          file_content = "- query = \n\t\tSUM(\n\t\t\t" + outgoing_queries.map { |query| "Q(#{query})" }.join(",\n\t\t\t") + "\n\t\t)"
          File.write(file_path, file_content)
        end
      end
    end
  end

  puts "Files created in #{base_dir}"
end

def remove_empty_folders(base_dir)
  Dir.glob("#{base_dir}/**/").reverse_each do |dir|
    if Dir.empty?(dir)
      Dir.rmdir(dir)
    end
  end
end

def generate_spec_for_folder(base_dir, output_file)
  FileUtils.mkdir_p(File.dirname(output_file)) unless Dir.exists?(File.dirname(output_file))

  File.open(output_file, 'w') do |file|
    file.puts "require 'spec_helper'\n\n"
    file.puts "describe \"sankey\" do"
    file.puts "  Turk::PresetCollection.from_keys(:ii3050v2).each do |scenario|"
    file.puts "    context \"with scenario \#{scenario.original_scenario_id}\" do"

    # Iterate over each subfolder in the base directory
    Dir.foreach(base_dir) do |chart_name|
      next if chart_name == '.' || chart_name == '..'

      chart_dir = File.join(base_dir, chart_name)
      next unless File.directory?(chart_dir)

      incoming_files = {}
      outgoing_files = {}

      # Collect incoming and outgoing files
      Dir.foreach(chart_dir) do |file_name|
        next if file_name == '.' || file_name == '..'

        if file_name =~ /mt_#{chart_name}_incoming_to_(.+)\.gql/
          incoming_files[$1] = file_name
        elsif file_name =~ /mt_#{chart_name}_outgoing_from_(.+)\.gql/
          outgoing_files[$1] = file_name
        end
      end

      # Generate tests for each matching incoming and outgoing pair
      incoming_files.each do |subcolumn, incoming_file|
        if outgoing_files.key?(subcolumn)
          outgoing_file = outgoing_files[subcolumn]
          file.puts "      it \"should result in all input and output flows of the #{chart_name} #{subcolumn} nodes to be equal\" do"
          file.puts "        expect("
          file.puts "          scenario.#{incoming_file.sub('.gql', '')}"
          file.puts "        ).to softly_equal("
          file.puts "          scenario.#{outgoing_file.sub('.gql', '')}"
          file.puts "        )"
          file.puts "      end\n\n"
        else
          # Remove incoming file if there's no corresponding outgoing file
          FileUtils.rm(File.join(chart_dir, incoming_file))
        end
      end

      # Remove outgoing files with no matching incoming files
      outgoing_files.each do |subcolumn, outgoing_file|
        unless incoming_files.key?(subcolumn)
          FileUtils.rm(File.join(chart_dir, outgoing_file))
        end
      end
    end

    file.puts "    end"
    file.puts "  end"
    file.puts "end\n\n"
  end

  puts "RSpec tests generated in #{output_file}"
end

if __FILE__ == $0
  # Define the paths
  script_dir = File.dirname(File.expand_path(__FILE__))
  etmodel_path = File.join(script_dir, '../../etmodel/app/assets/javascripts/d3/sankey.coffee')
  etsource_base_dir = File.join(script_dir, '../gqueries/mechanical_turk/sankey/graphs')
  output_spec_file = File.join(script_dir, '../../mechanical_turk/spec/sankey_graphs/sankey_spec.rb')

  # Debugging paths
  puts "Script directory: #{script_dir}"
  puts "ETModel path: #{etmodel_path}"
  puts "ETSource base directory: #{etsource_base_dir}"
  puts "Output spec file: #{output_spec_file}"

  # Check if the file paths exist
  unless File.exists?(etmodel_path)
    puts "ETModel path does not exist: #{etmodel_path}"
    exit 1
  end

  # Process the CoffeeScript file
  charts = parse_coffee_file(etmodel_path)
  create_sankey_files(charts, etsource_base_dir)
  remove_empty_folders(etsource_base_dir)
  generate_spec_for_folder(etsource_base_dir, output_spec_file)

  # Debug prints to verify the parsing
  puts "Parsed charts: #{charts}"
end