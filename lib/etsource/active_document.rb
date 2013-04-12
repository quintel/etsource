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
        @file_path = @last_saved_file_path = normalize_path(path.to_s)
        super(attributes)
      end

      # Returns the key part of the path. Folders and extensions of course are
      # not part of the key.
      #
      # Example:
      #
      #   general/co2/total_co2_emissions.gql returns total_co2_emissions
      #
      def key
        without_ext = File.basename(file_path, ".#{self.class::FILE_SUFFIX}")

        if subclass_suffix = self.class.subclass_suffix
          # This is an ActiveDocument subclass, so remove the class from the
          # filename also.
          without_ext.chomp(".#{ subclass_suffix }")
        else
          without_ext
        end
      end

      # Changing the key changes a part of the file_path

      # Public: Change the key of the document.
      #
      # This changes the key component of the file path ONLY; you may not
      # provide a file extension; you may not provide a custom subclass
      # string, and you may not provide a subdirectory. For example, if the
      # file is currently saved at a/b/c.thing.suffix, and you change the key
      # to "z", the new path will be a/b/z.thing.suffix.
      #
      # key - The new key.
      #
      # Returns whatever you gave.
      def key=(new_key)
        raise InvalidKeyError.new(new_key) if new_key.nil? || new_key == ""

        file_dir = file_path.relative_path_from(directory)
        self.file_path = normalize_path(file_dir.dirname.join(new_key))
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

      #######
      private
      #######

      # Takes a path and normalized it:
      # * It adds the suffix, if it does not have that all ready
      # * It makes the path absolute.
      def normalize_path(path)
        raise InvalidKeyError.new(path) if path.to_s =~ %r{^/}

        path = directory.join(path.to_s)

        # When this is a subclass, and the user did not specify the subclass
        # name in the file (which happens when they call #key=) we need to
        # explicity add it.
        if self.class.subclassed_document? &&
              ! path.basename.to_s.include?(self.class.subclass_suffix)

          suffixes = [ self.class.subclass_suffix,
                       self.class::FILE_SUFFIX ].compact.join('.')

          path = Pathname.new("#{ path.sub_ext('').to_s }.#{ suffixes }")
        elsif path.extname.to_s != self.class::FILE_SUFFIX
          # No filename was specified; common when calling #new.
          path = path.sub_ext(".#{ self.class::FILE_SUFFIX }")
        end

        path
      end

      # saves it to file
      def save_to_file
        FileUtils.mkdir_p(File.dirname(file_path))
        f = File.open(file_path, 'w')
        f.write(file_contents)
        f.close

        delete_old_file unless @last_saved_file_path == file_path
      end

      def delete_old_file
        File.delete(@last_saved_file_path)
        @last_saved_file_path = file_path
      end

      # Delete the file
      def destroy_file
        File.delete(file_path)
      end

      # Return the file_contents for this object, which is a parsed
      # version.
      def file_contents
        parser = ETSource::HashToTextParser.new(to_hash).to_text
      end

      # Public: The absolute path to the directory in which the documents
      # are stored.
      #
      # Returns a Pathname.
      def directory
        self.class.directory
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
        results = all.select { |i| i.key == key.to_s }
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
        parsed_content = ETSource::TextToHashParser.new(File.read(path)).to_hash

        path           = Pathname.new(path)
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
