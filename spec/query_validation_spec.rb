# frozen_string_literal: true

require 'spec_helper'

# Validates that GQL queries only reference keys that still exist.
#
# A query may refer to other documents through GQL functions, such as Q(...)
# which calls another query. When the referenced document is renamed or
# removed, the reference is left dangling.
#
# Each kind of reference is described by a ReferenceType, which knows the GQL
# function used to make the reference and the set of keys that are valid
# targets. New reference types (for example, node keys) can be added to
# REFERENCE_TYPES without changing the rest of the spec.
RSpec.describe 'Query validation' do
  ReferenceType = Struct.new(:label, :function, :valid_keys, keyword_init: true) do
    # Public: The keys referenced through this function in the given GQL body.
    def referenced_keys(query)
      query.to_s.scan(/\b#{function}\(\s*([a-z0-9_]+)\s*\)/).flatten.map(&:to_sym)
    end

    # Public: The referenced keys which no longer point at an existing document.
    def missing_keys(query)
      referenced_keys(query).reject { |key| valid_keys.include?(key) }
    end
  end

  REFERENCE_TYPES = [
    ReferenceType.new(
      label: 'query',
      function: 'Q',
      valid_keys: Atlas::Gquery.all.map(&:key).to_set
    )
  ].freeze

  Atlas::Gquery.all.each do |gquery|
    describe "Gquery: #{gquery.key}" do
      REFERENCE_TYPES.each do |reference_type|
        it "references existing #{reference_type.label} keys" do
          missing_keys = reference_type.missing_keys(gquery.query)

          messages = missing_keys.map do |missing_key|
            "Query #{gquery.key} refers to missing " \
              "#{reference_type.label} #{missing_key}"
          end

          expect(missing_keys).to(be_empty, messages.join("\n"))
        end
      end
    end
  end
end
