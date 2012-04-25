require 'rubygems'
require 'CSV'
require 'fileutils'

files = Dir.glob("/Users/WvL/Documents/github/etsource/**/*") - Dir.glob("/Users/WvL/Documents/github/etsource/datasets/**/*") - Dir.glob("/Users/WvL/Documents/github/etsource/scripts/**/*") 
 
#clean up file list with hidden files (that start with .) or files that are actually directories
files.delete_if do |file_name| 
  file_name[0] == "." || File.directory?(file_name)
  end

#loop through all the files
files.each do |file_name|
  content = File.read file_name
  if content =~ /algue_diesel_distribution_transport_energetic/ then
    newcontent = content.gsub(/algue_diesel_distribution_transport_energetic/, "algue_diesel_distribution_energy_energetic")
    File.open file_name, "w" do |r|
      r.puts newcontent
    end
  puts "I changed the deprecated key in #{file_name}"
  end    
end