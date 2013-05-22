module ETSource
  module ActiveDocument
    module Persistence
      extend ActiveSupport::Concern

      included do
        # Public: Many documents are stored in the root document path (e.g.
        # nodes/, edges/, however it is acceptable to also store them in
        # deeper subdirectories. This contains the subdirectory part of the
        # file's path.
        #
        # Returns a String.
        attr_reader :subdirectory

        private_class_method :load_directory
        private_class_method :load_from_file
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

      # Public: Updates the document's attributes with those given, and saves.
      #
      # attributes - Attributes to be updated on the document.
      #
      # Returns true, or raises an error if the save fails.
      def update_attributes!(attributes)
        self.attributes = attributes
        save!
      end

      # Public: Saves the document to a file on disk.
      #
      # validate - Whether to perform validation prior to saving.
      #            Defaults to true. Setting this to false will save
      #            the document even if the attributes are not valid.
      #
      # Returns true, or false if the validation failed.
      def save(validate = true)
        return false if validate && ! valid?

        # Ensure the directory exists.
        FileUtils.mkdir_p(path.dirname)

        path.open('w') do |file|
          file.write(file_contents)
          file.write("\n") unless file_contents[-1] == "\n"
        end

        # If the document has been renamed, delete the old file.
        if @last_saved_file_path != path && @last_saved_file_path.file?
          @last_saved_file_path.delete
        end

        @last_saved_file_path = path

        true
      end

      # Public: Saves the document to a file on disk.
      #
      # Returns true, or raises an error if the save fails.
      def save!
        raise(InvalidDocumentError.new(self)) unless save
        true
      end

      # Public: Removes the document from the disk, effectively deleting the
      # record.
      #
      # Returns nothing.
      def destroy!
        path.delete
      end

      #######
      private
      #######

      # Return the file_contents for this object, which is a parsed
      # version.
      def file_contents
        parser = ETSource::HashToTextParser.new(to_hash).to_text
      end

      # ----------------------------------------------------------------------

      module ClassMethods
        # Public: The absolute path to the directory in which the documents
        # are stored.
        #
        # Returns a Pathname.
        def directory
          ETSource.data_dir.join(self::DIRECTORY)
        end

        # Internal: Loads the contents of the document directory, creating
        # a document instance for each file found.
        #
        # DEBT: now all objects always get totally read and created. We can
        # optimize this by just loading the keys, until we need more.
        #
        # Returns an array of documents.
        def load_directory
          items = []
          path  = self.directory.join("**/*.#{ self::FILE_SUFFIX }")

          Dir.glob(path) { |path| items << load_from_file(path) }
          items
        end

        # Internal: Given a +path+ to a document file, reads the file contents
        # creating a new instance containing the data.
        #
        # path - Path to the file.
        #
        # Returns an ActiveDocument.
        def load_from_file(path)
          path           = Pathname.new(path)
          parsed_content = ETSource::TextToHashParser.new(path.read).to_hash
          relative_path  = path.relative_path_from(directory)
          without_ext    = relative_path.basename.sub_ext('')

          if without_ext.to_s.include?('.')
            subclass = without_ext.to_s.split('.').last
            klass = "ETSource::#{subclass.to_s.classify}".constantize
          elsif subclassed_document?
            # If the current class is not the top-most model (e.g. Node), then
            # filenames without an explicit subclass should use the top-most
            # class, and not the current one.
            klass = topmost_document_class
          else
            klass = self
          end

          klass.new(parsed_content.merge(path: relative_path.to_s))
        end
      end # ClassMethods

    end # Persistence
  end # ActiveDocument
end # ETSource
