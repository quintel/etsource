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

    VARIABLE_PREFIX = "-"

    attr_reader :hash, :text

    def initialize(input)
      raise ArgumentError unless input && input.length > 0
      if input[0..2] == "---" #then it is a file containing yaml
        @hash = YAML.load(input).to_hash
      elsif input.is_a?(Hash)
        @hash = input
      elsif input.is_a?(String) && input.length > 0
        @text = input
      end
    end

    # @return [Hash{Symbol=>String}]
    #   Returns a Hash containing the attributes
    #   :query, :description and the attributes provided
    #   in a the text (e.g. :unit)
    #
    def to_hash
      @hash ||= begin
        comment_lines  = []
        variable_lines = []
        query_lines    = []
        text.lines.each do |line|
          case line
          when /^#/
            comment_lines << line
          when /^#{VARIABLE_PREFIX}.*=/
            variable_lines << line
          else
            query_lines << line
          end
        end

        variables = variable_lines.inject({}) do |hash, line|
          key,value = line.match(/-\s*([\w_]+)\s*=\s*(.*)\n/).captures
          hash.merge key.strip.to_sym => value.strip
        end

        # remove trailing #-symbols
        description = comment_lines.map{ |l| l[1..-1].lstrip.gsub(/\n/, "") }.join("\n")
        query = query_lines.join.lstrip

        @hash = { description: description, query: query }.merge(variables)
      end

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

        out = "# #{hash[:description].gsub("\n", "\n# ")}\n"
        out += "\n"

        hash.each do |key, value|
          unless key == :query or key == :description
            if value == "" #since we dont like extra spaces :)
              out += "#{VARIABLE_PREFIX} #{key} =\n"
            else
              out += "#{VARIABLE_PREFIX} #{key} = #{value}\n"
            end
          end
        end

        out += "\n"
        out += hash[:query]

        @text = out
      end
    end

  end

end
