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

      # Returns the absolute path to the document.
      def absolute_file_path
        File.join(ETSource.root, file_path)
      end

      # Changing the key changes a part of the file_path
      def key=(new_key)
        raise InvalidKeyError.new(new_key) if new_key == ""

        self.file_path = self.file_path.gsub(
          Regexp.new(Regexp.escape(key)), new_key)
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
        raise InvalidKeyError.new(path) if path =~ /^\//

        unless path =~ /\.#{self.class::FILE_SUFFIX}$/
          path = "#{path}.#{self.class::FILE_SUFFIX}"
        end

        unless path =~ /(?:\/|^)#{self.class::DIRECTORY}\//
          path = File.join(self.class::DIRECTORY, path)
        end

        data_without_root =
          ETSource.data_dir.to_s.gsub!(/^#{ ETSource.root }\//, '')

        unless path =~ /#{ data_without_root }\//
          path = File.join(data_without_root, path)
        end

        path
      end

      # saves it to file
      def save_to_file
        FileUtils.mkdir_p(File.dirname(absolute_file_path))
        f = File.open(absolute_file_path, 'w')
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
        relative_path  = path.gsub("#{ETSource.root}/","")
        without_ext    = File.basename(relative_path).chomp(".#{ self::FILE_SUFFIX }")

        if without_ext.include?('.')
          subclass = without_ext.split('.').last

          klass = "ETSource::#{subclass.to_s.classify}".constantize
          klass.new(relative_path, parsed_content)
        else
          if subclassed_document?
            # If the current class is not the top-most model (e.g. Node), then
            # filenames without an explicit subclass should use the top-most
            # class, and not the current one.
            topmost_document_class.new(relative_path, parsed_content)
          else
            new(relative_path, parsed_content)
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
    end # ClassMethods
  end # ActiveDocument
end # ETSource
