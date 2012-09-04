module ETSource

  class << self

    # Parent directory where all the 'models' live
    # such as inputs, gqueries etc.
    def root
      File.expand_path('../../..',__FILE__)
    end

  end

end
