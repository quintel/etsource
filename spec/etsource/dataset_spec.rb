require 'spec_helper'

describe ETSource::Dataset do

  describe "area_code" do

    it "should remember area_code" do
      dataset = ETSource::Dataset.new('nl')
      dataset.area_code.should == 'nl'
    end

  end

end
