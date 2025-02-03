namespace :remove_node_attribute do
  desc "Remove a specified attribute from all Atlas nodes"

  task node: :environment do
    include ImportHelper

    # Get the attribute to remove from command-line input
    attribute_to_remove = ENV['ATTRIBUTE']
    
    if attribute_to_remove.nil? || attribute_to_remove.strip.empty?
      raise "Please provide an attribute to remove. Example: bundle exec rake remove_node_attribute:node ATTRIBUTE=efficiency"
    end

    puts "Removing attribute '#{attribute_to_remove}' from all nodes..."

    # Remove attribute from all Energy Nodes
    Atlas::EnergyNode.all.each do |node|
      remove_attribute(node, attribute_to_remove)
    end

    # Remove attribute from all Molecule Nodes
    Atlas::MoleculeNode.all.each do |node|
      remove_attribute(node, attribute_to_remove)
    end

    puts "Attribute '#{attribute_to_remove}' removed from all nodes."
  end
end

# Helper method for attribute removal
module ImportHelper
  def remove_attribute(node, attribute)
    # Convert attribute to a symbol for hash compatibility
    attr_sym = attribute.to_sym
  
    # Check if the node contains the attribute before removing
    if node.respond_to?(attribute) && !node.public_send(attribute).nil?
      node.public_send("#{attribute}=", nil)
      puts "Removed '#{attribute}' from #{node.key}"
    elsif node.is_a?(Hash) && node.key?(attr_sym)
      node.delete(attr_sym)
      puts "Removed '#{attribute}' from #{node.key}"
    else
      puts "Skipping #{node.key}: Attribute '#{attribute}' not found."
      return # Exit without saving
    end
  
    # Save the node only if an attribute was actually removed
    node.save(validate: false)
  end
end