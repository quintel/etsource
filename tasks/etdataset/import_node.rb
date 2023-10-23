namespace :import do
  desc <<-DESC
    Import data from an ETDataset node analysis file. Imports all the attributes
    which live in cells with the headers 'Attribute' and 'Value'
    on an Excel tab called 'Dashboard'. If these names are not met, this
    script will not function as intended.

    For example:

      rake import:node NODE=industry_burner_coal

  DESC
  task node: :environment do
    include ImportHelper

    if ENV['NODE'].blank?
      raise "Please provide a node name. For example: bundle exec rake import:node NODE=my_node"
    end

    ENV['NODE'].split(',').each do |raw_node|

      node =
        if Atlas::EnergyNode.exists?(raw_node)
          Atlas::EnergyNode.find(raw_node)
        elsif Atlas::MoleculeNode.exists?(raw_node)
          Atlas::MoleculeNode.find(raw_node)
        else
          raise "No such node found in ETSource: #{raw_node}"
        end

      basename  = [node.key, node.class.subclass_suffix].compact.join('.')
      node_path = "#{node.graph_config.name}/#{node.sector}/#{basename}"
      xlsx      = Roo::Spreadsheet.open("#{ETDATASET_PATH}/nodes_source_analyses/#{node_path}.xlsx")

      xlsx.sheet('Dashboard').each(attribute: 'Attribute', value: 'Value') do |key_val|
        next unless key_val[:value].is_a?(Numeric)

        attribute = key_val[:attribute].strip

        if attribute =~ /\./
          attribute, subkey = attribute.split('.', 2)

          begin
            subhash = get_attribute(node, attribute, subkey)
          rescue KeyError => e
            warn('Ignored:' + e)
            next
          end

          # Check for sub-subhashes (does not work for FeverDetails, TransformerDetails - Storage etc)
          subhash, subkey = set_subhashes(subhash, subkey) if subhash.is_a?(Hash)

          set_attribute(subhash, subkey, key_val[:value])
        else
          begin
            set_attribute(node, attribute, key_val[:value])
          rescue KeyError => e
            warn('Ignored:' + e)
          end
        end
      end

      node.save(false)
    end
  end
end

# Helper methods for this task
module ImportHelper
  def set_attribute(item, attribute, value)
    if item.respond_to?("#{attribute}=")
      item.public_send("#{attribute}=", value)
    elsif item.is_a?(Hash)
      item[attribute.to_sym] = value
    else
      raise_attribute_error(item, attribute, "= #{value}")
    end
  end

  def get_attribute(item, attribute, *info)
    if item.respond_to?(attribute)
      item.public_send(attribute)
    else
      raise_attribute_error(item, attribute, *info)
    end
  end

  def raise_attribute_error(item, attribute, *info)
    raise KeyError("#{attribute} #{info} (no such attribute on #{item.class})")
  end

  def set_subhashes(subhash, subkey)
    while subkey.include?('.')
      left, right = subkey.split('.', 2)
      left = left.to_sym

      subhash[left] = {} unless subhash[left].is_a?(Hash)

      subkey = right
      subhash = subhash[left]
    end

    [subhash, subkey]
  end
end
