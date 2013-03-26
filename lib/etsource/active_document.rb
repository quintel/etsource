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
        File.basename(file_path, ".#{self.class::FILE_SUFFIX}")
      end

      # Returns the absolute path to the document.
      def absolute_file_path
        File.join(ETSource.root, file_path)
      end

      # Changing the key changes a part of the file_path
      def key=(new_key)
        raise InvalidKeyError.new(new_key) if new_key == ""
        self.file_path = self.file_path.gsub(key,new_key)
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
        "<#{self.class}: #{key}>"
      end

      # Public: Creates a hash containing the document's attributes, omitting
      # those whose values are nil.
      #
      # Returns a Hash.
      def to_hash
        attributes.reject { |_, value| value.nil? }
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
        unless path =~ /^#{self.class::DIRECTORY}/
          path = File.join(self.class::DIRECTORY, path)
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
        load_directory
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
        Dir.glob("#{ETSource.root}/#{self::DIRECTORY}/**/*.#{self::FILE_SUFFIX}") do |path|
          items << load_from_file(path)
        end
        items
      end

      def load_from_file(path)
        parsed_content = ETSource::TextToHashParser.new(File.read(path)).to_hash
        relative_path = path.gsub("#{ETSource.root}/","")

        subclass = /(\w+)(?=\.\w+\.#{FILE_SUFFIX})/.match(relative_path)

        if subclass
          klass = "ETSource::#{subclass.to_s.classify}".constantize
          klass.new(relative_path, parsed_content)
        else
          new(relative_path, parsed_content)
        end
      end
    end # ClassMethods
  end # ActiveDocument
end #e ETSource
