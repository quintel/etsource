require 'fileutils'

module ETSource
  module ActiveDocument
    def self.included(base)
      base.class_eval do
        include Virtus
        include ActiveModel::Validations
        include ActiveDocument::Persistence
        include ActiveDocument::Finders
        include ActiveDocument::Naming
        include ActiveDocument::Subclassing
        include ActiveDocument::Last
      end
    end

    # Public: The file extension. You can customise this in subclasses.
    #
    # Returns a String.
    FILE_SUFFIX = 'ad'

    # Public: An optional description available on all documents.
    #
    # Returns a String or nil.
    attr_accessor :description

    # Contains the methods which are available on instances of ActiveDocument
    # classes. This has to be a separate module so that we can ensure that
    # Virtus' +initialize+ method is added before ActiveDocument's.
    module Last
      # Public: Creates a new document
      #
      # attributes - A hash of attributes to be set on the document. You must
      #              at least provide a :path or :key attribute which is used
      #              to name the document.
      #
      # Returns your new document.
      def initialize(attributes)
        path = attributes.delete(:path)
        key  = attributes.delete(:key)

        if path.nil? && key.nil?
          raise NoPathOrKeyError.new(self.class)
        end

        path ? (self.path = path) : (self.key = key)
        @last_saved_file_path = self.path.dup

        super(attributes)
      end

      # Public: A human-readable version of the document.
      #
      # Returns a String.
      def to_s
        "#<#{self.class}: #{key}>"
      end

      # Public: Creates a hash containing the document's attributes, omitting
      # those whose values are nil.
      #
      # Returns a Hash.
      def to_hash
        attributes.reject { |_, value| value.nil? }
      end
    end # Last
  end # ActiveDocument
end # ETSource
