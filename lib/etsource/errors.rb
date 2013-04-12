module ETSource
  # Error class which serves as a base for all errors which occur in ETSource.
  class ETSourceError < StandardError
    def initialize(*args) ; super(make_message(*args)) ; end
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

  DuplicateKeyError = error_class do |key|
    "Duplicate key found: #{ key }"
  end

  MissingAttributeError = error_class do |attribute, object|
    "Missing attribute #{ attribute } for #{ object }"
  end

  InvalidKeyError = error_class do |key|
    "Invalid key entered: #{ key }"
  end

  UnknownUnitError = error_class do |unit|
    "Invalid unit requested: #{ unit }"
  end

  UnknownUseError = error_class do |use, area|
    "Unknown use #{ use } for #{ area }"
  end

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
end
