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
      @hash = input
    end

    def to_text
      text = ""

      if hash[:description]
        text += "# #{hash[:description].gsub("\n", "\n# ")}\n"
        text += "\n"
      end

      hash.each do |key, value|
        unless key == :query or key == :description
          if value.is_a?(Array)
            text += "#{ATTR_PREFIX} #{key} = #{value.join(", ")}\n"
          else
            text += "#{ATTR_PREFIX} #{key} = #{value}\n"
          end
        end
      end

      if hash[:query]
        text += "\n"
        text += hash[:query]
      end

      text
    end

  end # class HashToTextParser

end # module ETSource::Parser
