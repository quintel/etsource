namespace :import do
  desc <<-DESC
    Import FCE datasets

    It imports these values directly from the carrier analysis fce tab.
    The tab name needs to be "<dataset>_fce" or else this script will
    break.

    Arguments mandatory:

    - DATASET = <region>
    - CARRIER = <carrier>

    rake import:fce DATASET=nl
                    CARRIER=bio_ethanol
  DESC
  task fce: :environment do
    # Raise the obvious errors if mandatory arguments are missing
    raise ArgumentError, 'missing CARRIER argument' unless ENV['CARRIER']
    raise ArgumentError, 'missing DATASET argument' unless ENV['DATASET']

    carrier     = ENV['CARRIER']
    dataset     = ENV['DATASET']
    current_fce = Atlas::Carrier.new(key: carrier).fce(dataset)

    raise ArgumentError, "CARRIER '#{carrier}' does not exist in '#{dataset}'" unless current_fce

    xlsx        = Roo::Spreadsheet.open("#{ETDATASET_PATH}/carriers_source_analyses/#{carrier}.carrier.xlsx")
    yaml_file   = Atlas.data_dir.join("datasets/#{dataset}/fce/#{carrier}.yml")

    current_fce = xlsx.sheet("#{ dataset }_fce")
      .each(attribute: 'Attribute', value: 'Value')
      .each_with_object({}) do |row, result|
        if row[:attribute] =~ /from/
          @current_row = row[:attribute].gsub(/from\s/, '').to_sym

          result[@current_row] ||= {}
        end

        if row[:value].is_a?(Numeric)
          result[@current_row][row[:attribute].to_sym] = row[:value]
        end
      end

    File.open(yaml_file, 'w') { |f| f.write(current_fce.to_yaml) }
  end
end
