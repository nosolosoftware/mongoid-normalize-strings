##
# Let you add normalized fields to mongoid document.
# It saves normalized values of fields when save document.
#
module Mongoid
  module NormalizeStrings
    module ClassMethods
      ##
      # Create normalized field for field
      #
      def normalize(field_name)
        @normalized_fields = (@normalized_fields || Set.new).add field_name
        field "#{field_name}_normalized", type: String
      end

      ##
      # Returns normalized_fields Class intance variable
      #
      def normalized_fields
        normalized_fields = (@normalized_fields || Set.new)

        if self.superclass.methods.include? :normalized_fields
          normalized_fields + self.superclass.normalized_fields
        else
          normalized_fields
        end
      end
    end

    ##
    # Adds class methods
    #
    def self.included(base)
      base.extend(ClassMethods)

      ## Save normalized field value
      base.send(:before_validation) do
        self.class.normalized_fields.each do |field_name|
          if self[field_name]
            self["#{field_name}_normalized"] = I18n.transliterate(self[field_name]).downcase.strip
          end
        end
      end
    end
  end
end
