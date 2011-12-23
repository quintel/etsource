require 'rubygems'
require 'CSV'
require 'fileutils'

# Find lines that are the same in all datasets and can therefore be moved
# to _defaults. Only works for etsource dumps, and not if files are already
# altered.
#

DIR_OF_FILES = "datasets" #relative to this script!

datasets = Dir.glob('datasets/*/graph/export.yml')
# exclude _defaults and _wizards
datasets.reject!{|d| d.include?('datasets/_')}
datasets_count = datasets.length

str = File.read("datasets/nl/graph/export.yml")

str.lines.each do |l|
  next unless l.include?('(')
  
  result = `grep \"#{l.strip}\" datasets/*/graph/export.yml | wc -l`
  if result.strip == "#{datasets_count}"
    puts l.strip
  end

end


