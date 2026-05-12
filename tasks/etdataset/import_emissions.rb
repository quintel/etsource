namespace :import do
  # Import emissions.csv files from ETDataset to ETSource datasets.
  #
  # See task description at the bottom of this file for usage examples.
  task emissions: :environment do
    # Copies the source CSV file to the given +to+ path, converting Windows CRLF
    # line endings to Unix LF.
    def cp_csv(from, to)
      if to.directory? || ! to.to_s.match(/\.(csv|ad)$/)
        to = to.join(from.basename)
      end

      File.write(to, File.read(from).gsub(/\r\n/, "\n"))
    end

    # Determine which datasets to import
    if ENV['DATASET']
      if ENV['YEAR']
        # If a YEAR is specified, import the dataset for that year
        datasets = { ENV['DATASET'] => ENV['YEAR'] }
      else
        # If no YEAR is specified, import the dataset for the year listed in datasets.yml
        datasets = { ENV['DATASET'] => YAML.load_file('datasets.yml')[ENV['DATASET']] }
      end
    else
      # Import all available emissions.csv files from etdataset
      datasets = {}
      etdataset_data_path = Pathname.new("#{ETDATASET_PATH}/data")

      if etdataset_data_path.exist?
        # Find all emissions.csv files in the pattern: data/{country}/{year}/15_emissions/emissions.csv
        Pathname.glob("#{etdataset_data_path}/**/15_emissions/emissions.csv").each do |emissions_file|
          # Extract country and year from path
          # Path format: .../data/{country}/{year}/15_emissions/emissions.csv
          parts = emissions_file.relative_path_from(etdataset_data_path).to_s.split('/')
          country = parts[0]
          year = parts[1]

          datasets[country] = year
        end
      else
        puts "Warning: ETDataset path not found at #{ETDATASET_PATH}"
        exit 1
      end
    end

    if datasets.empty?
      puts "No datasets found to import."
      exit 0
    end

    imported_count = 0

    datasets.each do |country, year|
      # Determine destination dataset name
      if ENV['YEAR_NAME']
        dataset_name = "#{country.downcase}#{year}"
      else
        dataset_name = country.downcase
      end

      # Source and destination paths
      source_file = Pathname.new("#{ETDATASET_PATH}/data/#{country}/#{year}/15_emissions/emissions.csv")
      dest_dir = Pathname.new("datasets/#{dataset_name}")
      dest_file = dest_dir.join('emissions.csv')

      # Check if source file exists
      unless source_file.exist?
        puts "Skipping #{country}/#{year}: emissions.csv not found at #{source_file}"
        next
      end

      # Create destination directory if it doesn't exist
      FileUtils.mkdir_p(dest_dir) unless dest_dir.exist?

      # Copy the file
      begin
        cp_csv(source_file, dest_file)
        puts "✓ Copied #{country}/#{year} emissions.csv to datasets/#{dataset_name}/"
        imported_count += 1
      rescue => e
        puts "Error copying #{country}/#{year}: #{e.message}"
      end
    end

    puts "\nImported #{imported_count} emissions.csv file#{'s' unless imported_count == 1}"
  end
end

desc <<-DESC
  Import emissions.csv files from ETDataset to ETSource datasets.

  By default, imports emissions.csv for all available datasets found in #{ETDATASET_PATH}/data.

  Optional environment parameters:
  - DATASET: Import only the specified dataset (country code)
  - YEAR: Import the dataset for that specific year
  - YEAR_NAME: If set to any value, appends the year to the dataset name (e.g., 'nl2019' instead of 'nl')

  Examples:
    rake import:emissions                                     # Import all available emissions.csv files
    rake import:emissions DATASET=nl YEAR=2019                # Import nl/2019 to datasets/nl/
    rake import:emissions DATASET=nl YEAR=2019 YEAR_NAME=1    # Import nl/2019 to datasets/nl2019/
    rake import:emissions DATASET=GB_great_britain YEAR=2019  # Import GB to datasets/gb_great_britain/
DESC
