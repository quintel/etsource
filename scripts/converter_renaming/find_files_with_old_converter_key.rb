# This script finds all references to the old_keys as defined in the mentioned CSV file on the ETsource and ETengine.
# When references on the engine are found, these have to be changed by hand.
# References on ETsource can be updated automatically with the scripts named "change_files_with_old_converter_key".

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

#Then we define what is done with the selection of files.
def find_old_names_in_files(replacements, files, server)
  #clean up file list with hidden files (that start with .) or files that are actually directories
  files.delete_if do |file_name| 
    file_name[0] == "." || File.directory?(file_name) || File.ftype(file_name) != "file"
  end

  puts "------------------------------------"
  puts "Looking through #{files.count} files on etsource (excluding the dataset)" if server == "etsource"
  puts "Looking through #{files.count} files on the dataset" if server == "dataset"
  puts "Looking through #{files.count} files on Etengine" if server == "engine"

  old_files_found = 0

  # The iconv part is required for the etengine because of some problems that arise regarding an "invalid byte sequence in UTF-8"
  require 'iconv' unless String.method_defined?(:encode)
  for file in files
    next unless File.file?(file)
    content = File.read(file)
    if String.method_defined?(:encode)
      content.encode!('UTF-8', 'UTF-8', :invalid => :replace)
    else
      ic = Iconv.new('UTF-8', 'UTF-8//IGNORE')
      content = ic.iconv(content)
    end

    replacements.each do |old_key, new_key|
      if (server == "etsource" || server == "dataset")
        if content =~ /\b#{old_key}\b/ then
            File.open(file)
          puts "The script can change the old key in #{file} from #{old_key} to #{new_key}"                           if content.gsub(/\b#{old_key}\b/, new_key) if server == "etsource"
          puts "#{old_key} in #{file}"                                                                                if content.gsub(/\b#{old_key}\b/, new_key) if server == "dataset"
          old_files_found = old_files_found + 1                                                                       if content.gsub(/\b#{old_key}\b/, new_key) 
        end
      else 
        if server == "engine"
          if content =~ /#{old_key}/ then
              File.open(file)
            puts "The old key #{old_key} still exists in the ETengine! Here: #{file}! Check if this is not a problem!"  if content.gsub(/#{old_key}/, new_key)
            old_files_found = old_files_found + 1                                                                       if content.gsub(/#{old_key}/, new_key)
          end
        end
      end
    end
  end
  puts "#{old_files_found} old keys found. Changes need to be made on ETsource directly." if server == "etsource"
  puts "#{old_files_found} old keys found that can be changed by InputExcel, after which the xls2yml script can change the names here." if server == "dataset"
  puts "#{old_files_found} old keys found that need attention on ETengine. Also partial matches are shown. Changes need to be made on ETengine to fix this." if server == "engine"
end


#Then we define which files we will be going through
etsourcefiles = Dir.glob(PATH_OF_REPOSITORIES + "/etsource/**/*") - Dir.glob(PATH_OF_REPOSITORIES + "/etsource/datasets/**/*") - Dir.glob(PATH_OF_REPOSITORIES + "/etsource/scripts/**/*") - Dir.glob(PATH_OF_REPOSITORIES + "/etsource/topology/**/*")

# Do the same for dataset files 
datasetfiles = Dir.glob(PATH_OF_REPOSITORIES + "/etsource/datasets/**/*") + Dir.glob(PATH_OF_REPOSITORIES + "/etsource/topology/**/*")

# Do the same for the etengine files
enginefiles = Dir.glob(PATH_OF_REPOSITORIES + "/etengine/**/*") - Dir.glob(PATH_OF_REPOSITORIES + "/etengine/etsource_export/**/*") - Dir.glob(PATH_OF_REPOSITORIES + "/etengine/log/**/*")- Dir.glob(PATH_OF_REPOSITORIES + "/etengine/etengine_staging.sql") 

find_old_names_in_files(replacements, etsourcefiles, "etsource")
find_old_names_in_files(replacements, datasetfiles, "dataset")
find_old_names_in_files(replacements, enginefiles, "engine")
puts "------------------------------------"

