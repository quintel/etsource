module ETSource

  class Gquery < ActiveDocument

    attr_accessor :description, :query, :unit, :deprecated_key

    FILE_SUFFIX = 'gql'
    DIRECTORY   = 'data/gqueries'

  end # class Guery

end # module ETSource
