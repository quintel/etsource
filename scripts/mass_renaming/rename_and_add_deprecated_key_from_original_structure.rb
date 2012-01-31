require 'rubygems'
require 'CSV'
require 'fileutils'

groups = []

CSV.foreach 'new_gqueries.csv' do |row|
  id, old_name, old_unit, new_name, new_unit, purpose, group, old_group, deleted, comments = row
  next if deleted.to_f > 0

  #Lookup file from original folder
  file = "gqueries/#{purpose.downcase.gsub(' ', "_")}/#{group.downcase.gsub(' ', "_")}/#{new_name}.gql"
  next unless File.exists?(file)
  
  # Add the deprecated key to the original file
  contents = File.read file
  new_content = "- deprecated_key = #{old_name}\n" + contents
  
  # puts new_content
  File.open file, "w" do |f|
    f.write new_content
  end
  
end
