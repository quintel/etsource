module ETSource

  class Gquery < ActiveDocument

    attr_accessor :key, :description, :query, :unit, :deprecated_key, :file_path

    FILE_SUFFIX     = 'gql'
    DIRECTORY       = 'gqueries'

    def load_file(file_path)
      parsed_content = ETSource::Parser.new(File.read(file_path)).to_hash
      self.new(parsed_content.merge({file_path:file_path}))
    end

  end # class Guery

end # module ETSource
