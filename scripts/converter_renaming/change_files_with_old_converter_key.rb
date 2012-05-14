# This script changes all references to the old_keys as defined in the mentioned CSV file (CSV_WITH_REPLACEMENTS) on the ETsource.
# Use the find script (named "find_files_with_old_converter_key") to see whether other uses of the old key still exist.

require 'rubygems'
require 'CSV'
require 'fileutils'

CSV_WITH_REPLACEMENTS = "new_converter_keys.csv"
PATH_OF_REPOSITORIES = File.expand_path("../../../..",__FILE__)

#First define what we want to replace with what
replacements = {}
CSV.foreach(CSV_WITH_REPLACEMENTS) do |row|
  #this is how the columns of the CSV are ordered
  id, old_key, new_key = row
  replacements[old_key] = new_key unless old_key == new_key
end

#Then we define which files we will be going through
files = Dir.glob(PATH_OF_REPOSITORIES + "/etsource/**/*") - \
#Dir.glob(PATH_OF_REPOSITORIES + "/etsource/datasets/**/*") - \
Dir.glob(PATH_OF_REPOSITORIES + "/etsource/scripts/**/*") - \
Dir.glob(PATH_OF_REPOSITORIES + "/etsource/topology/**/*")

#clean up file list with hidden files (that start with .) or files that are actually directories
files.delete_if do |file_name| 
  file_name[0] == "." || File.directory?(file_name) || File.ftype(file_name) != "file"
  end

#loop through all the files
# The iconv part is required for the etengine because of some problems that arise regarding an "invalid byte sequence in UTF-8"
require 'iconv' unless String.method_defined?(:encode)
for file in files
  next unless File.file?(file)
  content = File.read(file)
  
  # gracefully deal with encoding
  if String.method_defined?(:encode)
    content.encode!('UTF-8', 'UTF-8', :invalid => :replace)
  else
    ic = Iconv.new('UTF-8', 'UTF-8//IGNORE')
    content = ic.iconv(content)
  end
  
  replacements.each do |old_key, new_key|
    raise "can't be nil! (found in #{file_name}: #{old_key} & #{new_key})" if (old_key.nil? || new_key.nil?)
      if content =~ /\b#{old_key}\b/ then
          content = content.gsub(/\b#{old_key}\b/, new_key)
          File.open file, "w" do |update|
            update.puts content
          end
        puts "I changed #{old_key} to #{new_key} keys in #{file}"
      end
  end    
end