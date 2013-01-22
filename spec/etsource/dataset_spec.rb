require 'spec_helper'

module ETSource; describe Dataset do

  before(:each) do
    copy_fixtures_to_tmp
    stub_const("ETSource::Dataset::DIRECTORY",
               "tmp/fixtures/#{Dataset::DIRECTORY}")
  end

  describe "#new" do

    it "sets key" do
      dataset = Dataset.new(:nl)
      expect(dataset.key).to eql "nl"
    end

  end # describe #new

  describe "#load" do

    it "loads a dataset from file" do
      dataset = Dataset.find(:nl)
      expect(dataset).to be_a(Dataset)
    end

  end # describe #load

  describe "#nodes" do
  end

end ; end
