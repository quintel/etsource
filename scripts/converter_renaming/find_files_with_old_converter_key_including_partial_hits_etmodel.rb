# This script finds all references to the old_keys as defined in the mentioned CSV file on the etmodel and ETengine.
# When references on the engine are found, these have to be changed by hand.
# References on etmodel can be updated automatically with the scripts named "change_files_with_old_converter_key".

require 'rubygems'
require 'CSV'
require 'fileutils'

if ARGV.length < 1 then
    puts "Give as argument a file with format:'id, old_name, new_name' per line."
    exit
end

puts "Using file " + ARGV[0] + " as renaming template."

CSV_WITH_REPLACEMENTS = ARGV[0]
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

  puts "Looking through #{files.count} files on etmodel" if server == "etmodel"

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
      if (server == "etmodel")
        if content =~ /#{old_key}/ then
            File.open(file)
          puts "The script can change the old key in #{file} from #{old_key} to #{new_key}"                           if content.gsub(/share_of_#{old_key}\b/, "share_of_" + new_key) if (server == "etmodel")
          old_files_found = old_files_found + 1                                                                       if content.gsub(/share_of_#{old_key}\b/, "share_of_" + new_key) 
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
  puts "#{old_files_found} old keys found. Changes can be made on etmodel by the change script." if server == "etmodel"

end


#Then we define which files we will be going through
etmodelfiles = Dir.glob(PATH_OF_REPOSITORIES + "/etmodel/**/*")

find_old_names_in_files(replacements, etmodelfiles, "etmodel")

puts "------------------------------------"

