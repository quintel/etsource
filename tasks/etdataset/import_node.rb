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
    node      = Atlas::Node.find(ENV['NODE'])
    basename  = [node.key, node.class.subclass_suffix].compact.join('.')
    node_path = "#{node.sector}/#{basename}"
    xlsx      = Roo::Spreadsheet.open("#{ETDATASET_PATH}/nodes_source_analyses/#{node_path}.xlsx")

    xlsx.sheet('Dashboard').each(attribute: 'Attribute', value: 'Value') do |key_val|
      next unless key_val[:value].is_a?(Numeric)

      attribute = key_val[:attribute].strip

      if attribute =~ /\./
        attribute, subkey = attribute.split('.', 2)
        subhash           = node.public_send(attribute)
        right             = subkey

        # For FeverDetails and TransformerDetails
        if subhash.is_a?(Atlas::ValueObject)
          subhash = subhash.to_h
        end

        while subkey.include?('.')
          left, right = subkey.split('.', 2)
          left = left.to_sym

          unless subhash[left].is_a?(Hash)
            subhash[left] = {}
          end

          subkey = right
          subhash = subhash[left]
        end

        subhash[subkey.to_sym] = key_val[:value]
      else
        node.public_send("#{attribute}=", key_val[:value])
      end
    end

    node.save(false)
  end # :node
end
