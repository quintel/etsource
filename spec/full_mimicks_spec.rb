require 'spec_helper'

MIMICKED_SETS = %w[nl2016 nl2017]

MIMICKED_SETS.each do |mimicked|
  describe "mimicked full of #{mimicked} dataset" do
    let(:original) { mimicked.gsub(/[^a-zA-Z]/, '') }
    let(:original_full){ Atlas::Dataset::Full.find(original).attributes }
    let(:mimicked_full){ Atlas::Dataset::Full.find(mimicked).attributes }

    it 'contains the same keys as original' do
      expect(original_full.keys).to eq mimicked_full.keys
    end

    it 'is disabled in etmodel' do
      expect(mimicked_full[:enabled][:etmodel]).to be_falsey
    end

    it 'is enabled in etenigine' do
      expect(mimicked_full[:enabled][:etengine]).to be_truthy
    end

    # this is ugly but the easiest way to provide the devs with info on
    # which key value pair is wrong
    Atlas::Dataset::Full.find(mimicked.gsub(/[^a-zA-Z]/, ''))
                        .attributes
                        .each do |key, value|
      next if %i[area id enabled analysis_year].include? key

      it "contains the original value for #{key}" do
        expect(mimicked_full[key]).to eq value
      end
    end
  end
end
