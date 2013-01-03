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
      expect(Node.all).to have(3).nodes
    end
  end

  describe '#find' do
    it 'returns a node in its right class' do
      expect(Node.find('converter.foo')).to be_a(Converter)
    end
  end

  describe '#co2_free' do
    it 'validates presence' do
      expect(node.valid?).to be_false
      node.co2_free = 1
      expect(node.valid?).to be_true
    end

    it 'validates numericality' do
      node.co2_free = 1
      expect(node.valid?).to be_true
      node.co2_free = "a"
      expect(node.valid?).to be_false
    end
  end

end #describe Node 

end #module
