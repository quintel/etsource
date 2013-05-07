module ETSource
  # Contains ActiveDocuments, providing a nice way to look up specific
  # documents. It caches the keys of each document after the first call to
  # +find+ to ensure fast lookup. This means that if the key of a document
  # changes, you need to create a new collection. This is simplified for you
  # with +refresh+.
  class Collection < SimpleDelegator

    # Public: Given a +key+, returns the document with the matching key.
    #
    # key - The key to look for.
    #
    # Returns the element from the collection, or nil if none matched.
    def find(key)
      table[key.to_sym]
    end

    # Public: A new copy of the collection without the key cache; this will
    # make +find+ work if one or more document keys have been changed.
    #
    # Returns a Collection.
    def refresh
      self.class.new(__getobj__)
    end

    # Public: A human-readable version of the collection.
    #
    # Returns a string.
    def inspect
      "#<#{ self.class.name } #{ documents.inspect }>"
    end

    #######
    private
    #######

    # Internal: Builds a table of document keys and the documents. Memoizes
    # the result after the first call.
    #
    # Returns a Hash.
    def table
      @table ||= __getobj__.each_with_object(Hash.new) do |document, table|
        table[document.key] = document
      end
    end

  end # Collection
end # ETSource
