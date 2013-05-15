require 'spec_helper'

module ETSource

describe Node, :fixtures do
  describe '#in_slots' do
    let(:node) { Node.new(key: 'key', in_slots: %w(in_one in_two)) }

    it 'is a Set' do
      expect(node.in_slots).to be_a(Set)
    end

    it 'contains the slots we defined' do
      expect(node.in_slots.to_a).to eql(%w(in_one in_two))
    end
  end

  describe '#out_slots' do
    let(:node) { Node.new(key: 'key', out_slots: %w(out_one out_two)) }

    it 'is a Set' do
      expect(node.out_slots).to be_a(Set)
    end

    it 'contains the slots we defined' do
      expect(node.out_slots.to_a).to eql(%w(out_one out_two))
    end
  end

  describe '#all' do
    it 'returns all the subclasses that have been defined' do
      expect(Node.all).to have(4).nodes
    end
  end

  describe '#find' do
    it 'returns a node in its right class' do
      expect(Node.find('foo')).to be_a(Converter)
    end
  end

  describe '#sector' do
    it 'is an alias of #ns' do
      expect(Node.new(path: 'energy/a').sector).to eq('energy')
    end
  end

  describe '#sector=' do
    let(:node) { Node.new(key: 'a', sector: 'energy') }

    it 'sets the sector' do
      expect(node.sector).to eq('energy')
    end

    it 'is an alias of #ns=' do
      expect(node.ns).to eq('energy')
    end
  end

end #describe Node 

end #module
