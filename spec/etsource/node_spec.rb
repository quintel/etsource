require 'spec_helper'

module ETSource

describe Node do

  let(:node) { Node.new('foo') }

  before(:each) do
    copy_fixtures_to_tmp
    stub_const("ETSource::Node::DIRECTORY",
               "tmp/fixtures/#{Node::DIRECTORY}")
  end

  describe '#all' do
    it 'returns all the subclasses that have been defined' do
      expect(Node.all).to have(4).nodes
    end
  end

  describe '#find' do
    it 'returns a node in its right class' do
      expect(Node.find('converter.foo')).to be_a(Converter)
    end
  end

end #describe Node 

end #module
