module ETSource

  # Error class which serves as a base for all errors which occur in ETSource.
  class ETSourceError < StandardError
    def initialize(*args) ; super(make_message(*args)) ; end
  end

  # Superclass for errors which occur when calculating the Rubel attributes.
  class CalculationError < ETSourceError
  end

  # Internal: Creates a new error class which inherits from ETSourceError,
  # whose message is created by evaluating the block you give.
  #
  # For example
  #
  #   MyError = error_class do |weight, limit|
  #     "#{ weight } exceeds #{ limit }"
  #   end
  #
  #   raise MyError.new(5000, 2500)
  #   # => #<ETSource::MyError: 5000 exceeds 2500>
  #
  # Returns an exception class.
  def self.error_class(superclass = ETSourceError, &block)
    Class.new(superclass) { define_method(:make_message, &block) }
  end

  DocumentNotFoundError = error_class do |key, klass|
    "Could not find a #{ klass.name } with the key #{ key.inspect }"
  end

  DuplicateKeyError = error_class do |key|
    "Duplicate key found: #{ key }"
  end

  MissingAttributeError = error_class do |attribute, object|
    "Missing attribute #{ attribute } for #{ object }"
  end

  IllegalDirectoryError = error_class do |path, directory|
    "The given path #{ path.to_s.inspect } does not appear to be a " \
    "subdirectory of #{ directory.to_s.inspect }"
  end

  InvalidKeyError = error_class do |key|
    "Invalid key entered: #{ key.inspect }"
  end

  NoPathOrKeyError = error_class(InvalidKeyError) do |klass|
    "Cannot create a new #{ klass.name } without a :path or :key"
  end

  UnknownUnitError = error_class do |unit|
    "Invalid unit requested: #{ unit }"
  end

  UnknownUseError = error_class do |use, area|
    "Unknown use #{ use } for #{ area }"
  end

  UnknownShareDataError = error_class do |path|
    "No share data file exists at #{ path.to_s.inspect }"
  end

  UnknownShareAttributeError = error_class do |key, file_key|
    "Unknown share data row #{ key.inspect } in share data #{ file_key }"
  end

  NonMatchingNodesError = error_class(InvalidKeyError) do |node, path, attrs|
    "Cannot specify different #{ node } node in the key and attributes: " \
    "got #{ path.to_s.inspect } and #{ attrs.to_s.inspect }"
  end

  # Graph Structure / Topology Errors ----------------------------------------

  UnknownCarrierError = error_class do |carrier, area|
    "Unknown use #{ carrier } for #{ area }"
  end

  InvalidLinkError = error_class do |link|
    "#{ link.inspect } is not a valid link"
  end

  UnknownLinkTypeError = error_class(InvalidLinkError) do |link, type|
    "#{ link.inspect } uses unknown link type: #{ type.inspect }"
  end

  UnknownLinkNodeError = error_class(InvalidLinkError) do |link, key|
    "Unknown node #{ key.inspect } in link #{ link.inspect }"
  end

  UnknownLinkCarrierError = error_class(InvalidLinkError) do |link, carrier|
    "Unknown carrier #{ carrier.inspect } in link #{ link.inspect }"
  end

  # Rubel Attribute Errors ---------------------------------------------------

  InvalidLookupError = error_class(CalculationError) do |keys|
    "Could not perform a lookup with #{ keys.inspect }. Give a single key " \
    "to look up a Node, or three keys to look up an edge."
  end

  UnknownNodeError = error_class(InvalidLookupError) do |key|
    "No node exists with the key #{ key.inspect }"
  end

  UnknownEdgeError = error_class(InvalidLookupError) do |keys|
    "Could not find edge '#{ keys.first } -#{ keys[1] }-> #{ keys.last }'"
  end

end # ETSource
