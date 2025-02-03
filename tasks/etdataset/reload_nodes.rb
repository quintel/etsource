namespace :refresh_node_data do
  desc "Refresh all Atlas nodes by reloading their data"

  task refresh: :environment do
    include ImportHelper
    puts "Refreshing all Atlas nodes..."

    # Refresh Energy Nodes
    Atlas::EnergyNode.all.each do |node|
      refresh_node(node, "EnergyNode")
    end

    # Refresh Molecule Nodes
    Atlas::MoleculeNode.all.each do |node|
      refresh_node(node, "MoleculeNode")
    end

    puts "All nodes refreshed successfully."
  end
end

# Helper method to refresh a node
module ImportHelper
  def refresh_node(node, type)
    begin
      # Re-instantiate the node by finding it again
      fresh_node =
        if type == "EnergyNode"
          Atlas::EnergyNode.find(node.key)
        elsif type == "MoleculeNode"
          Atlas::MoleculeNode.find(node.key)
        end

      # Overwrite the old node's attributes with the refreshed version
      node.attributes = fresh_node.attributes
      node.save(validate: false) # Save without triggering unnecessary changes

      puts "Refreshed #{node.key}"
    rescue StandardError => e
      puts "Failed to refresh #{node.key}: #{e.message}"
    end
  end
end