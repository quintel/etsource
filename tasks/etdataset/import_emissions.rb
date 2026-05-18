namespace :import do
  # Import emissions.csv files from ETDataset to ETSource datasets.

  desc <<-DESC
    Import emissions.csv files from ETDataset to ETSource datasets.

    Auto-discovers all emissions.csv files in ETDataset and imports them to matching datasets in ETSource.
    Uses datasets.yml for naming resolution (base years, multi-year datasets, special cases).

    Optional ENV parameters:
      DATASET   - Import only this dataset (country code)
      YEAR      - Use this year (otherwise looks up in datasets.yml)
      YEAR_NAME - If set, appends year to dataset name (e.g., 'nl2019' not 'nl')

    Examples:
      rake import:emissions                              # Auto-discover and import all
      rake import:emissions DATASET=nl YEAR=2019         # Import nl/2019 → datasets/nl/
      rake import:emissions DATASET=nl YEAR=2019 YEAR_NAME=1  # Import nl/2019 → datasets/nl2019/
  DESC
  task emissions: :environment do
    def cp_csv(from, to)
      to = to.join(from.basename) if to.directory? || !to.to_s.match(/\.(csv|ad)$/)
      File.write(to, File.read(from).gsub(/\r\n/, "\n"))
    end

    def find_all_emissions_files(etdataset_path)
      data_path = Pathname.new("#{etdataset_path}/data")
      unless data_path.exist?
        puts "Warning: ETDataset path not found at #{etdataset_path}"
        exit 1
      end

      Pathname.glob("#{data_path}/**/15_emissions/emissions.csv").map do |file|
        parts = file.relative_path_from(data_path).to_s.split('/')
        { country: parts[0], year: parts[1], path: file }
      end
    end

    def build_yml_lookup
      lookup = Hash.new { |h, k| h[k] = {} }
      YAML.load_file('datasets.yml').each do |dataset_name, year|
        country = dataset_name.sub(/\d{4}$/, '')
        lookup[country][year.to_i] = dataset_name
      end
      lookup
    end

    def dataset_exists?(name)
      Pathname.new("datasets/#{name}").directory?
    end

    def determine_dataset_name(country, year, yml_lookup)
      year_int = year.to_i
      return yml_lookup[country][year_int] if yml_lookup[country]&.[](year_int)
      return country if dataset_exists?(country)

      candidate = "#{country.downcase}#{year}"
      return candidate if dataset_exists?(candidate)

      nil
    end

    # Step 1: Determine what to import (manual or auto-discover)
    emissions_to_import = if ENV['DATASET']
      country = ENV['DATASET']
      year = ENV['YEAR'] || YAML.load_file('datasets.yml')[country]

      unless year
        puts "Error: No year found for #{country} in datasets.yml. Specify YEAR=xxxx"
        exit 1
      end

      dataset_name = ENV['YEAR_NAME'] ? "#{country.downcase}#{year}" : country.downcase
      [{ country: country, year: year.to_s, dataset_name: dataset_name }]
    else
      all_emissions = find_all_emissions_files(ETDATASET_PATH)
      yml_lookup = build_yml_lookup

      all_emissions.filter_map do |emission|
        dataset_name = determine_dataset_name(emission[:country], emission[:year], yml_lookup)
        if dataset_name
          emission.merge(dataset_name: dataset_name)
        else
          puts "Skipping #{emission[:country]}/#{emission[:year]} - no matching dataset"
          nil
        end
      end
    end

    if emissions_to_import.empty?
      puts "No emissions.csv files to import."
      exit 0
    end

    # Step 2: Import files
    imported_count = 0

    emissions_to_import.each do |emission|
      source = Pathname.new("#{ETDATASET_PATH}/data/#{emission[:country]}/#{emission[:year]}/15_emissions/emissions.csv")
      dest_dir = Pathname.new("datasets/#{emission[:dataset_name]}")

      unless source.exist?
        puts "Skipping #{emission[:dataset_name]}: source not found"
        next
      end

      unless dest_dir.exist?
        puts "Skipping #{emission[:dataset_name]}: destination doesn't exist"
        next
      end

      begin
        cp_csv(source, dest_dir.join('emissions.csv'))
        puts "✓ Imported #{emission[:country]}/#{emission[:year]} → datasets/#{emission[:dataset_name]}/emissions.csv"
        imported_count += 1
      rescue => e
        puts "Error: #{emission[:dataset_name]} - #{e.message}"
      end
    end

    puts "\nImported #{imported_count} emissions.csv file#{'s' unless imported_count == 1}"
  end
end
