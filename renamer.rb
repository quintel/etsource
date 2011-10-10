require 'rubygems'
require 'CSV'
require 'fileutils'


groups = []

CSV.foreach 'new_gqueries.csv' do |row|
  id, old_name, old_unit, new_name, new_unit, purpose, group, old_group, deleted, comments = row
  next if deleted.to_f > 0

  # o = "gqueries/flat/#{old_name}.gql"
  file = "gqueries/flat/#{new_name}.gql"
  next unless File.exists?(file)
  
  new_location = "gqueries/#{purpose.downcase.gsub(' ', "_")}/#{group.downcase.gsub(' ', "_")}/#{new_name}.gql"
  
  FileUtils.mv(file, new_location)

  puts "Moved #{file} -> #{new_location}"
  
  # groups << group.downcase.gsub(' ', "_")
end

# puts groups.uniq.join("\n")