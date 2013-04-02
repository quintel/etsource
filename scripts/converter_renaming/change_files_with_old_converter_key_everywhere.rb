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

# If the second argument is '--replace', go to replacement mode
if ARGV[1]==='--replace' then
  REPLACEMENT_FLAG = 1
else
  REPLACEMENT_FLAG = 0
end

PATH_OF_REPOSITORIES = File.expand_path("../../../..",__FILE__)

puts PATH_OF_REPOSITORIES

# Define what we want to replace with what
replacements = {}
CSV.foreach(CSV_WITH_REPLACEMENTS) do |row|
  #this is how the columns of the CSV are ordered
  id, old_key, new_key = row
  old_key.strip!
  new_key.strip!
  replacements[old_key] = new_key unless old_key == new_key
end

# Define which files we will be going through
files =
  #Dir.glob(PATH_OF_REPOSITORIES + "/etsource/**/*") 
  Dir.glob(PATH_OF_REPOSITORIES + "/etsource/models/**/*") +
  Dir.glob(PATH_OF_REPOSITORIES + "/etsource/data/inputs/**/*") +
  Dir.glob(PATH_OF_REPOSITORIES + "/etsource/data/gqueries/**/*") +
  Dir.glob(PATH_OF_REPOSITORIES + "/etsource/data/graphs/**/*") +
  Dir.glob(PATH_OF_REPOSITORIES + "/etsource/data/nodes/**/*") +
  Dir.glob(PATH_OF_REPOSITORIES + "/etsource/data/datasets/nl/graph/employment.yml") +
  Dir.glob(PATH_OF_REPOSITORIES + "/etsource/data/datasets/_wizards/households/config.yml") +
  Dir.glob(PATH_OF_REPOSITORIES + "/etsource/data/datasets/_globals/merit_order_converters.yml") +
  Dir.glob(PATH_OF_REPOSITORIES + "/etsource/data/datasets/_wizards/households/transformer.yml") + 
  Dir.glob(PATH_OF_REPOSITORIES + "/etsource/data/datasets/_defaults/graph/converter_costs.yml") + 
  Dir.glob(PATH_OF_REPOSITORIES + "/etsource/data/datasets/_globals/must_run_merit_order_converters.yml") + 
  Dir.glob(PATH_OF_REPOSITORIES + "/etsource/data/datasets/_globals/merit_order.yml") +

  # etengine
  Dir.glob(PATH_OF_REPOSITORIES + "/etengine/**/*") -
  Dir.glob(PATH_OF_REPOSITORIES + "/etengine/tmp/**/*") - 
  Dir.glob(PATH_OF_REPOSITORIES + "/etengine/etsource_export/**/*") - 
  Dir.glob(PATH_OF_REPOSITORIES + "/etengine/log/**/*") - 
  Dir.glob(PATH_OF_REPOSITORIES + "/etengine/statusLog") -
  Dir.glob(PATH_OF_REPOSITORIES + "/etengine/etengine_staging.sql") -
  Dir.glob(PATH_OF_REPOSITORIES + "/etengine/tengine_dev_backup.sql") -
  Dir.glob(PATH_OF_REPOSITORIES + "/etengine/db/old_migrate/**/*") +

  # merit order module
  Dir.glob(PATH_OF_REPOSITORIES + "/merit/**/*") - 
  Dir.glob(PATH_OF_REPOSITORIES + "/merit/output/**/*")

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
  content = File.read(file).force_encoding('utf-8')

  # Actual replacement
  replacements.each do |old_key, new_key|
    raise "can't be nil! (found in #{file_name}: #{old_key} & #{new_key})" if (old_key.nil? || new_key.nil?)

    # straightforward renaming all occurences
    if content.include? old_key

      # Only replace if REPLACEMENT_FLAG == 1
      if REPLACEMENT_FLAG == 1
        content = content.gsub(old_key, new_key)
        File.open file, "w" do |update|
          update.puts content
        end
        puts "I changed #{old_key} to 
                  #{new_key} keys in 
                  #{file}"
      else
        puts "Script can change #{old_key} to 
                  #{new_key} keys in 
                  #{file}"
      end
    end
  end
end

# Print to screen a message of how to rename the converters.
if ARGV.length < 2 then
  puts "\nDefault behavior: finding files only. To replace give '--replace' as second argument"
end
