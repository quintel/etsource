require 'fileutils'

module ETSource
  module ActiveDocument
    extend ActiveSupport::Concern

    include Virtus
    include ActiveModel::Validations
    include ActiveDocument::Persistence
    include ActiveDocument::Finders
    include ActiveDocument::Naming
    include ActiveDocument::Subclassing
    include InstanceMethods

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
    # Virtus' +initialize+ method is added before ActiveDocument's; otherwise
    # the string +path+ attribute is misinterpreted by Virtus as a hash of
    # attributes.
    module InstanceMethods
      def initialize(path, attributes = {})
        super(attributes)

        set_attributes_from_filename!(path)
        @last_saved_file_path = self.path.dup
      end

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
    end # InstanceMethods
  end # ActiveDocument
end # ETSource
