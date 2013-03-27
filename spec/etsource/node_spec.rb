require 'spec_helper'

module ETSource

describe Node do

  let(:node) { Node.new('foo') }

  before(:each) do
    use_fixtures
  end

  describe '#links' do
    let(:node) { Node.new('key', links: %w(1 2)) }

    it 'is a Set' do
      expect(node.links).to be_a(Set)
    end

    it 'contains the links we defined' do
      expect(node.links.to_a).to eql(%w(1 2))
    end
  end

  describe '#slots' do
    let(:node) { Node.new('key', slots: %w(in_one in_two out_one)) }

    it 'is a Set' do
      expect(node.slots).to be_a(Set)
    end

    it 'contains the slots we defined' do
      expect(node.slots.to_a).to eql(%w(in_one in_two out_one))
    end
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
