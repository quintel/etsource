# This script changes all references to the old_keys as defined in the mentioned CSV file on the ETsource.
# Use the find script (named "find_files_with_old_converter_key") to see whether other uses of the old key still exist.


require 'rubygems'
require 'CSV'
require 'fileutils'

CSV_WITH_REPLACEMENTS = "new_converter_keys.csv"
PATH_OF_REPOSITORIES = "/Users/WvL/Documents/github/"

#First define what we want to replace with what
replacements = {}
CSV.foreach(CSV_WITH_REPLACEMENTS) do |row|
  #this is how the columns of the CSV are ordered
  id, old_key, new_key = row
  replacements[old_key] = new_key unless old_key == new_key
end

#Then we define which files we will be going through
files = Dir.glob(PATH_OF_REPOSITORIES + "etsource/**/*") - Dir.glob(PATH_OF_REPOSITORIES + "etsource/datasets/**/*") - Dir.glob(PATH_OF_REPOSITORIES + "etsource/scripts/**/*") - Dir.glob(PATH_OF_REPOSITORIES + "etsource/topology/**/*")

#clean up file list with hidden files (that start with .) or files that are actually directories
files.delete_if do |file_name| 
  file_name[0] == "." || File.directory?(file_name)
  end

#loop through all the files
files.each do |file_name|
  content = File.read file_name
  replacements.each do |old_value, new_value|
    raise "can't be nil! (found in #{file_name}: #{old_value} & #{new_value})" if (old_value.nil? || new_value.nil?)
      if content =~ /#{old_value}/ then
        newcontent = content.gsub(/\b#{old_value}\b/, new_value)
        File.open file_name, "w" do |update|
          update.puts newcontent
        end
        puts "I changed the deprecated keys in #{file_name}"
      end
  end    
end