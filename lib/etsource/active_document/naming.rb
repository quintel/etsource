module ETSource
  module ActiveDocument
    module Naming
      extend ActiveSupport::Concern

      # A subdirectory path which is meaningless, and thus gets converted to
      # nil instead.
      NO_DIR = '.'.freeze

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

      # Public: The namespace in which the document is stored.
      #
      # This is determined by the name of the subdirectory in which the
      # document has been saved.
      #
      # This is aliased in some subclasses, such as Node#sector.
      #
      # For example:
      #
      #   Document.new(path: 'abc').ns         # => nil
      #   Document.new(path: 'one/abc').ns     # => "one"
      #   Document.new(path: 'one/two/abc').ns # => "one.two"
      #
      # Returns a string.
      def ns
        document_dir = path.dirname

        if document_dir != directory
          document_dir.relative_path_from(directory).to_s.gsub('/', '.')
        end
      end

      # Public: Sets a new namespace for the document.
      #
      # This is equivilent to setting a new subdirectory, with slashes
      # subsituted for dots.
      #
      # namespace - The namespace to be set
      #
      # For example:
      #
      #   # Set no namespace. Document is stored in ./
      #   document.ns = nil
      #
      #   # Set a namespace. Document is stored in ./energy/consumption/
      #   document.ns = 'energy.consumption'
      #
      # Returns the given namespace.
      def ns=(namespace)
        new_path = directory

        unless namespace.nil? || namespace.length == 0
          new_path = new_path.join(namespace.gsub('.', '/'))
        end

        self.path = new_path.join(key.to_s)
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
        subdir   = relative.dirname.to_s

        @subdirectory = subdir == NO_DIR ? nil : subdir

        self.key = name
      end

    end # Naming
  end # ActiveDocument
end # ETSource
