require 'rubygems'
require 'CSV'

CSV.foreach 'gq.csv' do |row|
  id, old_name, old_unit, new_name, new_unit, purpose, group, old_group, deleted, comments = row
  next if deleted.to_f > 0
  # old_group = "import_export" if old_group == "Import/Export"
  # old_group = "min_max_values" if old_group == "Min/max values"
  # old_group = "other" if old_group == ""
  # 
  # puts "#{old_name} -> #{new_name}"
  o = "gqueries/flat/#{old_name}.gql"
  n = "gqueries/flat/#{new_name}.gql"
  next unless File.exists?(o)
  File.rename o, n
  # old_filename = "gqueries/_DEPRECATED/#{old_group}/#{old_name}.gql"
end