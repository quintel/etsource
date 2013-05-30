require 'spec_helper'

module ETSource
  describe Input do
    describe 'priority' do
      it 'defaults to zero' do
        expect(Input.new(key: 'ohnoes').priority).to eq(0)
      end
    end # priority
  end # Input
end # ETSource
