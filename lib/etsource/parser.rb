module ETSource

  # The Parser takes care of translating text-based objects
  # such as gqueries into hashes and back.
  #
  # It accepts both text or a hash as input and can output
  # both.
  #
  # Example:
  #
  # Parser.new(some_file_contents).hash
  # => {comments: nil, unit: "%", query: "1+2"}
  #
  # Parser.new(hash).text
  # => "# comment line1
  #     # comment line2
  #     - unit = '%'
  #     - deprecated_key = 'kg'
  #     SUM(1,2)"

  class Parser

    Encoding.default_external = Encoding::UTF_8
    Encoding.default_internal = Encoding::UTF_8

    ATTR_PREFIX  = "-"
    ATTR_LINE    = /#{ATTR_PREFIX}\s(.+)\s=\s(.+)/
    COMMENT_LINE = /^#(.+)/
    GQUERY_LINE  = /[^\s]+/

    attr_reader :hash, :text

    # Creates a new Parser,
    #
    # params: input as [String, Hash or YAML]
    #         comments: which attribute do you like to be on top of the doc?
    #         body:     which attribute gets multi-line at the end of the doc?
    def initialize(input, comments = :description, body = :query)
      raise ArgumentError unless input && input.length > 0
      if input[0..2] == "---" #file containing yaml
        @hash = YAML.load(input).to_hash
      elsif input.is_a?(Hash)
        @hash = input
      elsif input.is_a?(String) && input.length > 0
        @text = input
      end
      @comments = ""; @variables = {}; @query = ""
    end

    # @return [Hash{Symbol=>String}]
    #   Returns a Hash containing the attributes
    #   :query, :description and the attributes provided
    #   in a the text (e.g. :unit)
    #
    def to_hash
      @hash ||= begin
        process_text

        @hash = {}
        @hash.merge!({description: @comments.strip}) unless @comments.empty?
        @hash.merge!({query: @query.lstrip}) unless @query.empty?

        @hash.merge!(@variables)
      end

    end

    # Central method that goes through all the text
    def process_text
      text.lines.each do |line|
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

    def add_comment(comment_text)
      @comments += comment_text[2..-1]
    end

    def add_variable(variable_text)
      match_data = variable_text.match(ATTR_LINE)
      key = match_data[1]; value = match_data[2]

      if value.include?(",")
        @variables[key.strip.to_sym] = value.split(",").map(&:strip)
      else
        @variables[key.strip.to_sym] = value.strip
      end
    end

    def add_query(query_text)
      @query += query_text
    end

    def to_yaml
      # Get rid of symbols as keys
      out = to_hash.inject({}) do |memo,(k,v)|
        new_key = k.is_a?(Symbol) ? k.to_s : k
        memo[new_key] = v
        memo
      end
      # Make it a yaml
      out = out.to_yaml
      # Get rid of trailing spaces
      out = out.gsub(/\s\n/,"\n")
      # Get rid of tags (e.g. {a: "%"}.to_yaml adds a leading "!" to "%")
      out = out.gsub(/\s\!/,"")
    end

    def to_text
      @text ||= begin

        out = ""

        if hash[:description]
          out += "# #{hash[:description].gsub("\n", "\n# ")}\n"
          out += "\n"
        end

        hash.each do |key, value|
          unless key == :query or key == :description
            if value.is_a?(Array)
              out += "#{ATTR_PREFIX} #{key} = #{value.join(", ")}\n"
            else
              out += "#{ATTR_PREFIX} #{key} = #{value}\n"
            end
          end
        end

        if hash[:query]
          out += "\n"
          out += hash[:query]
        end

        @text = out
      end
    end

  end

end
