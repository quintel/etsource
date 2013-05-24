require 'spec_helper'

module ETSource
  describe Slot do
    describe 'validation' do
      subject { Slot.new(key: 'foo+@gas') }

      it { should validate_presence_of(:node) }
      it { should validate_presence_of(:direction) }
      it { should validate_presence_of(:carrier) }

      it { should ensure_inclusion_of(:direction).in_array([:in, :out]) }
    end # validation

    describe 'Creating a input slot' do
      subject { Slot.new(key: 'foo+@gas') }

      its(:node) { should eql(:foo) }
      its(:direction) { should eql(:in) }
      its(:carrier) { should eql(:gas) }
      its(:key) { should eql(:'foo+@gas') }
    end # Creating an input slot

    describe 'Creating a output slot' do
      subject { Slot.new(key: 'bar-@electricity') }

      its(:node) { should eql(:bar) }
      its(:direction) { should eql(:out) }
      its(:carrier) { should eql(:electricity) }
      its(:key) { should eql(:'bar-@electricity') }
    end # Creating an output slot

    describe 'setting the node' do
      let(:slot) { Slot.new(key: 'foo-@gas') }
      before { slot.node = :bar }

      it 'sets the node' do
        expect(slot.node).to eql(:bar)
      end

      it 'changes the key' do
        expect(slot.key).to eql(:'bar-@gas')
      end
    end # setting the node

    describe 'setting the direction' do
      describe 'to in' do
        let(:slot) { Slot.new(key: 'foo-@gas') }
        before { slot.direction = :in }

        it 'sets the direction' do
          expect(slot.direction).to eql(:in)
        end

        it 'changes the key' do
          expect(slot.key).to eql(:'foo+@gas')
        end
      end # to in

      describe 'to out' do
        let(:slot) { Slot.new(key: 'foo+@gas') }
        before { slot.direction = :out }

        it 'sets the direction' do
          expect(slot.direction).to eql(:out)
        end

        it 'changes the key' do
          expect(slot.key).to eql(:'foo-@gas')
        end
      end # to in
    end # setting the direction
  end # Slot
end # ETSource
