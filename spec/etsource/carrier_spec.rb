require 'spec_helper'

module ETSource

  describe Carrier do

    before(:each) { use_fixtures }

    it 'loads some fixtures' do
      expect(Carrier.all).to have_at_least(1).item
    end

  end

end
