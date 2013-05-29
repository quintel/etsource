#!/usr/bin/env ruby

require 'csv'

path = ARGV[0]

files = Dir.glob('presets/**/*.yml')

CSV.open(path).each do |line|
  from, to   = line
  from_regex = "[[:<:]]#{ from }:"
  to_regex   = "#{ to }:"

  files.each do |file_path|
    command = "sed -E -i '' \"s/#{ from_regex }/#{ to_regex }/g\" #{ file_path }"
    if system(command)
      puts "Succesfully updated #{ from } -> #{ to } in #{ file_path }"
    else
      puts "FAILED! trying to run #{ commmand }"; exit
    end
  end
end
