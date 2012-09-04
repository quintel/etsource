require 'spec_helper'

describe ETSource::Input do

  describe "find" do

    it "should not return nil when something is found" do
      input = ETSource::Input.find("agriculture_electricity_demand")
      input.should_not be_nil
    end

    it "should return nil when nothing is found" do
      input = ETSource::Input.find("bla!")
      input.should be_nil
    end

    it "should have the same key as used in the find" do
      input = ETSource::Input.find("agriculture_electricity_demand")
      input.key.should == "agriculture_electricity_demand"
    end

  end

  describe "all" do

    it "should load all existing inputs" do
      input = ETSource::Input.all
      input.should have_at_least(2).items
    end

  end

end
