require 'spec_helper'

module ETSource

  describe Runtime, :fixtures do
    let(:dataset) { Dataset.find(:nl) }
    let(:graph)   { Turbine::Graph.new }
    let(:runtime) { Runtime.new(dataset, graph) }

    let!(:parent)       { graph.add(Turbine::Node.new(:parent)) }
    let!(:child)        { graph.add(Turbine::Node.new(:child)) }
    let!(:orphan)       { graph.add(Turbine::Node.new(:orphan)) }

    let!(:pc_elec_edge) { parent.connect_to(child, :electricity) }
    let!(:pc_gas_edge)  { parent.connect_to(child, :gas) }
    let!(:cp_gas_edge)  { child.connect_to(parent, :gas) }

    it "executes basic ruby code" do
      expect(runtime.execute("1+1")).to eql 2
      expect(runtime.execute("[1,2,3].reduce(:+)")).to eql 6
    end

    it "executes standard function from Rubel" do
      expect(runtime.execute("SUM(1,2)")).to eql 3
    end

    context 'EB' do
      it "executes Energy Balance functions" do
        expect(runtime.execute("EB('Residential', 'Natural Gas')")).to be > -1
      end

      it "executes Energy Balance functions without quotes" do
        expect(runtime.execute("EB(residential, natural_gas)")).to be > -1
      end
    end

    context 'AREA' do
      it "executes Area functions" do
        expect(runtime.execute("AREA(number_inhabitants)")).to be > -1
      end
    end

    context 'SHARE' do
      it 'executes SHARE functions' do
        expect(runtime.execute("SHARE(cars, gasoline)")).to eq(0.1)
      end
    end

    context 'DEMAND' do
      before do
        parent.set(:demand, 50.0)
        pc_gas_edge.set(:demand, 20.0)
      end

      it 'retrieves demand of nodes' do
        expect(runtime.execute("DEMAND(parent)")).to eq(50)
      end

      it 'retrieves demand of edges' do
        expect(runtime.execute("DEMAND(parent, child, gas)")).to eq(20)
      end

      it 'raises an error if the node does not exist' do
        expect { runtime.execute("DEMAND(nope)") }.
          to raise_error(UnknownNodeError)
      end

      it 'raises an error if the edge parent does not exist' do
        expect { runtime.execute("DEMAND(nope, child, gas)") }.
          to raise_error(UnknownNodeError)
      end

      it 'raises an error if the edge child does not exist' do
        expect { runtime.execute("DEMAND(parent, nope, gas)") }.
          to raise_error(UnknownNodeError)
      end

      it 'raises an error if the edge does not exist' do
        expect { runtime.execute("DEMAND(parent, orphan, gas)") }.  # :(
          to raise_error(UnknownEdgeError)
      end

      it 'raises an error if the edge carrier does not exist' do
        expect { runtime.execute("DEMAND(parent, child, entropy)") }.
          to raise_error(UnknownEdgeError)
      end

      it 'raises an error if the wrong number of keys were provided' do
        expect { runtime.execute("DEMAND(yes, no)") }.
          to raise_error(InvalidLookupError)
      end
    end # DEMAND

    context 'PARENT_SHARE' do
      before do
        pc_gas_edge.set(:parent_share, 0.3)
        pc_gas_edge.set(:child_share, 0.5)
        pc_elec_edge.set(:parent_share, 0.7)
      end

      it 'retrieves the parent share of the selected edge' do
        expect(runtime.execute('PARENT_SHARE(parent, child, gas)')).to eq(0.3)
      end

      it 'raises an error if the edge does not exist' do
        expect { runtime.execute('PARENT_SHARE(parent, orphan, gas)') }.
          to raise_error(UnknownEdgeError)
      end

      it 'raises an error if the edge carrier does not exist' do
        expect { runtime.execute('PARENT_SHARE(parent, child, entropy)') }.
          to raise_error(UnknownEdgeError)
      end
    end

    context 'CHILD_SHARE' do
      before do
        pc_gas_edge.set(:parent_share, 0.3)
        pc_gas_edge.set(:child_share, 0.5)
        pc_elec_edge.set(:parent_share, 0.7)
      end

      it 'retrieves the parent share of the selected edge' do
        expect(runtime.execute('CHILD_SHARE(parent, child, gas)')).to eq(0.5)
      end

      it 'raises an error if the edge does not exist' do
        expect { runtime.execute('CHILD_SHARE(parent, orphan, gas)') }.
          to raise_error(UnknownEdgeError)
      end

      it 'raises an error if the edge carrier does not exist' do
        expect { runtime.execute('CHILD_SHARE(parent, child, entropy)') }.
          to raise_error(UnknownEdgeError)
      end
    end

    it "executes combinations of queries and algorithms" do
      query = "EB('residential', 'natural_gas')"
      eb_function = runtime.execute(query)
      expect(runtime.execute("#{query} * 2")).to eql eb_function * 2
    end

    it "executes combinations of different queries" do
      queries = ["EB(residential, natural_gas)", "AREA(number_inhabitants)"]
      outcomes = queries.map { |q| runtime.execute(q) }
      expect(runtime.execute(queries.join(" + "))).to eql outcomes.reduce(:+)
      expect(runtime.execute(queries.join(" * "))).to eql outcomes.reduce(:*)
    end
  end # Runtime
end # ETSource
