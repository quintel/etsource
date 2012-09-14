require 'spec_helper'

describe ETSource::EnergyBalance do

  let(:energy_balance) { ETSource::EnergyBalance.new('nl') }

  it "should return correct value for NL when asked for a specific attribute" do
    energy_balance.query("residential coal").should == 5
  end

  describe "#table" do

    it "should return a CSV table" do
      energy_balance.table.should be kind_of(CSV::Table)
    end

  end

end
