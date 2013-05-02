module ETSource
  # Parses data about edge shares from datasets/$AREA/shares files.
  class ShareData
    DIRECTORY = 'data/datasets/:area/shares'

    attr_reader :area, :file_key

    # Public: Creates a new ShareData instance.
    #
    # area     - The key for the area; share data is scoped by region, so you
    #            must specify the area code for the region.
    # file_key - The name of the file, minus extension, from which to read
    #            share data.
    #
    # Returns a ShareData.
    def initialize(area, file_key)
      @area     = area.to_sym
      @file_key = file_key.to_sym

      unless path.file?
        raise UnknownShareDataError.new(path)
      end
    end

    # Public: The absolute path to the share data file on disk.
    #
    # Returns a Pathname.
    def path
      ETSource.root.
        join(DIRECTORY.gsub(/:area/, @area.to_s)).
        join("#{ @file_key }.csv")
    end

    # Public: The share value whose name matches +attribute+.
    #
    # For example:
    #
    #   data.get(:gasoline) # => 0.3
    #
    # Returns a Numeric, or raises an error if no such attribute exists in the
    # source file.
    def get(attribute)
      row(attribute)[1]
    end

    # Public: A human-readable version of the ShareData. Useful for debugging.
    #
    # Returns a string.
    def inspect
      "#<#{ self.class.name } area=#{ area } file_key=#{ file_key }>"
    end

    #######
    private
    #######

    # Internal: The full row whose first column matches the given +key+.
    #
    # Returns an array; each element is a column in the CSV source file.
    def row(key)
      table.find { |row| row.first.downcase.strip == key.to_s } ||
        raise(UnknownShareAttributeError.new(key, full_key))
    end

    # Internal: The CSV table used to read the source file.
    #
    # Returns a CSV::Table.
    def table
      @table ||= CSV.table(path, headers: false)
    end

    # Internal: The full key name of the file; the area and file key separated
    # with a dot.
    #
    # Returns a string.
    def full_key
      "#{ @area }.#{ @file_key }"
    end

  end # ShareData
end # ETSource
