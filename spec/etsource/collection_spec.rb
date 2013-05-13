require 'spec_helper'

module ETSource
  describe Collection do
    let(:node_one)   { Node.new(key: :one) }
    let(:node_two)   { Node.new(key: :two) }
    let(:node_three) { Node.new(key: :three) }
    let(:raw)        { [node_one, node_two, node_three] }
    let(:collection) { Collection.new([node_one, node_two, node_three]) }

    describe '#find' do
      it 'returns the document which matches the given key' do
        expect(collection.find(:two)).to eql(node_two)
      end

      it 'returns the document when there are similar entries' do
        collection.push(Node.new(key: :ona))
        expect(collection.find(:one)).to eql(node_one)
      end

      it 'raises an error when no document matches' do
        expect { collection.find(:nope) }.
          to raise_error(DocumentNotFoundError)
      end

      it 'raises an error when the collection is empty'
    end # #find

    describe '#to_a' do
      it 'returns the documents as an array' do
        expect(collection.to_a).to eql(raw)
      end
    end # #to_a

    describe '#each' do
      it 'delegates to the original collection' do
        elements = []
        collection.each { |v| elements.push(v) }

        expect(elements).to eql(raw)
      end
    end

    describe 'when a document key changes' do
      before { collection.find(:one) ; node_one.key = :new }

      it 'returns the document when given the old key' do
        expect(collection.find(:one)).to eql(node_one)
      end

      it 'does not return the document when given the new key' do
        expect(collection.key?(:new)).to be_false
      end

      context 'with a refreshed collection' do
        let(:refreshed) { collection.refresh }

        it 'does not return the document when given the old key' do
          expect(refreshed.key?(:one)).to be_false
        end

        it 'does returns the document when given the new key' do
          expect(refreshed.find(:new)).to eql(node_one)
        end
      end # with a refreshed collection
    end # when a document key changes
  end # Collection
end # ETSource
