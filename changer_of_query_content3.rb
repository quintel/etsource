require 'rubygems'
require 'CSV'
require 'fileutils'

CSV_WITH_REPLACEMENTS = "new_gquery_names.csv"
DIR_OF_FILES = "gqueries/modules/network" #relative to this script!

#First define what we want to replace with what
replacements = {}
CSV.foreach(CSV_WITH_REPLACEMENTS) do |row|
  #this is how the columns of the CSV are ordered
  id, old_key, old_unit, new_key, new_unit, purpose, new_group, old_group, deleted = row
  replacements[old_key] = new_key #unless old_key == new_key
end

#read this directory and point File System there
files = Dir.entries(DIR_OF_FILES)
Dir.chdir(DIR_OF_FILES)

#clean up file list with hidden files (that start with .) or files that are actually directories
files.delete_if do |file_name| 
  file_name[0] == "." || File.directory?(file_name)
end

#loop through all the files
files.each do |file_name|
  content = File.read file_name
  File.open file_name, 'w' do |file|
    replacements.each do |old_value, new_value|
       raise "can't be nil! (found in #{file_name}: #{old_value} & #{new_value})" if (old_value.nil? || new_value.nil?)
       puts "I removed the depretaced key in #{file_name} as its old name was the same" if content.gsub!("- deprecated_key = #{new_value}","")
    end
    file.write content
    file.close    
 end
end


# to start and create a log file, type for example:
# ruby changer_of_query_content.rb > 20111021_replacement_of_query_contents_attempt_1.txt



#Paolo's help:       n = text.gsub /Q\(\s*insulation_costs\)/m, "Q(foobar)"