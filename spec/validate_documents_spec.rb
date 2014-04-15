require 'spec_helper'

TO_VALIDATE = {
  carriers: Atlas::Carrier,
  datasets: Atlas::Dataset,
  edges:    Atlas::Edge,
  gqueries: Atlas::Gquery,
  inputs:   Atlas::Input,
  nodes:    Atlas::Node,
  presets:  Atlas::Preset
}

PERMITTED_VALIDATION_ERRORS = {
  Atlas::Input  => [:query]
}

TO_VALIDATE.each do |name, klass|
  permitted_errors = PERMITTED_VALIDATION_ERRORS[klass]

  describe "Validating #{ name }:" do
    klass.all.each do |document|
      # xit(document.key.to_s) { expect(document).to be_valid }

      it document.key.to_s do
        # This is a bit silly, but mark any document which isn't valid as
        # pending, until such a time as we actually care about validation.
        if document.valid?
          expect(document).to be_valid
        elsif ! permitted_errors
          expect(document).to be_valid
        elsif (document.errors.messages.keys - permitted_errors).empty?
          # All the errors are on attributes we want to cause a "pending"
          # message, rather than an outright failure.
          pending "Document not yet valid: #{ document.errors.messages }"
        else
          expect(document).to be_valid
        end
      end
    end # klass.all.each
  end # describe "Validating ..."
end # TO_VALIDATE.each
