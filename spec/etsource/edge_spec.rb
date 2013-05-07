require 'spec_helper'

module ETSource
  describe Edge, :fixtures, :focus do
    it { expect(Edge.new('a,b')).to validate_presence_of(:consumer) }
    it { expect(Edge.new('a,b')).to validate_presence_of(:supplier) }
    it { expect(Edge.new('a,b')).to ensure_inclusion_of(:type).
         in_array([ :share, :flexible, :constant,
                    :inverse_flexible, :dependent ]) }

    describe 'when creating a new Edge' do
      let(:edge) { Edge.new('left,right.ad') }

      it 'sets the consumer from the filename' do
        expect(edge.consumer).to eq(:left)
      end

      it 'sets the supplier from the filename' do
        expect(edge.supplier).to eq(:right)
      end

      it 'sets the edge key' do
        expect(edge.key).to eq(:'left,right')
      end

      it 'sets the filename' do
        expect(edge.file_path.to_s).to match(%r{left,right\.ad$})
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
        expect { Edge.new('left') }.to raise_error(InvalidKeyError)
      end

      it 'raises an error when one edge key is blank' do
        expect { Edge.new('left,') }.to raise_error(InvalidKeyError)
      end

      it "raises an error when the supplier key doesn't match" do
        expect { Edge.new('left,right', consumer: :left, supplier: :no) }.
          to raise_error(InvalidKeyError, /supplier node/)
      end

      it "raises an error when the consumer key doesn't match" do
        expect { Edge.new('left,right', consumer: :no, supplier: :right) }.
          to raise_error(InvalidKeyError, /consumer node/)
      end
    end # creating an Edge with an invalid key

    describe 'changing the key on an Edge' do
      let(:edge) { Edge.new('left,right') }

      context 'changing the supplier node only' do
        before { edge.key = 'left,other' }

        it { expect(edge.key).to eq(:'left,other') }
        it { expect(edge.supplier).to eq(:other) }
        it { expect(edge.consumer).to eq(:left) }
      end

      context 'changing the consumer node only' do
        before { edge.key = 'other,right' } 

        it { expect(edge.key).to eq(:'other,right') }
        it { expect(edge.supplier).to eq(:right) }
        it { expect(edge.consumer).to eq(:other) }
      end

      context 'changing both nodes with a string' do
        before { edge.key = 'one,two' }

        it { expect(edge.key).to eq(:'one,two') }
        it { expect(edge.supplier).to eq(:two) }
        it { expect(edge.consumer).to eq(:one) }
      end

      context 'changing both nodes using a symbol' do
        before { edge.key = :'one,two' }

        it { expect(edge.key).to eq(:'one,two') }
        it { expect(edge.supplier).to eq(:two) }
        it { expect(edge.consumer).to eq(:one) }
      end

      it 'raises an error when omitting the supplier key' do
        expect { edge.key = 'left,' }.to raise_error(InvalidKeyError)
      end

      it 'raises an error when omitting the producer key' do
        expect { edge.key = ',right' }.to raise_error(InvalidKeyError)
      end

      it 'raises an error when providing only one node key' do
        expect { edge.key = 'one' }.to raise_error(InvalidKeyError)
      end

      it 'raises an error if the key is blank' do
        expect { edge.key = '' }.to raise_error(InvalidKeyError)
      end

      it 'raises an error if the key is nil' do
        expect { edge.key = nil }.to raise_error(InvalidKeyError)
      end
    end # changing the key on an Edge

    describe 'parsing an AD file' do
      let(:edge) { Edge.find('bar,foo') }

      it 'sets the supplier' do
        expect(edge.supplier).to eq(:foo)
      end

      it 'sets the consumer' do
        expect(edge.consumer).to eq(:bar)
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
