# This script changes all references to the old_keys as defined in the mentioned CSV file (CSV_WITH_REPLACEMENTS) on the ETsource and ETengine.
# Use the find script (named "find_files_with_old_converter_key") to see whether other uses of the old key still exist.
# NOTE: Names in dataset must be updated by changing the InputExcel!
# NOTE: ETmodel must be dealt with seperately (but is unlikely to have any hard references)

require 'rubygems'
require 'CSV'
require 'fileutils'

if ARGV.length < 1 then
    puts "Give as argument a file with format:'id, old_name, new_name' per line."
    exit
else
  if ARGV.length < 2 then
    puts "Default behavior: finding files only. To replace give '--replace' as second argument"
  end
end

puts "Using file " + ARGV[0] + " as naming template."

CSV_WITH_REPLACEMENTS = ARGV[0]
REPLACEMENT_FLAG = 0

# If the second argument is '--replace', go to replacement mode
if ARGV[1]==='--replace' then
  REPLACEMENT_FLAG = 1
end

PATH_OF_REPOSITORIES = File.expand_path("../../../..",__FILE__)
  
# Define what we want to replace with what
replacements = {}
CSV.foreach(CSV_WITH_REPLACEMENTS) do |row|
  #this is how the columns of the CSV are ordered
  id, old_key, new_key = row
  replacements[old_key] = new_key unless old_key == new_key
end

# Define which files we will be going through
files =\
# etsource
Dir.glob(PATH_OF_REPOSITORIES + "/etsource/**/*") - \
Dir.glob(PATH_OF_REPOSITORIES + "/etsource/scripts/**/*") - \
# dataset should be changed by InputExcel
Dir.glob(PATH_OF_REPOSITORIES + "/etsource/dataset/**/*") - \
Dir.glob(PATH_OF_REPOSITORIES + "/etsource/topology/**/*") + \
# etengine
Dir.glob(PATH_OF_REPOSITORIES + "/etengine/**/*") - \
# local 
Dir.glob(PATH_OF_REPOSITORIES + "/etengine/etsource_export/**/*") - \
# unimportant
Dir.glob(PATH_OF_REPOSITORIES + "/etengine/log/**/*") - \
Dir.glob(PATH_OF_REPOSITORIES + "/etengine/statusLog") - \
 # safer in separate migration
Dir.glob(PATH_OF_REPOSITORIES + "/etengine/etengine_staging.sql") - \
# unimportant
Dir.glob(PATH_OF_REPOSITORIES + "/etengine/db/old_migrate/**/*")
#etmodel must be done with separate migration

# Clean up file list with hidden files (that start with .) or files that are actually directories
files.delete_if do |file_name| 
  file_name[0] == "." || File.directory?(file_name) || File.ftype(file_name) != "file"
  end

# Loop through all the files
# The iconv part is required for the etengine because of some problems that arise regarding an "invalid byte sequence in UTF-8"
require 'iconv' unless String.method_defined?(:encode)
for file in files
  next unless File.file?(file)
  content = File.read(file)
  
  # Gracefully deal with encoding
  if String.method_defined?(:encode)
    content.encode!('UTF-8', 'UTF-8', :invalid => :replace)
  else
    ic = Iconv.new('UTF-8', 'UTF-8//IGNORE')
    content = ic.iconv(content)
  end
  
  # Actual replacement
  replacements.each do |old_key, new_key|
    raise "can't be nil! (found in #{file_name}: #{old_key} & #{new_key})" if (old_key.nil? || new_key.nil?)
    
    # straightforward renaming (non-composite names)
    if content =~ /\b#{old_key}\b/ then
      # Only replace if REPLACEMENT_FLAG == 1
      if REPLACEMENT_FLAG == 1 then
        content = content.gsub(/\b#{old_key}\b/, new_key)
        File.open file, "w" do |update|
          update.puts content
        end
        puts "I changed #{old_key} to #{new_key} keys in #{file}"
      else
        puts "Script can change #{old_key} to #{new_key} keys in #{file}" 
      end
    end
    
    # composite names with _AND
    if content =~ /#{old_key}_AND/ then
      # Only replace if REPLACEMENT_FLAG == 1
      if REPLACEMENT_FLAG == 1 then
        content = content.gsub(/#{old_key}_AND/, new_key + "_AND")
        File.open file, "w" do |update|
          update.puts content
        end
        puts "I changed #{old_key} to #{new_key} keys in #{file}"
      else
        puts "Script can change #{old_key} to #{new_key} keys in #{file}" 
      end
    end
    
    # composite names with AND_
    if content =~ /AND_#{old_key}/ then
      # Only replace if REPLACEMENT_FLAG == 1
      if REPLACEMENT_FLAG == 1 then
        content = content.gsub(/AND_#{old_key}/, "AND_" + new_key)
        File.open file, "w" do |update|
          update.puts content
        end
        puts "I changed #{old_key} to #{new_key} keys in #{file}"
      else
        puts "Script can change #{old_key} to #{new_key} keys in #{file}" 
      end
    end
    
    # composite names with share_of_
    if content =~ /share_of_#{old_key}/ then
      # Only replace if REPLACEMENT_FLAG == 1
      if REPLACEMENT_FLAG == 1 then
       content = content.gsub(/share_of_#{old_key}\b/, "share_of_" + new_key)
        File.open file, "w" do |update|
          update.puts content
        end
        puts "I changed #{old_key} to #{new_key} keys in #{file}"
      else
        puts "Script can change #{old_key} to #{new_key} keys in #{file}" 
      end
    end      
  end
end

# Print to screen a message of how to rename the converters.
if ARGV.length < 2 then
  puts "\nDefault behavior: finding files only. To replace give '--replace' as second argument"
end    
