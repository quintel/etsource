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

    # Public: The unique key which identifies this edge.
    #
    # This is a combination of the consumer (left node) and the supplier
    # (right node).
    #
    # Returns a Symbol.
    def key
      :"#{ consumer }-#{ supplier }@#{ carrier }"
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

    # Internal: Given the name of the ActiveDocument file, without a
    # subclass suffix or file extension, creates a hash of the attributes
    # extracted from the filename.
    #
    # Returns a hash.
    def attributes_from_basename(name)
      if name.nil? || ! name.match(/^[\w_]+-[\w_]+@[\w_]+$/)
        raise InvalidKeyError.new(name)
      end

      values = name.split(/[-@]/).map(&:to_sym)

      Hash[ [:consumer, :supplier, :carrier].zip(values) ]
    end
  end # Edge
end # ETSource
