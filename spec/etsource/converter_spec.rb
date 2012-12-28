require 'spec_helper'

module ETSource

describe Converter do

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

end #describe Converter 

end #module
