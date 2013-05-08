module ETSource
  module ActiveDocument
    module Naming
      extend ActiveSupport::Concern

      included do
        # Public: The unique key used to identify the document.
        #
        # Returns a Symbol.
        attr_reader :key
      end

      # Public: Change the key of the document.
      #
      # This changes the key component of the file path ONLY; you may not
      # provide a file extension; you may not provide a custom subclass
      # string, and you may not provide a subdirectory. For example, if the
      # file is currently saved at a/b/c.thing.suffix, and you change the key
      # to "z", the new path will be a/b/z.thing.suffix.
      #
      # new_key - The new key.
      #
      # Returns whatever you gave.
      def key=(new_key)
        if new_key.nil? || ! new_key.match(/\S/)
          raise InvalidKeyError.new(new_key)
        end

        @key = new_key.to_sym
        set_attributes_from_key!(@key)
      end

      # Public: Compares this document with another, so that they may be
      # sorted by the order of their keys.
      #
      # Returns -1, 0, or 1.
      def <=>(other)
        key <=> other.key
      end

      #######
      private
      #######

      # Internal: When the key is updated, we also update any attributes whose
      # values are stored as part of the key.
      #
      # For example, in "edge" the name of both nodes and the carrier are
      # substrings in the key:
      #
      #   consumer-supplier@carrier
      #
      # This method reads the key and updates each of these attributes.
      #
      # Returns nothing.
      def set_attributes_from_key!(key)
        attributes_from_basename(key.to_s).each do |key, value|
          public_send(:"#{ key }=", value)
        end
      end

      # Internal: Given the name of the ActiveDocument file, without a
      # subclass suffix or file extension, returns a hash of attributes
      # extracted from the filename.
      #
      # This can be overridden to provide more complex file naming.
      #
      # Returns a hash.
      def attributes_from_basename(filename)
        {}
      end

      # Internal: Used to extract from a filename the attributes which are
      # assigned to the document. You can customise the behaviour of this
      # method by overriding +attributes_from_basename+.
      #
      # Returns nothing.
      def set_attributes_from_filename!(path)
        raise InvalidKeyError.new(path) if path.to_s[0] == '/'

        relative = directory.join(path.to_s).relative_path_from(directory)
        name     = relative.basename.to_s.split('.', 2).first

        @subdirectory = relative.dirname.to_s

        self.key = name
      end

    end # Naming
  end # ActiveDocument
end # ETSource
