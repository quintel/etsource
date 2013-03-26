module ETSource

  class Gquery
    include ActiveDocument

    attr_accessor :description, :query, :unit, :deprecated_key

    FILE_SUFFIX = 'gql'
    DIRECTORY   = 'data/gqueries'

  end # class Guery

end # module ETSource
