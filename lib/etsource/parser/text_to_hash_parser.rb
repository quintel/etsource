module ETSource

  # The TextToHashParser takes care of translating hashes to text
  #
  # Example:
  #
  #   p = Parser.new("# line1
  #                   # line2
  #                   - unit = '%'
  #                   SUM(1,2)")
  #   p.to_hash
  #   => {comments: "line 1\nline2", unit: "%", query: "SUM(1+2)"}

  class TextToHashParser

    Encoding.default_external = Encoding::UTF_8
    Encoding.default_internal = Encoding::UTF_8

    ATTR_PREFIX  = "-"
    ATTR_LINE    = /#{ATTR_PREFIX}\s(.+)\s=\s(.+)/
    COMMENT_LINE = /^#(.*)/
    GQUERY_LINE  = /[^\s]+/

    def initialize(input)
      @text = input
      @comments = ""; @variables = {}; @query = ""
    end

    # @return [Hash{Symbol=>String}]
    #   Returns a Hash containing the attributes
    #   :query, :description and the attributes provided
    #   in a the text (e.g. :unit)
    #
    def to_hash
      split_text

      # TODO: ugly, fix me please
      hash = {}
      hash.merge!({description: @comments.strip}) unless @comments.empty?
      hash.merge!({query: @query.lstrip}) unless @query.empty?

      hash.merge!(@variables)
    end

    #######
    private
    #######

    # Central method that goes through all the text
    def split_text
      @text.lines.each do |line|
      case line
        when COMMENT_LINE
          add_comment(line)
        when ATTR_LINE
          add_variable(line)
        when GQUERY_LINE
          add_query(line)
        else
          #leave it
        end
      end
    end

    # TODO: prettyify code.
    def add_comment(comment_text)
      if comment_text == "#\n"
        @comments += comment_text[1..-1]
      else
        @comments += comment_text[2..-1]
      end
    end

    def add_variable(variable_text)
      match_data = variable_text.match(ATTR_LINE)
      key = match_data[1]; value = match_data[2]

      @variables[key.strip.to_sym] = cast(value.strip)
    end

    def add_query(query_text)
      @query += query_text
    end

    def cast(text)
      case text
      when /\A[-+]?[0-9]*\.[0-9]+([eE][-+]?[0-9]+)?\z/
        text.to_f
      when /\A[-+]?\d+\z/
        text.to_i
      else
        text
      end
    end

  end

end
