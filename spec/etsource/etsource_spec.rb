require 'spec_helper'

describe ETSource do

  describe "root" do

    it "should return a string" do
      ETSource.root.size.should be > 1
    end

  end

end
