require 'spec_helper'

module ETSource

describe Node do

  let(:node) { Node.new('foo') }

  before(:each) do
    use_fixtures
  end

  describe '#all' do
    it 'returns all the subclasses that have been defined' do
      expect(Node.all).to have(4).nodes
    end
  end

  describe '#find' do
    it 'returns a node in its right class' do
      expect(Node.find('foo.converter')).to be_a(Converter)
    end
  end

end #describe Node 

end #module
