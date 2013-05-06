require 'spec_helper'

module ETSource
  describe Runner, :fixtures do
    let(:runner) { Runner.new(Dataset.find(:nl)) }

    it 'exposes a graph' do
      expect(runner.graph).to be_a(Turbine::Graph)
    end

    it 'exposes a runtime' do
      expect(runner.runtime).to be_an(ETSource::Runtime)
    end

    it 'provides access to the original dataset' do
      expect(runner.dataset).to be_an(ETSource::Dataset)
    end

    describe '#calculate' do
      let(:graph) { runner.calculate }

      it 'sets demand of nodes using energy balances' do
        # This number is defined in the energy balance nl.csv file, and the
        # query is `EB(residential, natural_gas) * 1.0`. We multiply by 0.04
        # to convert to ktoe.
        expect(graph.node(:fd).get(:demand)).to eq(7460 * 0.041868)
      end
    end # calculate
  end # Runner
end # ETSource
