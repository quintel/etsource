task :environment do
  require 'bundler'
  require 'dotenv/load'
  require 'pathname'

  require 'fileutils'
  require 'yaml'
  require_relative './helpers/encrypt_balance'

  Bundler.require(:development)
  Dotenv.load('.env', '.env.default')

  Atlas.data_dir = File.expand_path(File.dirname(__FILE__))
end

namespace :import do
  # See documentation for "task :import".
  task dataset: :environment do
    # Copies the source CSV file to the given +to+ path, converting Windows CRLF
    # line endings to Unix LF.
    def cp_csv(from, to)
      if to.directory? || ! to.to_s.match(/\.(csv|ad)$/)
        to = to.join(from.basename)
      end

      File.write(to, File.read(from).gsub(/\r\n/, "\n"))
    end

    if ENV['DATASET']
      if ENV['YEAR']
        # if a YEAR is specified, import the dataset for that year
        datasets = { ENV['DATASET'] => ENV['YEAR'] }
      else
        # if no YEAR is specified, import the dataset for the year listed in datasets.yml
        datasets = { ENV['DATASET'] => YAML.load_file('datasets.yml')["#{ ENV['DATASET'] }"] }
      end
    else
      datasets = YAML.load_file('datasets.yml')
    end

    datasets.each do |country, year|
      dest = Pathname.new("datasets/#{ country }")
      csvs = Pathname.glob("#{ ENV['ETDATASET_PATH'] }/data/#{ country }/#{ year }/*/output/*.csv")

      puts "Importing #{ country }/#{ year } dataset:"

      %w( demands efficiencies shares time_curves ).each do |dir|
        # Remove the old files, some of which may no longer exist in ETDataset.
        Pathname.glob(dest.join("#{ dir }/*.csv")).each(&FileUtils.method(:rm))

        # Just in case the user deleted them...
        FileUtils.mkdir_p(dest.join(dir))
      end

      count = csvs.select.with_index do |csv, index|
        case csv.basename('.csv').to_s
        when /efficiency$/
          cp_csv(csv, dest.join('efficiencies'))
        when /(?:parent|child)_share$/
          cp_csv(csv, dest.join('shares'))
        when /time_curve$/
          cp_csv(csv, dest.join('time_curves'))
        when /^metal_demands/
          cp_csv(csv, dest.join('demands/metal_demands.csv'))
        when /^primary_production/
          cp_csv(csv, dest.join('primary_production.csv'))
        when /^corrected_energy_balance_step_2/
          cp_csv(csv, dest.join('energy_balance.csv'))
        when /^central_electricity_production_step_2/
          cp_csv(csv, dest.join('central_producers.csv'))
        when /^#{ Regexp.escape(country.downcase) }$/
          if csv.to_s.include?('11_area/output')
            cp_csv(csv, dest.join("#{ country.downcase }.full.ad"))
          end
        end
      end # each csv

      puts "  - Imported #{ count.length } CSVs"

      encrypt_balance(dest)
    end # each dataset
  end # :dataset

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
    xlsx      = Roo::Spreadsheet.open("#{ ENV['ETDATASET_PATH'] }/nodes_source_analyses/#{node_path}.xlsx")

    xlsx.sheet('Dashboard').each(attribute: 'Attribute', value: 'Value') do |key_val|
      next unless key_val[:value].is_a?(Numeric)

      if key_val[:attribute] =~ /\./
        attribute, subkey = key_val[:attribute].split('.', 2)
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
        node.public_send("#{key_val[:attribute]}=", key_val[:value])
      end
    end

    node.save(false)
  end # :node

  desc <<-DESC
    Import data from an ETDataset carrier analysis file.

    Provide the task with a CARRIER variable specifying the key of the carrier to be
    updated.

    For example:

      rake import:carrier CARRIER=bio_oil

  DESC
  task carrier: :environment do
    carrier = Atlas::Carrier.find(ENV['CARRIER'])
    xlsx    = Roo::Spreadsheet.open("#{ ENV['ETDATASET_PATH'] }/carriers_source_analyses/#{ENV['CARRIER']}.carrier.xlsx")

    unless carrier
      raise ArgumentError, "carrier #{ENV['CARRIER']} does not exist!"
    end

    carrier.attributes = xlsx.sheet('Dashboard')
      .each(attribute: 'Attribute', value: 'Value')
      .each_with_object({}) do |row, result|
        next unless row[:value].is_a?(Numeric)

        result[row[:attribute]] = row[:value]
      end

    carrier.save
  end # :carrier

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

    xlsx        = Roo::Spreadsheet.open("#{ ENV['ETDATASET_PATH'] }/carriers_source_analyses/#{carrier}.carrier.xlsx")
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
end # :import

desc <<-DESC
  Import ETDataset CSVs from #{ ENV['ETDATASET_PATH'] }

  Defaults to importing all datasets listed in datasets.yml. Providing an optional DATASET environment
  parameter results in importing only one dataset. If an optional YEAR environment parameter is provided,
  imports the dataset for that country and year; if no YEAR is provided, import the year that is listed in
  datasets.yml for that country.

  DATASET=de YEAR=2011 rake import
DESC
task :import => ['import:dataset']

desc <<-DESC
  Open a pry or irb session preloaded with Atlas

  This is an alias for the :console task in Atlas, and requires that ETSource,
  Atlas all have a common parent directory:

  - Code
    - atlas
    - etsource
DESC
task :console do
  directory = File.dirname(File.expand_path(__FILE__))

  cd '../atlas'
  exec "bundle exec rake 'console[#{ directory }]'"
end

desc <<-DESC
  Decrypts the energy balance for every area.
DESC
task :decrypt do
  if File.exists?('.password')
    puts "Using password that is stored in .password..."
    puts "Start Decrypting..."
    Dir.glob('datasets/*').each do |area|
      if File.exists?("#{ area }/energy_balance.gpg")
        puts "* #{ area }"
        cmd = "gpg --batch --yes --no-use-agent --passphrase-file .password" +
              " --output #{ area }/energy_balance.csv --decrypt #{ area }/energy_balance.gpg"
        puts `#{ cmd }`
      end
    end
    puts "Done!"
  else
    puts "ERROR: File .password not found in current directory!"
  end
end

desc <<-DESC
  Changes CSV files to change line-endings to LF
DESC
task :fix_line_endings do
  Dir.glob('datasets/**/*.csv').each do |filename|
    if (content = File.read(filename)).match(/\r[^\n]/)
      File.write(filename, content.split(/\r/).join("\n"))
    end
  end
end

desc <<-DESC
  Scale a dataset to number_of_residences

  Mandatory arguments:

  - FULL_DATASET         = a full dataset
  - NUMBER_OF_RESIDENCES = number of residences
  - DERIVED_DATASET      = new derived dataset name

DESC

task scale: :environment do
  raise ArgumentError, 'missing FULL_DATASET argument'         unless ENV['FULL_DATASET']
  raise ArgumentError, 'missing DERIVED_DATASET argument'      unless ENV['DERIVED_DATASET']
  raise ArgumentError, 'missing NUMBER_OF_RESIDENCES argument' unless ENV['NUMBER_OF_RESIDENCES']

  Atlas::Scaler.new(
    ENV['FULL_DATASET'], ENV['DERIVED_DATASET'], ENV['NUMBER_OF_RESIDENCES']
  ).create_scaled_dataset
end

desc <<-DESC
  Refreshes a graph.yml of a derived dataset

  Mandatory arguments:

  - DERIVED_DATASET      = derived dataset name

DESC

task init_methods_to_input: :environment do
  unless ENV['DERIVED_DATASET']
    raise(
      ArgumentError,
      'missing DERIVED_DATASET argument; if you want to refresh all graphs, ' \
      'use: rake refresh_graph DERIVED_DATASET=*'
    )
  end

  dataset = Atlas::Dataset::Derived.find(ENV['DERIVED_DATASET'])
  input_name = :"initializer_methods_#{ dataset.key }"

  changes = YAML.load_file(dataset.dataset_dir.join('graph_values.yml'))
  input   = nil

  begin
    input = Atlas::InitializerInput.find(input_name)
  rescue
    input = Atlas::InitializerInput.new(
      key: input_name,
      ns:  'converted_initializer_methods'
    )
  end

  statements = []

  changes['demand_setter'].each do |key, value|
    statements.push("UPDATE(V(#{ key }), demand, #{ value.to_f })")
  end

  changes['preset_demand_setter'].each do |key, value|
    statements.push("UPDATE(V(#{ key }), preset_demand, #{ value.to_f })")
  end

  changes['number_of_units_setter'].each do |key, value|
    statements.push("UPDATE(V(#{ key }), number_of_units, #{ value.to_f })")
  end

  changes['share_setter'].each do |key, value|
    from, to, _ = key.to_s.split(/[-@]/)
    statements.push("UPDATE(LINK(#{ to }, #{ from }), share, #{ value.to_f })")
  end

  changes['conversion_setter'].each do |key, value|
    node_key, carrier = key.to_s.split('@').map(&:to_sym)

    statements.push("UPDATE(OUTPUT_SLOTS(V(#{ node_key }), #{ carrier }), conversion, #{ value.to_f })")
    statements.push("UPDATE(INPUT_SLOTS(V(#{ node_key }), #{ carrier }), conversion, #{ value.to_f })")
  end

  statements = statements.map { |s| "  #{ s }" }
  input.query = "EACH(\n#{ statements.join(",\n") }\n)"
  input.save!

  unless dataset.init.key?(input_name)
    dataset.init[input_name] = 1
    dataset.save!
  end
end

task refresh_graph: :environment do
  unless ENV['DERIVED_DATASET']
    raise(
      ArgumentError,
      'missing DERIVED_DATASET argument; if you want to refresh all graphs, ' \
      'use: rake refresh_graph DERIVED_DATASET=*'
    )
  end

  derived_datasets =
    if ENV['DERIVED_DATASET'] == '*'
      Atlas::Dataset::Derived.all
    else
      [Atlas::Dataset::Derived.find(ENV['DERIVED_DATASET'])]
    end

  derived_datasets.each do |derived_dataset|
    dataset = Atlas::Dataset::Full.find(derived_dataset.base_dataset)

    Atlas::GraphPersistor.call(
      dataset,
      derived_dataset.graph_path,
      export_modifier: Atlas::Scaler::GraphScaler.new(derived_dataset.scaling.factor)
    )

    puts "Succesfully refreshed the graph.yml for #{ derived_dataset.area }"
  end
end
