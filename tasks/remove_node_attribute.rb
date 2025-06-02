desc <<-DESC
  Remove a single-line attribute from every EnergyNode `.ad` file under
  graphs/energy/nodes, without reordering any other attributes.

  USAGE:
    bundle exec rake remove_node_attribute attribute={attribute_name}

  This task will:
    • Walk every `*.ad` file under graphs/energy/nodes/**
    • Delete any line matching “- {attribute} = …” (preserving all other lines)
DESC
task remove_node_attribute: :environment do
  attribute = ENV['attribute']
  raise ArgumentError, "missing ENV['attribute']" unless attribute&.strip&.length&.positive?

  # Matches lines like “- part_load_efficiency_penalty = 0.0”
  line_regex = /^\s*-\s*#{Regexp.escape(attribute)}\s*=\s*/

  base_dir     = "graphs/energy/nodes"

  # Stats
  total_files  = 0
  modified     = 0
  total_deleted = 0

  Dir.glob(File.join(base_dir, "**", "*.ad")).sort.each do |path|
    total_files += 1
    next unless File.exist?(path)

    lines       = File.readlines(path)
    match_count = lines.count { |l| l =~ line_regex }
    next if match_count.zero?

    filtered = lines.reject { |l| l =~ line_regex }
    File.write(path, filtered.join)

    modified     += 1
    total_deleted += match_count
  end

  puts "Scanned #{total_files} files."
  puts "Modified #{modified} file#{'s' if modified != 1}."
  puts "Deleted #{total_deleted} line#{'s' if total_deleted != 1}."
end
