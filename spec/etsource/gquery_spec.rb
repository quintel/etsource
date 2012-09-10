require 'spec_helper'

describe ETSource::Gquery do

  describe "load" do

    it "should load a gquery from file" do
      gquery = ETSource::Gquery.find('total_co2_emissions')
    end

  end

  describe "save" do

    it "should save a gquery to file" do

    end

  end

end
