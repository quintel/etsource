module ETSource

  # The HashToTextParser takes care of translating hashes to text
  #
  # Example:
  #
  #   p = Parser.new({comments: "line 1\nline2", unit: "%", query: "SUM(1+2)"})
  #   p.to_text
  #   => "# line1
  #       # line2
  #       - unit = '%'
  #       SUM(1,2)"

  class HashToTextParser

    Encoding.default_external = Encoding::UTF_8
    Encoding.default_internal = Encoding::UTF_8

    ATTR_PREFIX  = "-"
    ATTR_LINE    = /#{ATTR_PREFIX}\s(.+)\s=\s(.+)/
    COMMENT_LINE = /^#(.+)/
    GQUERY_LINE  = /[^\s]+/

    attr_reader :hash

    def initialize(input)
      raise ArgumentError unless input.is_a?(Hash)
      @comments   = input.delete(:description)
      @query      = input.delete(:query)
      @attributes = input
    end

    def to_text
      [comment_block, attributes_block, query_block].compact.join("\n\n")
    end

    #######
    private
    #######

    def comment_block
      "# #{@comments.gsub("\n", "\n# ")}" if @comments
    end

    def query_block
      @query
    end

    # Internal: Lines containing the attributes for the document, whichi will
    # be written to the file on disk.
    #
    # Returns a string.
    def attributes_block
      if (lines = lines_from_hash(@attributes)).any?
        lines.join("\n")
      end
    end

    # Internal: Given a hash of attributes, returns an array of lines
    # representing each key/value pair in the hash. Recurses into hashes.
    #
    # hash   - The hash of attributes to be formatted.
    # prefix - An optional prefix to be prepended to each key name. Used when
    #          formatting lines within nested hashes.
    #
    # Returns an array of strings.
    def lines_from_hash(hash, prefix = nil)
      hash.each_with_object([]) do |(key, value), collection|
        collection.push(*lines(key, value, prefix))
      end
    end

    # Internal: Given a key and value, formats each value to be saved into the
    # document file.
    #
    # Returns an array of strings; each string a line in the document.
    def lines(key, value, prefix)
      case value
      when Hash
        lines_from_hash(value, attr_key(prefix, key))
      when Array, Set
        if value.any? { |value| value.is_a?(Hash) }
          raise IllegalNestedHashError.new(value)
        end

        lines(key, "[#{ value.to_a.join(", ") }]", prefix)
      else
        [ "- #{ attr_key(prefix, key) } = #{ value }" ]
      end
    end

    # Internal: Determines the name to be assigned to an attribute.
    #
    # Returns a string.
    def attr_key(prefix, key)
      prefix.nil? ? key.to_s : "#{ prefix }.#{ key }"
    end

  end # HashToTextParser
end # ETSource::Parser
