module ETSource
  module ActiveDocument
    module Subclassing
      extend ActiveSupport::Concern

      module ClassMethods
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

    end # Subclassing
  end # ActiveDocument
end # ETSource
