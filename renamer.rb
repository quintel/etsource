require 'rubygems'
require 'CSV'

names = []
CSV.foreach 'new_gqueries.csv' do |row|
  id, old_name, old_unit, new_name, new_unit, purpose, group, old_group, deleted, comments = row
  next if deleted.to_f > 0

  puts "#{old_name} -> #{new_name}"
  o = "gqueries/flat/#{old_name}.gql"
  n = "gqueries/flat/#{new_name}.gql"
  next unless File.exists?(o)

  File.rename o, n
  
  names << new_name
  
end

puts "N: #{names.size} O : #{names.uniq.size}"
# puts (names.to_set - names.uniq.to_set).to_a