require 'fileutils'

module ETSource
  module ActiveDocument
    # Internal: Callback run when ActiveDocument is included into a class.
    #
    # Returns nothing.
    def self.included(base)
      base.class_eval do
        include Virtus
        include ActiveModel::Validations
        include InstanceMethods
        extend  ClassMethods

        attr_accessor :file_path, :description
        attr_reader :key, :subdirectory
      end
    end

    FILE_SUFFIX = 'ad'

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
        raise InvalidKeyError.new(new_key) if new_key.nil? || new_key == ""
        @key = new_key.to_sym

        set_attributes_from_key!(@key)
      end

      # Saves the document (to file)
      # Returns true when succeeded, otherwise raises an Error
      def save!
        save_to_file
        true
      end

      def destroy!
        destroy_file
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

      # Public: Compares this document with another, so that they may be
      # sorted by the order of their keys.
      #
      # Returns -1, 0, or 1.
      def <=>(other)
        key <=> other.key
      end

      # Public: The absolute path to the document.
      #
      # Returns a Pathname.
      def path
        filename = [key, self.class.subclass_suffix, self.class::FILE_SUFFIX]
        filename = filename.compact.join('.')

        if subdirectory
          directory.join(subdirectory).join(filename)
        else
          directory.join(filename)
        end
      end

      # Public: Sets a new path for the document.
      #
      # You may:
      #
      #   * Provide an absolute path if the path is within the +directory+ for
      #     these documents.
      #   * Provide a non-absolute path, which will be relative to the
      #     document +directory+.
      #   * Omit the +subclass_suffix+ used to tell ActiveDocument which
      #     subclass to instantiate.
      #   * Omit the file extension.
      #
      # You may not:
      #
      #   * Change the file extension; new extensions will be ignored.
      #   * Change the +subclass_suffix+; new suffixes will be ignored.
      #
      # Returns the path you gave.
      def path=(path)
        path = Pathname.new(path)

        if path.absolute?
          relative = path.relative_path_from(directory)
        else
          relative = path
        end

        if relative.to_s.include?('..')
          raise IllegalDirectoryError.new(path, directory)
        end

        set_attributes_from_filename!(relative)
      end

      # Public: The absolute path to the directory in which the documents
      # are stored.
      #
      # Returns a Pathname.
      def directory
        self.class.directory
      end

      #######
      private
      #######

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

      # saves it to file
      def save_to_file
        FileUtils.mkdir_p(path.dirname)

        path.open('w') do |file|
          file.write(file_contents)
          file.write("\n") unless file_contents[-1] == "\n"
        end

        delete_old_file unless @last_saved_file_path == path
      end

      def delete_old_file
        @last_saved_file_path.delete
        @last_saved_file_path = path
      end

      # Delete the file
      def destroy_file
        path.delete
      end

      # Return the file_contents for this object, which is a parsed
      # version.
      def file_contents
        parser = ETSource::HashToTextParser.new(to_hash).to_text
      end
    end # InstanceMethods

    module ClassMethods
      def all
        if superclass.ancestors.include?(ActiveDocument)
          load_directory.select { |model| model.is_a?(self) }
        else
          load_directory
        end
      end

      # Return the object with the key if it exists
      # Returns nil if the object is not found
      def find(key)
        results = all.select { |i| i.key == key.to_sym }
        raise DuplicateKeyError.new(key) if results.size > 1
        results.first
      end

      # DEBT: now all objects always get totally read and created. We can
      # optimize this by just loading the keys, until we need more.
      def load_directory
        items = []
        Dir.glob("#{ETSource.data_dir}/#{self::DIRECTORY}/**/*.#{self::FILE_SUFFIX}") do |path|
          items << load_from_file(path)
        end
        items
      end

      def load_from_file(path)
        path           = Pathname.new(path)
        parsed_content = ETSource::TextToHashParser.new(path.read).to_hash
        relative_path  = path.relative_path_from(directory)
        without_ext    = relative_path.basename.sub_ext('')

        if without_ext.to_s.include?('.')
          subclass = without_ext.to_s.split('.').last

          klass = "ETSource::#{subclass.to_s.classify}".constantize
          klass.new(relative_path.to_s, parsed_content)
        else
          if subclassed_document?
            # If the current class is not the top-most model (e.g. Node), then
            # filenames without an explicit subclass should use the top-most
            # class, and not the current one.
            topmost_document_class.new(relative_path.to_s, parsed_content)
          else
            new(relative_path.to_s, parsed_content)
          end
        end
      end

      # Public: The underscored version of the class name, unless it isn't
      # a subclass of an ActiveDocument.
      #
      # Returns a string or nil.
      def subclass_suffix
        if subclassed_document?
          name.split('::').last.underscore
        end
      end

      # Public: Is this class a subclass of an ActiveDocument. This enables
      # ActiveModel-style Single Table Inheritance so that documents with a
      # subclass key instantiate the correct classes.
      #
      # Returns true or false.
      def subclassed_document?
        @subclassed_doc ||= superclass.ancestors.include?(ActiveDocument)
      end

      # Public: Figures out the top-most superclass which includes
      # ActiveDocument.
      #
      # For example:
      #
      #   class A
      #     include ActiveDocument
      #   end
      #
      #   class B < A ; end
      #   class C < B ; end
      #
      #   C.topmost_document_class
      #   # => A
      #
      # Returns a class.
      def topmost_document_class
        topmost = superclass

        while topmost.subclass_suffix
          topmost = topmost.superclass
        end

        topmost
      end

      # Public: The absolute path to the directory in which the documents
      # are stored.
      #
      # Returns a Pathname.
      def directory
        ETSource.data_dir.join(self::DIRECTORY)
      end
    end # ClassMethods
  end # ActiveDocument
end # ETSource
