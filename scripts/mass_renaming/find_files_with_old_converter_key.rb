require 'rubygems'
require 'CSV'
require 'fileutils'

files = Dir.glob("/Users/WvL/Documents/github/etsource/**/*") - Dir.glob("/Users/WvL/Documents/github/etsource/datasets/**/*") - Dir.glob("/Users/WvL/Documents/github/etsource/scripts/**/*") 
#to do: Add etengine

oldname = "algue_diesel_distribution_transport_energetic"
newname = "algue_diesel_distribution_energy_energetic"
 
#clean up file list with hidden files (that start with .) or files that are actually directories
files.delete_if do |file_name| 
  file_name[0] == "." || File.directory?(file_name)
  end

for file in files
  content = File.read(file)
  if content =~ /#{oldname}/ then
    File.open(file)
    puts "I can change the old key in #{file} from #{oldname} to #{newname}" if content.gsub(oldname, newname)
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
  if datasetcontent =~ /#{oldname}/ then
    File.open(datasetfile)
    puts "#{oldname} in #{file} will be changed by InputExcel" if content.gsub(oldname, newname)
  end
end