require 'spec_helper'

describe ETSource do

  describe "root" do

    it "should return a string" do
      expect(ETSource.root.size).to be > 1
    end

  end

end
