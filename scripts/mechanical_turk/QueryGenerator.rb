# This tiny script makes it easier to generate many similar gqueries.
# The converters on which the queries work can be specified in an input file.
# The attributes of the converters that you want to be queried are still hard coded.
require 'fileutils'

# User IO
if ARGV.length != 1 then
    puts "Give as argument a file with one converter name per line."
    exit
else
	puts "Generating gqueries from names in file: " + ARGV[0]
end

#Open file
input_file = ARGV[0]

# Read file and store contents in array
fileNames = IO.readlines(input_file)

# Specify attributes to query
attributes = ["full_load_hours", "number_of_units"]

# Main loop
fileNames.each do|c|

	c = c.strip! # remove whitespace
	attributes.each do|a|

		puts a + " " + c

		# Dynamically create fileNmame
		fileName = "turk_#{a}_of_#{c}.gql"

		# Open file
			outFile = File.new(fileName, "w")
		if outFile
		  	outFile.syswrite("# Return #{a} of #{c}

- unit =

V(#{c}, #{a})

			")
			else
	 		puts "Unable to open file " + outFile + "!"
		end

		puts "Wrote file " + fileName
	end
end

