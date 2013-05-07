module ETSource
  class Edge
    include ActiveDocument

    DIRECTORY = 'edges'

    attribute :type,         Symbol
    attribute :parent_share, Float
    attribute :child_share,  Float
    attribute :reversed,     Boolean, default: false
    attribute :query,        String

    validates :supplier, presence: true
    validates :consumer, presence: true
    validates :carrier,  presence: true

    validates :type, inclusion: { in: [ :share, :flexible, :constant,
                                        :inverse_flexible, :dependent ] }

    attr_reader :supplier
    attr_reader :consumer
    attr_reader :carrier

    # Public: Creates a new Edge. Extracts the consumer and supplier
    # attributes from the edge if they aren't explicitly specified in the
    # attributes.
    #
    # path  - Path to the edge document.
    # attrs - An optional hash containing attributes for the Edge.
    #
    # Returns an Edge.
    def initialize(path, attrs = {})
      super
      update_key_fragments!
    end

    # Public: The unique key which identifies this edge.
    #
    # This is a combination of the consumer (left node) and the supplier
    # (right node).
    #
    # Returns a Symbol.
    def key
      :"#{ consumer }-#{ supplier }@#{ carrier }"
    end

    # Public: Sets a new key for the edge. This changes the consumer and
    # supplier node keys, and sets a new file path.
    #
    # new_key - The new key to set.
    #
    # Returns whatever you gave.
    def key=(new_key)
      super
      update_key_fragments!
    end

    # Public: Sets the new path for the document. Also updates the consumer
    # and supplier node keys, and the carrier.
    #
    # path - A string or Pathname to the document file.
    #
    # Returns the path.
    def file_path=(path)
      @file_path = directory.join(path)
      update_key_fragments!
    end

    # Public: Sets the key of the consumer ("child" or "left") node.
    #
    # consumer - The consumer node key as a string or symbol.
    #
    # Returns the key.
    def consumer=(consumer)
      @consumer = consumer && consumer.to_sym
    end

    # Public: Sets the key of the supplier ("parent" or "right") node.
    #
    # supplier - The supplier node key as a string or symbol.
    #
    # Returns the key.
    def supplier=(supplier)
      @supplier = supplier && supplier.to_sym
    end

    # Public: Sets the name of the carrier; the type of energy which passes
    # through the edge.
    #
    # carrier - The name of the carrier.
    #
    # Returns the key.
    def carrier=(carrier)
      @carrier = carrier && carrier.to_sym
    end

    #######
    private
    #######

    # Internal: Given a path to the Edge document, extracts the keys for the
    # consumer and supplier nodes.
    #
    # Returns an array containing two symbols, or raises InvalidEdgeKeyError
    # if the key is not in the correct format.
    def keys_from_filename(path)
      raise InvalidKeyError.new(path) if path.nil?

      name = Pathname.new(path).basename(".#{ self.class::FILE_SUFFIX }").to_s

      unless name.match(/^[\w_]+-[\w_]+@[\w_]+$/)
        raise InvalidKeyError.new(path)
      end

      name.split(/[-@]/).map(&:to_sym)
    end

    # Internal: When the key of filename is updated, also sets the consumer,
    # supplier, and carrier keys.
    #
    # Returns nothing.
    def update_key_fragments!
      keys = keys_from_filename(file_path)

      self.consumer = keys[0]
      self.supplier = keys[1]
      self.carrier  = keys[2]
    end
  end # Edge
end # ETSource
