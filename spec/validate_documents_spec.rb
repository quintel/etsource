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

TO_VALIDATE.each do |name, klass|
  describe "Validating #{ name }:" do
    klass.all.each do |document|
      # xit(document.key.to_s) { expect(document).to be_valid }

      it document.key.to_s do
        # This is a bit silly, but mark any document which isn't valid as
        # pending, until such a time as we actually care about validation.
        if document.valid?
          expect(document).to be_valid
        else
          pending 'Document not yet valid.'
        end
      end
    end # klass.all.each
  end # describe "Validating ..."
end # TO_VALIDATE.each
