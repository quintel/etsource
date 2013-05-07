require 'spec_helper'

module ETSource
  describe Edge, :fixtures do
    it { expect(Edge.new('a-b@gas')).to validate_presence_of(:consumer) }
    it { expect(Edge.new('a-b@gas')).to validate_presence_of(:supplier) }
    it { expect(Edge.new('a-b@gas')).to ensure_inclusion_of(:type).
         in_array([ :share, :flexible, :constant,
                    :inverse_flexible, :dependent ]) }

    describe 'when creating a new Edge' do
      let(:edge) { Edge.new('left-right@gas.ad') }

      it 'sets the consumer from the filename' do
        expect(edge.consumer).to eq(:left)
      end

      it 'sets the supplier from the filename' do
        expect(edge.supplier).to eq(:right)
      end

      it 'sets the carrier from the filename' do
        expect(edge.carrier).to eq(:gas)
      end

      it 'sets the edge key' do
        expect(edge.key).to eq(:'left-right@gas')
      end

      it 'sets the filename' do
        expect(edge.file_path.to_s).to match(%r{left-right@gas\.ad$})
      end
    end # when creating a new Edge

    describe 'creating an Edge with an invalid key' do
      it 'raises an error when the key is nil' do
        expect { Edge.new(nil) }.to raise_error(InvalidKeyError)
      end

      it 'raises an error when the key is blank' do
        expect { Edge.new('') }.to raise_error(InvalidKeyError)
      end

      it 'raises an error when the key has only one edge' do
        expect { Edge.new('left@gas') }.to raise_error(InvalidKeyError)
      end

      it 'raises an error when one edge key is blank' do
        expect { Edge.new('left-@gas') }.to raise_error(InvalidKeyError)
      end

      it 'raises an error when omitting the carrier' do
        expect { Edge.new('one-two') }.to raise_error(InvalidKeyError)
      end

      it 'raises an error when providing only the carrier' do
        expect { Edge.new('@gas') }.to raise_error(InvalidKeyError)
      end
    end # creating an Edge with an invalid key

    describe 'changing the key on an Edge' do
      let(:edge) { Edge.new('left-right@gas') }

      context 'changing the supplier node only' do
        before { edge.key = 'left-other@gas' }

        it { expect(edge.key).to eq(:'left-other@gas') }
        it { expect(edge.supplier).to eq(:other) }
        it { expect(edge.consumer).to eq(:left) }
        it { expect(edge.carrier).to eq(:gas) }
        it { expect(edge.file_path.to_s).
               to match(%{left-other@gas\.ad$}) }
      end

      context 'changing the consumer node only' do
        before { edge.key = 'other-right@gas' } 

        it { expect(edge.key).to eq(:'other-right@gas') }
        it { expect(edge.supplier).to eq(:right) }
        it { expect(edge.consumer).to eq(:other) }
        it { expect(edge.file_path.to_s).to match(%{other-right@gas\.ad$}) }
      end

      context 'changing the carrier only' do
        before { edge.key = 'left-right@electricity' } 

        it { expect(edge.key).to eq(:'left-right@electricity') }
        it { expect(edge.supplier).to eq(:right) }
        it { expect(edge.consumer).to eq(:left) }
        it { expect(edge.carrier).to eq(:electricity) }
        it { expect(edge.file_path.to_s).
               to match(%{left-right@electricity\.ad$}) }
      end

      context 'changing both nodes with a string' do
        before { edge.key = 'one-two@electricity' }

        it { expect(edge.key).to eq(:'one-two@electricity') }
        it { expect(edge.supplier).to eq(:two) }
        it { expect(edge.consumer).to eq(:one) }
        it { expect(edge.carrier).to eq(:electricity) }
        it { expect(edge.file_path.to_s).
               to match(%{one-two@electricity\.ad$}) }
      end

      context 'changing both nodes using a symbol' do
        before { edge.key = :'one-two@gas' }

        it { expect(edge.key).to eq(:'one-two@gas') }
        it { expect(edge.supplier).to eq(:two) }
        it { expect(edge.consumer).to eq(:one) }
        it { expect(edge.carrier).to eq(:gas) }
        it { expect(edge.file_path.to_s).to match(%{one-two@gas\.ad$}) }
      end

      it 'raises an error when omitting the supplier key' do
        expect { edge.key = 'left-@gas' }.to raise_error(InvalidKeyError)
      end

      it 'raises an error when omitting the producer key' do
        expect { edge.key = '-right@gas' }.to raise_error(InvalidKeyError)
      end

      it 'raises an error when providing only one node key' do
        expect { edge.key = 'one@gas' }.to raise_error(InvalidKeyError)
      end

      it 'raises an error when omitting the carrier' do
        expect { edge.key = 'one-two' }.to raise_error(InvalidKeyError)
      end

      it 'raises an error when providing only the carrier' do
        expect { edge.key = '@gas' }.to raise_error(InvalidKeyError)
      end

      it 'raises an error if the key is blank' do
        expect { edge.key = '' }.to raise_error(InvalidKeyError)
      end

      it 'raises an error if the key is nil' do
        expect { edge.key = nil }.to raise_error(InvalidKeyError)
      end
    end # changing the key on an Edge

    describe 'changing the filename' do
      let(:edge) { Edge.new('left-right@gas') }
      before { edge.file_path = 'yes-no@electricity.ad' }

      it 'updates the file path' do
        expect(edge.file_path.to_s).to match(/yes-no@electricity\.ad$/)
      end

      it 'updates the supplier node' do
        expect(edge.supplier).to eql(:no)
      end

      it 'updates the consumer node' do
        expect(edge.consumer).to eql(:yes)
      end

      it 'updates the carrier' do
        expect(edge.carrier).to eql(:electricity)
      end

      it 'updates the key' do
        expect(edge.key).to eql(:'yes-no@electricity')
      end
    end # changing the filename

    describe 'parsing an AD file' do
      let(:edge) { Edge.find('bar-foo@gas') }

      it 'sets the supplier' do
        expect(edge.supplier).to eq(:foo)
      end

      it 'sets the consumer' do
        expect(edge.consumer).to eq(:bar)
      end

      it 'sets the carrier' do
        expect(edge.carrier).to eq(:gas)
      end

      it 'sets the type' do
        expect(edge.type).to eql(:share)
      end

      it 'sets the parent share' do
        expect(edge.parent_share).to eq(0.5)
      end

      it 'sets the child share' do
        expect(edge.child_share).to eq(1)
      end

      it 'sets the query' do
        expect(edge.query).to include('SHARE(cars, gasoline)')
      end
    end # parsing an AD file
  end # Edge
end # ETSource
