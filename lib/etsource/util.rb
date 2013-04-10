module ETSource
  module Util
    module_function

    # Public: Given a CamelCase string, converts it to the under_scored
    # alternative.
    #
    # string - The string to be converted to underscore format.
    #
    # Returns a string.
    def underscore(string)
      string = string.dup

      string.gsub!(/::/, '/')
      string.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
      string.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
      string.tr!('-', '_')
      string.downcase!

      string
    end
  end
end
