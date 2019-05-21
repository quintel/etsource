namespace :import do
  # See documentation for "task :import".
  task curves: :environment do
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
        # if a YEAR is specified, import the curve for that year
        curves = { ENV['DATASET'] => ENV['YEAR'] }
      else
        # if no YEAR is specified, import the curve for the year listed in datasets.yml
        curves = { ENV['DATASET'] => YAML.load_file('datasets.yml')["#{ ENV['DATASET'] }"] }
      end
    else
      curves = YAML.load_file('datasets.yml')
    end

    curves.each do |country, year|
      dest = Pathname.new("datasets/#{ country }/curves")
      supply_csvs = Pathname.glob("#{ETDATASET_PATH}/curves/supply/*/*/#{ country }/#{ year }/output/*.csv")
      demand_csvs = Pathname.glob("#{ETDATASET_PATH}/curves/demand/*/*/*/#{ country }/#{ year }/output/*.csv")
      csvs = supply_csvs + demand_csvs

      puts "Importing #{ country }/#{ year } curves:"

      # Remove the old files, some of which may no longer exist in ETDataset.
      Pathname.glob(dest.join("/*.csv")).each(&FileUtils.method(:rm))

      count = csvs.select.with_index do |csv|
        cp_csv(csv, dest)
      end # each csv

      puts "  - Imported #{ count.length } CSVs"

      encrypt_balance(dest)
    end # each dataset
  end # :dataset
end

desc <<-DESC
  Import ETDataset CSVs from #{ETDATASET_PATH}

  Defaults to importing all datasets listed in datasets.yml. Providing an optional DATASET environment
  parameter results in importing only one dataset. If an optional YEAR environment parameter is provided,
  imports the dataset for that country and year; if no YEAR is provided, import the year that is listed in
  datasets.yml for that country.

  DATASET=nl YEAR=2015 rake import
DESC
task :import => ['import:curves']
