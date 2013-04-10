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

    def attributes_block
      return if @attributes.empty?

      lines = []
      @attributes.each do |key, value|
        if value.is_a?(Array)
          lines << "#{ATTR_PREFIX} #{key} = [#{value.join(", ")}]"
        else
          lines << "#{ATTR_PREFIX} #{key} = #{value}"
        end
      end
      lines.join("\n")
    end

    def query_block
      @query
    end

  end # class HashToTextParser

end # module ETSource::Parser
