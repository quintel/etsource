require 'spec_helper'

module ETSource

describe FinalDemandNode do

  let(:node) { FinalDemandNode.new('foo') }

  before(:each) do
    copy_fixtures_to_tmp
    stub_const("ETSource::Node::DIRECTORY",
               "tmp/fixtures/#{Node::DIRECTORY}")
  end

  describe '#all' do
    it "finds existing stuff" do
      expect(FinalDemandNode.all).to have_at_least(1).nodes
    end
  end

  describe '#find' do
    it "finds the fixture" do
      expect(FinalDemandNode.find('final_demand_node.fd')).to_not be_nil
    end
  end

  describe '#energy_balance' do
    it 'should return the same number that is defined in the energy balance' do
      fd = FinalDemandNode.find('final_demand_node.fd')
      expect(fd.energy_balance(:nl)).to eql(312.33528)
    end
  end

end #describe FinalDemandNode 

end #module
