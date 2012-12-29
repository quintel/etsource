require 'spec_helper'

module ETSource

describe Converter do

  let(:converter) { Converter.new('foo') }

  before(:each) do
    copy_fixtures_to_tmp
    stub_const("ETSource::Converter::DIRECTORY",
               "tmp/fixtures/#{Converter::DIRECTORY}")
  end

  describe '#all' do
    it 'returns at least one converter' do
      expect(Converter.all).to have_at_least(1).converters
    end
  end

  describe '#co2_free' do
    it 'validates presence' do
      expect(converter.valid?).to be_false
      converter.co2_free = 1
      expect(converter.valid?).to be_true
    end

    it 'validates numericality' do
      converter.co2_free = 1
      expect(converter.valid?).to be_true
      converter.co2_free = "a"
      expect(converter.valid?).to be_false
    end
  end

end #describe Converter 

end #module
