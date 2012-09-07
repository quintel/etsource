require 'yaml'

require_relative 'etsource/active_document'
require_relative 'etsource/input'
require_relative 'etsource/gquery'
require_relative 'etsource/parser'

module ETSource

  class << self

    # Parent directory where all the 'models' live
    # such as inputs, gqueries etc.
    def root
      File.expand_path('../..',__FILE__)
    end

  end

end
