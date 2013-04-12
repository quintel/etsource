require 'spec_helper'

module ETSource

describe FinalDemandNode, :fixtures do
  let(:node) { Node.find('fd') }

  describe '#all' do
    it "finds existing stuff" do
      expect(FinalDemandNode.all).to have_at_least(1).nodes
    end

    it 'removes the subclass from the key' do
      expect(FinalDemandNode.find('fd').key).
        to_not include('.final_demand_node')
    end
  end

  describe '#find' do
    it "finds the fixture" do
      expect(FinalDemandNode.find('fd')).to_not be_nil
    end
  end

  describe '#demand' do

    context 'with the Dutch dataset' do

      it 'returns the correct number' do
        expect(node.demand(:nl)).to eql(312.33528)
      end

    end

    context 'with the UK dataset' do

      it 'returns the correct number' do
        expect(node.demand(:uk)).to eql(156.16764)
      end

    end

  end

end #describe FinalDemandNode 

end #module
