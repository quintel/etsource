module ETSource
  module ActiveDocument
    module Finders
      extend ActiveSupport::Concern

      module ClassMethods
        # Public: All the things!
        #
        # Returns an array containing all the documents.
        def all
          if superclass.ancestors.include?(ActiveDocument)
            load_directory.select { |model| model.is_a?(self) }
          else
            load_directory
          end
        end

        # Public: Given a document +key+ finds the matching document.
        #
        # key - The key whose document you want to retrieve.
        #
        # Returns an ActiveDocument, or nil if no such document exists.
        def find(key)
          all.detect { |i| i.key == key.to_sym }
        end
      end # ClassMethods

    end # Finders
  end # ActiveDocument
end # ETSource
