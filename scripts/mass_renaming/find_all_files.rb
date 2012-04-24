require 'rubygems'
require 'CSV'
require 'fileutils'

files = Dir.glob("/Users/WvL/Documents/github/etsource/**/*") - Dir.glob("/Users/WvL/Documents/github/etsource/datasets/**/*") - Dir.glob("/Users/WvL/Documents/github/etsource/scripts/**/*") 
 
  #clean up file list with hidden files (that start with .) or files that are actually directories
  files.delete_if do |file_name| 
    file_name[0] == "." || File.directory?(file_name)
  end

for file in files
  content = File.read(file)
    if content =~ /algue_diesel_import_export_transport_energetic/ then
    File.open(file)
    puts "I can change the old key in #{file} from 1 to 2" if content.gsub("algue_diesel_import_export_transport_energetic", "algue_diesel_import_export_energy_energetic")
#    file.write werkt nog niet
 end
end