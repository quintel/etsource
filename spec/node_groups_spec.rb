require 'spec_helper'

RSpec.describe ':inheritable_nou nodes' do
  graph = Atlas::GraphBuilder.build

  Atlas::Node.all.each do |node|
    next unless node.groups.include?(:inheritable_nou)

    describe node.key do
      let(:gnode) { graph.node(node.key) }

      it 'must have exactly one output link' do
        expect(gnode.edges(:out).length).to eq(1)
      end

      it 'must have a parent with a number_of_units attribute' do
        parent_node = gnode.out.first

        if parent_node
          model   = parent_node.get(:model)
          literal = model.number_of_units
          query   = model.queries[:number_of_units]

          expect(literal || query).to be
        else
          pending 'Failure due to no parent node'
        end
      end
    end # describe node.key
  end # each node
end
