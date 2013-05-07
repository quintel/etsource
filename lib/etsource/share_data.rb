module ETSource
  # Parses data about edge shares from datasets/$AREA/shares files.
  class ShareData
    attr_reader :dataset, :file_key

    # Public: Creates a new ShareData instance.
    #
    # dataset  - The corresponding Dataset, whose share data is to be read.
    # file_key - The name of the data file, minus extension.
    #
    # Returns a ShareData.
    def initialize(dataset, file_key)
      @dataset  = dataset
      @file_key = file_key.to_sym

      unless path.file?
        raise UnknownShareDataError.new(path)
      end
    end

    # Public: The absolute path to the share data file on disk.
    #
    # Returns a Pathname.
    def path
      @dataset.path.join("shares/#{ @file_key }.csv")
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
      "#<#{ self.class.name } area=#{ @dataset.key } file_key=#{ file_key }>"
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
      "#{ @dataset.key }.#{ @file_key }"
    end

  end # ShareData
end # ETSource
