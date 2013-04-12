module ETSource
  # Contains ActiveDocuments, providing a nice way to look up specific
  # documents. It does not cache the key of each document for N(1) lookup,
  # since the keys can change.
  class Collection < SimpleDelegator
    # Public: Given a +key+, returns the document with the matching key.
    #
    # key - The key to look for.
    #
    # Returns the element from the collection, or nil if none matched.
    def find(key)
      documents = __getobj__ # getobj is from SimpleDelegator

      index = documents.bsearch { |document| document.key <=> key }
      index && documents[index] || nil
    end
  end # Collection
end # ETSource
