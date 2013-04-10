require 'spec_helper'

module ETSource

describe FinalDemandNode do

  let(:dataset_nl) { Dataset.find(:nl) }
  let(:dataset_uk) { Dataset.find(:uk) }
  let(:node)       { Node.find('fd') }

  before(:each) do
    use_fixtures
  end

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

  describe '#preset_demand' do

    context 'with the Dutch dataset' do

      it 'returns the correct number' do
        expect(node.preset_demand(dataset_nl)).to eql(312.33528)
      end

    end

    context 'with the UK dataset' do

      it 'returns the correct number' do
        expect(node.preset_demand(dataset_uk)).to eql(156.16764)
      end

    end

  end

end #describe FinalDemandNode 

end #module
