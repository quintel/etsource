require 'spec_helper'
require 'set'

# The :emissions_skip_crude_oil_mix edge group is an exception used by ETEngine's
# direct-emissions calculation. Normally the recursion stops at the first
# crude_oil edge and uses the crude_oil carrier's intrinsic CO2 value. For the
# energetic final-demand chain of a sector whose oil demand is a *blend* of
# biogenic and fossil oil products (diesel + biodiesel, kerosene + bio_kerosene,
# lpg, bio_oil, ...), that intrinsic value is meaningless: the carrier is only a
# proxy for the basket. The group forces the recursion to keep traversing so the
# CO2 content is derived from the actual bio/fossil composition.
#
# Rule guarded here: EVERY crude_oil edge downstream of such a blending node must
# carry the group. Sectors fed by crude_oil alone (e.g. `other`) and all
# non-energetic feedstock chains (which are not combusted, so the bio/fossil
# split is irrelevant) are left unmarked.
#
# See app/models/qernel/recursive_factor/direct_emissions.rb and
# app/models/qernel/node_api/direct_emissions.rb in ETEngine.
module CrudeOilException
  GROUP   = :emissions_skip_crude_oil_mix
  CARRIER = :crude_oil

  module_function

  # Biogenic carriers are fully sustainable.
  def biogenic?(carrier)
    Atlas::Carrier.find(carrier).sustainable.to_f == 1.0
  end

  # Fossil carriers are fully unsustainable.
  def fossil?(carrier)
    Atlas::Carrier.find(carrier).sustainable.to_f == 0.0
  end

  # A node blends biogenic and fossil oil when it is energetic, supplies
  # crude_oil downstream, and is fed by both a biogenic and a fossil carrier.
  def blending_node?(node)
    return false unless node.get(:model).use == 'energetic'
    return false if node.out_edges(CARRIER).none?

    incoming = node.in_edges
    incoming.any? { |edge| biogenic?(edge.label) } && incoming.any? { |edge| fossil?(edge.label) }
  end

  # Every crude_oil edge reachable downstream of +node+ by following crude_oil
  # edges. Returns the underlying Atlas::Edge documents.
  def downstream_crude_oil_edges(node, seen = Set.new)
    node.out_edges(CARRIER).each_with_object([]) do |edge, collected|
      next unless seen.add?(edge)

      collected << edge.get(:model)
      collected.concat(downstream_crude_oil_edges(edge.to, seen))
    end
  end
end

RSpec.describe ':emissions_skip_crude_oil_mix edge group' do
  graph = Atlas::GraphBuilder.build

  # All energetic final-demand nodes that blend biogenic and fossil oil.
  blending_nodes = graph.nodes.select { |node| CrudeOilException.blending_node?(node) }

  # Every crude_oil edge downstream of those nodes.
  downstream_edges = blending_nodes
    .flat_map { |node| CrudeOilException.downstream_crude_oil_edges(node) }
    .uniq(&:key)
  downstream_keys = downstream_edges.map(&:key).to_set

  describe 'every crude_oil edge downstream of a blending node' do
    downstream_edges.each do |edge|
      it "#{edge.key} carries #{CrudeOilException::GROUP}" do
        expect(edge.groups.include?(CrudeOilException::GROUP)).to be(true),
          "#{edge.key} should carry #{CrudeOilException::GROUP} but does not"
      end
    end
  end

  describe 'every edge carrying the group' do
    marked_edges = Atlas::EnergyEdge.all.select { |edge| edge.groups.include?(CrudeOilException::GROUP) }

    marked_edges.each do |edge|
      it "#{edge.key} is a crude_oil edge downstream of a blending node" do
        expect(downstream_keys.include?(edge.key)).to be(true),
          "#{edge.key} carries #{CrudeOilException::GROUP} but should not"
      end
    end
  end
end
