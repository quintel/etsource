require 'spec_helper'

module ETSource

describe Node, :fixtures do
  let(:node) { Node.new('foo') }

  describe '#establish_links!' do
    let(:node)   { Node.new('key') }
    let(:parent) { Node.new('parent') }
    before       { ETSource::Util.establish_links!([node, parent], link_data) }

    context 'with a single, share link' do
      let(:link_data) { [ 'key-(coal) -- s --> (coal)-parent' ] }
      let(:edge)      { node.turbine.in_edges.first }

      it 'adds a single incoming edge' do
        expect(node.turbine.in_edges.to_a).to have(1).edge
      end

      it 'sets the edge type to :share' do
        expect(edge.get(:type)).to eql(:share)
      end

      it 'sets the parent to Node(:parent)' do
        expect(edge.from).to eql(parent.turbine)
      end

      it 'adds an outgoing edge from the parent' do
        expect(parent.turbine.out_edges.to_a).to eql([edge])
      end

      it 'sets the :reversed property to false' do
        expect(edge.get(:reversed)).to be_false
      end
    end # with a single, share link

    context 'with a reversed link' do
      let(:link_data) { [ 'key-(coal) <-- s -- (coal)-parent' ] }
      let(:edge)      { node.turbine.in_edges.first }

      it 'adds a single incoming edge' do
        expect(node.turbine.in_edges.to_a).to have(1).edge
      end

      it 'sets the :reversed property to true' do
        expect(edge.get(:reversed)).to be_true
      end

      it 'sets the edge type to :share' do
        expect(edge.get(:type)).to eql(:share)
      end

      it 'adds an outgoing edge from the parent' do
        expect(parent.turbine.out_edges.to_a).to eql([edge])
      end
    end # with a reversed link

    context 'with multiple links using different carriers' do
      let(:link_data) { [
        'key-(coal) -- s --> (coal)-parent',
        'key-(corn) -- s --> (corn)-parent'
      ] }

      describe 'the coal edge' do
        let(:edge) { node.turbine.in_edges.first }

        it 'sets the carrier (label) to coal' do
          expect(edge.label).to eql('coal')
        end
      end # the coal edge

      describe 'the corn edge' do
        let(:edge) { node.turbine.in_edges.to_a.last }

        it 'sets the carrier (label) to corn' do
          expect(edge.label).to eql('corn')
        end
      end # the corn edge
    end # with multiple links using different carriers

    { 's' => :share, 'f' => :flexible, 'c' => :constant,
      'd' => :dependent, 'i' => :inverse_flexible }.each do |str, type|
      describe "with link_type=#{str}" do
        let(:link_data) { ["key-(coal) -- #{str} --> (coal)-parent"] }
        let(:edge)      { node.turbine.in_edges.first }

        it "sets the link type to #{type.inspect}" do
          expect(edge.get(:type)).to eql(type)
        end
      end # with link_type=?
    end # each link type

    context 'with a non-matching link' do
      let(:link_data) { [] }

      it 'raises an InvalidLinkError' do
        links = ['key-(coal) - s -> (coal)-parent']

        expect { ETSource::Util.establish_links!([node, parent], links) }.
          to raise_error(ETSource::InvalidLinkError)
      end
    end # with an invalid link type

    context 'with an invalid link type' do
      let(:link_data) { [] }

      it 'raises an InvalidLinkError' do
        links = ['key-(coal) -- a --> (coal)-parent']

        expect { ETSource::Util.establish_links!([node, parent], links) }.
          to raise_error(ETSource::UnknownLinkTypeError)
      end
    end # with an invalid link type

    context 'with a non-existent node' do
      let(:link_data) { [] }

      it 'raises an InvalidLinkError' do
        links = ['key-(coal) -- s --> (coal)-nope']

        expect { ETSource::Util.establish_links!([node, parent], links) }.
          to raise_error(ETSource::UnknownLinkNodeError)
      end
    end # with an invalid link type

    context 'with a non-existent carrier' do
      let(:link_data) { [] }

      it 'raises an InvalidLinkCarrierError' do
        # Where iid=infinite improbability drive. Obviously. :)
        links = ['key-(iid) -- s --> (iid)-parent']

        expect { ETSource::Util.establish_links!([node, parent], links) }.
          to raise_error(ETSource::UnknownLinkCarrierError)
      end
    end # with a non-existent carrier
  end # establish_links!

  describe '#turbine' do
    let(:node) { Node.new('key') }

    it 'returns a Turbine node' do
      expect(node.turbine).to be_a(Turbine::Node)
    end
  end

  describe '#in_slots' do
    let(:node) { Node.new('key', in_slots: %w(in_one in_two)) }

    it 'is a Set' do
      expect(node.in_slots).to be_a(Set)
    end

    it 'contains the slots we defined' do
      expect(node.in_slots.to_a).to eql(%w(in_one in_two))
    end
  end

  describe '#out_slots' do
    let(:node) { Node.new('key', out_slots: %w(out_one out_two)) }

    it 'is a Set' do
      expect(node.out_slots).to be_a(Set)
    end

    it 'contains the slots we defined' do
      expect(node.out_slots.to_a).to eql(%w(out_one out_two))
    end
  end

  describe '#all' do
    it 'returns all the subclasses that have been defined' do
      expect(Node.all).to have(4).nodes
    end
  end

  describe '#find' do
    it 'returns a node in its right class' do
      expect(Node.find('foo')).to be_a(Converter)
    end
  end

end #describe Node 

end #module
