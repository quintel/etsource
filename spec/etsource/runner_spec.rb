require 'spec_helper'

module ETSource
  describe Runner, :fixtures do
    let(:runner) { Runner.new(Dataset.find(:nl), :simple_graph) }

    it 'exposes a graph' do
      expect(runner.graph).to be_a(Turbine::Graph)
    end

    it 'exposes the Refinery graph' do
      expect(runner.refinery_graph).to be_a(Turbine::Graph)
    end

    it 'exposes a runtime' do
      expect(runner.runtime).to be_an(ETSource::Runtime)
    end

    it 'provides access to the original dataset' do
      expect(runner.dataset).to be_an(ETSource::Dataset)
    end

    it 'accepts sector as an option' do
      runner = Runner.new(Dataset.find(:nl), :households)
      expect(runner.sector).to eq :households
    end

    describe '#calculate' do
      let(:edge)  { Edge.find('baz-bar@corn') }
      let(:graph) { runner.calculate }

      # The Turbine edge.
      let(:t_edge) do
        graph.node(:bar).out_edges.detect do |edge|
          edge.to.key == :baz && edge.label == :corn
        end
      end

      it 'sets demand of nodes using energy balances' do
        # This number is defined in the energy balance nl.csv file, and the
        # query is `EB(residential, natural_gas) * 1.0`. We multiply by 0.04
        # to convert to ktoe.
        expect(graph.node(:fd).get(:demand)).
          to eq(ETSource::EnergyUnit.new(7460.0, :ktoe).to_unit(:pj))
      end

      it 'sets the child share of edges using SHARE()' do
        edge.update_attributes!(sets: :child_share)

        # Extracted from the nl/shares/cars.csv file.
        expect(t_edge.get(:child_share)).to eq(0.1)
      end

      it 'sets the parent share of edges using SHARE()' do
        edge.update_attributes!(sets: :parent_share)

        # Extracted from the nl/shares/cars.csv file.
        expect(t_edge.get(:parent_share)).to eq(0.1)
      end

      it 'sets the share of slots with explicit values' do
        Slot.new(key: 'foo-@coal', share: 0.25).save!
        expect(graph.node(:foo).slots.out(:coal).get(:share)).to eq(0.25)
      end

      it 'sets the share of slots with a query' do
        Slot.new(key: 'foo-@coal', query: '0.5 / 2').save!
        expect(graph.node(:foo).slots.out(:coal).get(:share)).to eq(0.25)
      end

      it 'sets the demand of edges' do
        edge.update_attributes!(query: '100.0', sets: :demand)

        ratio   = Rational('10000000/31233528')
        i_ratio = Rational('1') - ratio

        shares = {
          'bar-@corn' => ratio,
          'bar-@coal' => i_ratio,
          'fd+@corn'  => ratio,
          'fd+@coal'  => i_ratio }

        shares.each do |slot_key, share|
          Slot.find(slot_key).update_attributes!(share: share)
        end

        # Extracted from the nl/shares/cars.csv file.
        expect(t_edge.get(:demand)).to eq(100.0)
      end
    end # calculate
  end # Runner
end # ETSource
