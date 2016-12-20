def encrypt_balance(directory)
  if File.exists?('.password')
    password = File.read('.password').strip
  else
    puts "File .password not found in root. Cannot encrypt energy balance CSV"
    exit(1)
  end

  csv  = directory.join('energy_balance.csv')
  dest = directory.join('energy_balance.gpg')

  if csv.file?
    dest = csv.dirname.join('energy_balance.gpg')
    system("gpg --batch --yes --passphrase '#{ password }' -c --output '#{ dest }' '#{ csv }'")
    puts "  - Encrypted energy balance"
  end
end

namespace :import do
  # See documentation for "task :import".
  task :dataset do
    require 'pathname'
    require 'fileutils'
    require 'yaml'

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
      csvs = Pathname.glob("../etdataset/data/#{ country }/#{ year }/*/output/*.csv")

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
            cp_csv(csv, dest.join("#{ country.downcase }.ad"))
          end
        end
      end # each csv

      puts "  - Imported #{ count.length } CSVs"

      encrypt_balance(dest)
    end # each dataset
  end # :dataset

  desc <<-DESC
    Import data from an ETDataset node analysis file.

    Provide the task with a NODE variable specifying the key of the node to be
    updated, and then one or more additional variables specifying the attributes
    to be changed.

    For example:

      rake import:node NODE=industry_burner_coal technical_lifetime=14.0

    You may specify multple attributes to update:

      rake import:node \
        NODE=energy_power_lv_network_electricity \
        free_co2_factor=0.2 \
        availability=1.0 \
        network_capacity_available_in_mw=74803.6

    Be sure to surround values in quotes if the value contains any spaces, or
    non-alphanumeric characters:

      rake import:node \
        NODE=energy_power_lv_network_electricity \
        energy_balance_group='electricity network'
  DESC
  task :node do
    require 'bundler'
    Bundler.require(:test)

    Atlas.data_dir = File.expand_path(File.dirname(__FILE__))

    node = Atlas::Node.find(ENV['NODE'])

    Atlas::Node.attribute_set.each do |attribute|
      attr_name = attribute.name.to_s

      if attribute.options[:primitive] == Hash
        subkeys = ENV.select { |key, _| key.start_with?("#{ attr_name }__") }
        subkeys.each do |key, value|
          if node.public_send(attr_name).nil?
            node.public_send("#{ attr_name }=", {})
          end

          subkey  = key.split('__', 2)[1]
          subhash = node.public_send(attr_name)
          right   = subkey

          while subkey.include?('__')
            left, right = subkey.split('__', 2)
            left = left.to_sym

            unless subhash[left].is_a?(Hash)
              subhash[left] = {}
            end

            subkey = right
            subhash = subhash[left]
          end

          subhash[subkey.to_sym] = value
        end
      elsif ENV[attribute.name.to_s]
        node.public_send(:"#{ attribute.name }=", ENV[attribute.name.to_s])
      end
    end

    node.save(false)
  end # :node

  desc <<-DESC
    Import data from an ETDataset carrier analysis file.

    Provide the task with a CARRIER variable specifying the key of the carrier to be
    updated, and then one or more additional variables specifying the attributes
    to be changed.

    For example:

      rake import:carrier CARRIER=bio_oil co2_conversion_per_mj=0

    You may specify multiple attributes to update:

      rake import:carrier \
        CARRIER=bio_oil \
        co2_conversion_per_mj=0 \
        cost_per_mj=0.013885126 \
        typical_production_per_km2=15506658

    Be sure to surround values in quotes if the value contains any spaces, or
    non-alphanumeric characters:

      rake import:carrier \
        CARRIER=bio_oil \
        sustainable='1'
  DESC
  task :carrier do
    require 'bundler'
    Bundler.require(:test)

    Atlas.data_dir = File.expand_path(File.dirname(__FILE__))

    carrier = Atlas::Carrier.find(ENV['CARRIER'])

    Atlas::Carrier.attribute_set.each do |attribute|
      attr_name = attribute.name.to_s

      if attribute.options[:primitive] == Hash
        subkeys = ENV.select { |key, _| key.start_with?("#{ attr_name }__") }

        subkeys.each do |key, value|
          if carrier.public_send(attr_name).nil?
            carrier.public_send("#{ attr_name }=", {})
          end

          carrier.public_send(attr_name)[key.split('__', 2)[1].to_sym] = value
        end
      elsif ENV[attribute.name.to_s]
        carrier.public_send(:"#{ attribute.name }=", ENV[attribute.name.to_s])
      end
    end

    carrier.save
  end # :carrier

  desc <<-DESC
    Import FCE datasets

    Arguments mandatory:

    - DATASET = <region>
    - CARRIER = <carrier>
    - ORIGIN  = <origin>

    Optional arguments:

    - <attributes> that are available for the ORIGIN of the CARRIER in that
      DATASET.

    Example:

    rake import:fce DATASET=nl
                    CARRIER=bio_ethanol
                    ORIGIN=sugar_beets
                    co2_exploration_per_mj=5.0

    You may specify multiple attributes to update:

    rake import:fce DATASET=nl
                    CARRIER=bio_ethanol
                    ORIGIN=sugar_beets
                    co2_exploration_per_mj=5.0
                    co2_extraction_per_mj=5.0
  DESC
  task :fce do
    require 'bundler'
    Bundler.require(:test)

    # Raise the obvious errors if mandatory arguments are missing
    raise ArgumentError, 'missing CARRIER argument' unless ENV['CARRIER']
    raise ArgumentError, 'missing DATASET argument' unless ENV['DATASET']
    raise ArgumentError, 'missing ORIGIN argument' unless ENV['ORIGIN']

    Atlas.data_dir = File.expand_path(File.dirname(__FILE__))

    carrier     = ENV['CARRIER']
    dataset     = ENV['DATASET']
    origin      = ENV['ORIGIN'].to_sym
    attributes  = ENV.select{ |key, _| key =~ /^[a-z]/ }.symbolize_keys
    current_fce = Atlas::Carrier.new(key: carrier).fce(dataset)
    yaml_file   = Atlas.data_dir.join("datasets/#{ dataset }/fce/#{ carrier }.yml")

    raise ArgumentError, "CARRIER '#{carrier}' does not exist in '#{dataset}'" unless current_fce
    raise ArgumentError, "ORIGIN '#{origin}' does not exist in '#{carrier}'"   unless current_fce[origin]

    attributes.each do |key, value|
      if current_fce[origin][key]
        current_fce[origin][key] = value.to_f
      else
        raise ArgumentError, "variable '#{ key }' does not exist in ORIGIN '#{ origin }'"
      end
    end

    File.open(yaml_file, 'w'){|f| f.write(current_fce.to_yaml) }
  end
end # :import

desc <<-DESC
  Import ETDataset CSVs from ../etdataset

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
  Scale a dataset to amount_of_residences

  Arguments:

  - DATASET = dataset
  - NUMBER_OF_RESIDENCES = number of residences
  - LOCAL_DATASET = new local dataset name

DESC

task :scale do
  require 'bundler'
  Bundler.require(:development)

  Atlas.data_dir = File.expand_path(File.dirname(__FILE__))

  Atlas::Scaler.new(
    ENV['FULL_DATASET'], ENV['DERIVED_DATASET'], ENV['NUMBER_OF_RESIDENCES']
  ).create_scaled_dataset
end
