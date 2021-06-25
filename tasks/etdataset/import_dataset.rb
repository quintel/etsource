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
      if ENV['YEAR_NAME']
        dataset_name = "#{ country.downcase }#{ year }"
      else
        dataset_name = "#{ country.downcase }"
      end
      dest = Pathname.new("datasets/#{ dataset_name }")
      csvs_energy = Pathname.glob("#{ETDATASET_PATH}/data/#{ country }/#{ year }/*/output/*.csv")
      csvs_molecules = Pathname.glob("#{ETDATASET_PATH}/data/#{ country }/#{ year }/*/output/molecules/*.csv")

      puts "Importing #{ country }/#{ year } dataset:"

      %w[demands efficiencies shares shares/energy shares/molecules].each do |dir|
        # Remove the old files, some of which may no longer exist in ETDataset.
        Pathname.glob(dest.join("#{ dir }/*.csv")).each(&FileUtils.method(:rm))

        # Just in case the user deleted them...
        FileUtils.mkdir_p(dest.join(dir))
      end

      count = csvs_energy.select.with_index do |csv, index|
        case csv.basename('.csv').to_s
        when /efficiency$/
          cp_csv(csv, dest.join('efficiencies'))
        when /(?:parent|child)_share$/
          cp_csv(csv, dest.join('shares/energy'))
        when /^bicycles_demand/
          cp_csv(csv, dest.join('demands/bicycles_demand.csv'))
        when /^metal_demands/
          cp_csv(csv, dest.join('demands/metal_demands.csv'))
        when /^fertilizers_ccus_demands/
          cp_csv(csv, dest.join('demands/fertilizers_ccus_demands.csv'))
        when /^primary_production/
          cp_csv(csv, dest.join('primary_production.csv'))
        when /^corrected_energy_balance_step_2.open_access/
          cp_csv(csv, dest.join('energy_balance.open_access.csv'))
        when /^corrected_energy_balance_step_2/
          cp_csv(csv, dest.join('energy_balance.csv'))
          encrypt_balance(dest)
        when /^central_producers.csv/
          cp_csv(csv, dest.join('central_producers.csv'))
        when /^#{ Regexp.escape(dataset_name) }$/
          if csv.to_s.include?('11_area/output')
            cp_csv(csv, dest.join("#{ dataset_name }.full.ad"))
          end
        end
      end # each csv

      puts "  - Imported #{ count.length } energy CSVs"

      count = csvs_molecules.select.with_index do |csv, index|
        case csv.basename('.csv').to_s
        when /(?:parent|child)_share$/
          cp_csv(csv, dest.join('shares/molecules'))
        end
      end # each csv

      puts "  - Imported #{ count.length } molecules CSVs"

    end # each dataset
  end # :dataset
end

desc <<-DESC
  Import ETDataset CSVs from #{ETDATASET_PATH}

  Defaults to importing all datasets listed in datasets.yml. Providing an optional DATASET environment
  parameter results in importing only one dataset. If an optional YEAR environment parameter is provided,
  imports the dataset for that country and year; if no YEAR is provided, import the year that is listed in
  datasets.yml for that country.

  DATASET=de YEAR=2011 rake import
  Use YEAR_NAME=true to import dataset with name 'de2011' instead of 'de'
DESC
task :import => ['import:dataset']
