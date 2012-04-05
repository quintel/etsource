require 'rubygems'
require 'csv'
require 'active_support/all'

# CSV-related methods
#
module ETE
  class CSV
    def initialize(file)
      @file = file
    end

    # Yields a block with a hash of the items for each CSV file row
    #
    def parse
      $current_file = @file # let's simplify debugging
      lines = File.readlines @file
      # Excel CSV export sucks. Lots of empty records or, worse, empty lines with a trailing \r\r\n
      valid_lines = lines.map{|l| l.gsub(/[\r\n]/, '')}.join("\n")
      ::CSV.parse valid_lines, :headers => true, :col_sep => ';', :skip_blanks => true, :row_sep => :auto do |row|
        next if row.nil? || row[0].nil? || row[0].empty?
        hash = row.to_hash.symbolize_keys
        hash.each_pair {|k, v| hash[k] = fix_csv_cell(v) }
        yield hash
      end
    end

    private

    # Convert excel file export as needed
    #
    def fix_csv_cell(s)
      if s.blank? || s == 'NULL'
        nil
      elsif s.is_a?(String)
        s.gsub(',', '.').strip
      else
        s
      end
    end
  end
end
