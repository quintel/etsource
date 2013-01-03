require 'spec_helper'

module ETSource

describe EnergyBalance do

  let(:eb) { EnergyBalance.new(:nl) }

  describe '#new' do

    it "should be able to create a new one" do
      expect(-> { EnergyBalance.new } ).to_not raise_error
    end

    it "should be by default take the Netherlands and unit = PJ" do
      eb = EnergyBalance.new
      expect(eb.area_code).to eql :nl
      expect(eb.unit).to eql :pj
    end
  end

  describe "#get" do

    it "returns correct value for NL when asked for a specific attribute" do
      eb.stub(:get_ktoe).and_return 6
      expect(eb.get("Residential","coal_and_peat")).to eql 0.251208
    end

    it "works with other units" do
      eb.unit = :twh
      eb.stub(:get_ktoe).and_return 6
      expect(eb.get("Residential","coal_and_peat")).to eql 0.06978
    end

    it "raises an error when an unknown unit is requested" do 
      eb.unit = :i_do_not_exist
      eb.stub(:get_ktoe).and_return 6
      expect(->{ eb.get("Residential","coal_and_peat") }).to \
        raise_error UnknownUnitError
    end

    it "is flexible on case used" do
      expect(eb.get("residential","coal_and_peat")).to_not be_nil
      expect(eb.get("Residential","Coal_and_peat")).to_not be_nil
    end

    it "finds long names with spaces and astrixes" do
      expect(eb.get("International Marine Bunkers","Coal_and_peat")).to_not \
        be_nil
    end

    it "finds long names when it uses underscores" do
      expect(eb.get("international_marine_bunkers","coal_and_peat")).to_not \
        be_nil
    end

    it "finds carriers with spaces" do
      expect(eb.get("international_marine_bunkers","coal and peat")).to_not \
        be_nil
    end

    it "does not complain about trailing spaces" do
      expect(eb.get("residential ", " coal_and_peat")).to_not be_nil
    end

    it "raises an error when use is not known" do
      expect { eb.get("foo", "coal_and_peat") }.to raise_error
    end

    it "raises an error when carrier is not known" do
      expect { eb.get("residential", "kryptonite") }.to raise_error
    end

  end

  describe "#query" do

    it "returns a value when asked for a specific number" do
      expect(eb.query("residential,coal_and_peat")).to_not be_nil
    end

  end

end

end
