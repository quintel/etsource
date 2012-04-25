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
files = Dir.glob(PATH_OF_REPOSITORIES + "etsource/**/*") - Dir.glob(PATH_OF_REPOSITORIES + "etsource/datasets/**/*") - Dir.glob(PATH_OF_REPOSITORIES + "etsource/scripts/**/*") 
#to do: Add etengine

#clean up file list with hidden files (that start with .) or files that are actually directories
files.delete_if do |file_name| 
  file_name[0] == "." || File.directory?(file_name) || File.ftype(file_name) != "file"
  end

for file in files
  next unless File.file?(file)
  content = File.read(file)
  replacements.each do |old_key, new_key|
    if content =~ /#{old_key}/ then
      File.open(file)
      puts "I can change the old key in #{file} from #{old_key} to #{new_key}" if content.gsub(old_key, new_key)
    end
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
  replacements.each do |old_key, new_key|
    if datasetcontent =~ /#{old_key}/ then
      File.open(datasetfile)
      puts "#{old_key} in #{file} will be changed by InputExcel" if content.gsub(old_key, new_key)
    end
  end
end