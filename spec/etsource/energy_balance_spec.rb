require 'spec_helper'

module ETSource

describe EnergyBalance do

  let(:energy_balance) { EnergyBalance.new(:nl) }

  describe '#new' do

    it "should be able to create a new one" do
      expect(-> { EnergyBalance.new } ).to_not raise_error
    end

    it "should be by default take the Netherlands and unit = PJ" do
      energy_balance = EnergyBalance.new
      expect(energy_balance.area_code).to eql :nl
      expect(energy_balance.unit).to eql :pj
    end
  end

  describe "#get" do

    it "should return correct value for NL when asked for a specific attribute" do
      energy_balance.stub(:get_ktoe).and_return 6
      expect(energy_balance.get("Residential","coal_and_peat")).to eql 0.251208
    end

    it "should work with other units" do
      energy_balance.unit = :twh
      energy_balance.stub(:get_ktoe).and_return 6
      expect(energy_balance.get("Residential","coal_and_peat")).to eql 0.06978
    end

    it "raises an error when an unknown unit is requested" do 
      energy_balance.unit = :i_do_not_exist
      energy_balance.stub(:get_ktoe).and_return 6
      expect(->{ energy_balance.get("Residential","coal_and_peat") }).to \
        raise_error UnknownUnitError
    end

    it "should be flexible on case used" do
      expect(energy_balance.get("residential","coal_and_peat")).to_not be_nil
      expect(energy_balance.get("Residential","Coal_and_peat")).to_not be_nil
    end

    it "should find long names with spaces and astrixes" do
      expect(energy_balance.get("International Marine Bunkers","Coal_and_peat")).to_not be_nil
    end

    it "should find long names when it uses underscores" do
      expect(energy_balance.get("international_marine_bunkers","coal_and_peat")).to_not be_nil
    end

    it "should find carriers with spaces" do
      expect(energy_balance.get("international_marine_bunkers","coal and peat")).to_not be_nil
    end

    it "should not complain about trailing spaces" do
      expect(energy_balance.get("residential ", " coal_and_peat")).to_not be_nil
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
      expect(energy_balance.query("residential,coal_and_peat")).to_not be_nil
    end

  end

end

end
