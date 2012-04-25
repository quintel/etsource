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
    puts "I can change the old key in #{file} from old to new" if content.gsub!("algue_diesel_import_export_transport_energetic", "algue_diesel_import_export_energy_energetic")
  end
end

# Do the same for dataset files 
datasetfiles = Dir.glob("/Users/WvL/Documents/github/etsource/datasets/**/*") 

#clean up file list with hidden files (that start with .) or files that are actually directories
datasetfiles.delete_if do |file_name| 
  file_name[0] == "." || File.directory?(file_name)
end

for datasetfile in datasetfiles
  datasetcontent = File.read(datasetfile)
  if datasetcontent =~ /algue_diesel_import_export_transport_energetic/ then
    File.open(datasetfile)
    puts "The old key in #{file} will be changed by InputExcel" if content.gsub("algue_diesel_import_export_transport_energetic", "algue_diesel_import_export_energy_energetic")
  end
end