require 'spec_helper'

describe ETSource::EnergyBalance do

  let(:energy_balance) { ETSource::EnergyBalance.new('nl') }

  describe "#get" do

    it "should return correct value for NL when asked for a specific attribute" do
      energy_balance.get("Residential","coal_and_peat").should == 5
    end

    it "should be flexible on case used" do
      energy_balance.get("residential","coal_and_peat").should == 5
      energy_balance.get("Residential","Coal_and_peat").should == 5
    end

    it "should find long names with spaces and astrixes" do
      energy_balance.get("International Marine Bunkers","Coal_and_peat").should_not be_nil
    end

    it "should find long names when it uses underscores" do
      energy_balance.get("international_marine_bunkers","coal_and_peat").should_not be_nil
    end

    it "should find carriers with spaces" do
      energy_balance.get("international_marine_bunkers","coal and peat").should_not be_nil
    end

    it "should not complain about trailing spaces" do
      energy_balance.get("residential ", " coal_and_peat").should == 5
    end

    it "should raise an error when use is not known" do
      expect { energy_balance.get("foo", "coal_and_peat") }.to raise_error
    end

    it "should raise an error when carrier is not known" do
      expect { energy_balance.get("residential", "kryptonite") }.to raise_error
    end

  end

  describe "#query" do

    it "should return a value when asked for a specific number" do
      energy_balance.query("residential,coal_and_peat").should == 5
    end

  end

end
