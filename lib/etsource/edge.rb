module ETSource
  class Edge
    include ActiveDocument

    DIRECTORY = 'edges'

    attribute :supplier,     Symbol
    attribute :consumer,     Symbol
    attribute :type,         Symbol
    attribute :parent_share, Float
    attribute :child_share,  Float
    attribute :reversed,     Boolean, default: false
    attribute :query,        String

    validates :supplier, presence: true
    validates :consumer, presence: true

    validates :type, inclusion: { in: [ :share, :flexible, :constant,
                                        :inverse_flexible, :dependent ] }

    # Public: Creates a new Edge. Extracts the consumer and supplier
    # attributes from the edge if they aren't explicitly specified in the
    # attributes.
    #
    # path  - Path to the edge document.
    # attrs - An optional hash containing attributes for the Edge.
    #
    # Returns an Edge.
    def initialize(path, attrs = {})
      keys  = keys_from_filename(path)
      attrs = Hash[ [:consumer, :supplier].zip(keys) ].merge(attrs)

      assert_node_key_match!(:consumer, keys[0], attrs)
      assert_node_key_match!(:supplier, keys[1], attrs)

      super(path, attrs)
    end

    # Public: The unique key which identifies this edge.
    #
    # This is a combination of the consumer (left node) and the supplier
    # (right node).
    #
    # Returns a Symbol.
    def key
      :"#{ consumer }-#{ supplier }"
    end

    # Public: Sets a new key for the edge. This changes the consumer and
    # supplier node keys, and sets a new file path.
    #
    # new_key - The new key to set.
    #
    # Returns whatever you gave.
    def key=(new_key)
      super
      self.consumer, self.supplier = keys_from_filename(file_path)
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

      unless name.match(/^[\w_]+-[\w_]+$/)
        raise InvalidKeyError.new(path)
      end

      name.split('-').map(&:to_sym)
    end

    # Internal: Asserts that the key for a node in the path matches the node
    # specified in the attributes hash.
    #
    # Returns nothing; raises NonMatchingNodesError if the nodes do not match.
    def assert_node_key_match!(node, from_path, attrs)
      if attrs[node] != from_path
        raise NonMatchingNodesError.new(node, from_path, attrs[node])
      end
    end
  end # Edge
end # ETSource
