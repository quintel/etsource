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
      curves = YAML.load_file('curves.yml')
    end

    # Gets the full list of the NL profiles, and then removes the full path, leaving
    # only the file names (e.g. [one.csv, two.csv, three.csv, ...])
    missing_curves = Pathname.glob('datasets/nl/curves/*.csv').map(&:basename)

    # solar_pv_profile_1 and ..._2 are derived from solar_pv so should be removed
    # from the missing_curves array
    ['solar_pv_profile_1.csv', 'solar_pv_profile_2.csv'].each do |csv|
      if missing_curves.include? csv
        missing_curves.delete(csv)
      end
    end

    curves.each do |country, year|
      dest = Pathname.new("datasets/#{ country }/curves")
      supply_and_demand_csvs = Pathname.glob("#{ETDATASET_PATH}/curves/**/#{ country }/#{ year }/output/*.csv")
      other_csvs = Pathname.glob("#{ETDATASET_PATH}/curves/*.csv")
      csvs = supply_and_demand_csvs + other_csvs

      puts "Importing #{ country }/#{ year } curves:"

      count = csvs.select.with_index do |csv, index|
        # Remove the old files, some of which may no longer exist in ETDataset.
        Pathname.glob(dest.join("/*.csv")).each(&FileUtils.method(:rm))

        csv_base = csv.basename('.csv').to_s

        if csv_base.start_with?('solar_pv')
          cp_csv(csv, dest)
          # Copy solar_pv to solar_pv_profile_1
          cp_csv(csv, Pathname.new("datasets/#{ country }/curves/solar_pv_profile_1.csv"))
        elsif !csv_base.start_with?('insulation')
          # Copy the new files
          cp_csv(csv, dest)
        end

        # If nl, copy es2012 solar pv profile
        if country == 'nl'
          cp_csv(Pathname.new("#{ETDATASET_PATH}/curves/supply/solar/data/es/2015/output/solar_pv.csv"), Pathname.new("datasets/#{ country }/curves/solar_pv_profile_2.csv"))
        end

        # Remove the name of this file from missing_curves.
        missing_curves.delete(csv.basename)
      end

      missing_curves.each do |curve_name|
        puts "Missing curve: #{ curve_name }"

        # Create a path to a profile in a different year (it may not exist).
        other_year = year.to_i + 2
        other_year_path = Pathname.new("#{ETDATASET_PATH}/curves/supply/solar/data/#{ country }/#{ other_year.to_s }/output/#{ curve_name }")
        # puts "Checking #{ other_year_path }"

        if other_year_path.exist?
          # If the other year profile exists, copy it.
          cp_csv(other_year_path, dest)
          puts "Copying #{ other_year } #{ curve_name } for #{ country }"
        else
          # Symlink the NL 2015 profile.
          FileUtils.ln_sf(Dir.glob("datasets/nl/curves/#{ curve_name }"), Pathname.new("datasets/#{ country }/curves/"))
        end
      end

      if country == 'nl'
        # Copy 1987 heat curves from ETDataset
        dest = Pathname.new("datasets/#{ country }/curves/heat/1987")
        heat_1987_csvs = Pathname.glob("#{ETDATASET_PATH}/curves/demand/households/space_heating/data/#{ country }/1987/output/*.csv")
        heat_1987_csvs.each do |csv|
          cp_csv(csv, dest)
        end

        # Copy default heat curves from ETDataset
        dest = Pathname.new("datasets/#{ country }/curves/heat/default")
        heat_default_csvs = Pathname.glob("#{ETDATASET_PATH}/curves/demand/households/space_heating/data/#{ country }/#{ year }/output/*.csv")
        heat_default_csvs.each do |csv|
          cp_csv(csv, dest)
        end

      else
        # symlink to NL2015 heat curves
        FileUtils.ln_sf(Dir.glob("datasets/nl/curves/heat/1987/*.csv"), Pathname.new("datasets/#{ country }/curves/heat/1987/"))
        FileUtils.ln_sf(Dir.glob("datasets/nl/curves/heat/default/*.csv"), Pathname.new("datasets/#{ country }/curves/heat/default/"))
      end

      puts "  - Imported #{ count.length } CSVs"

      encrypt_balance(dest)
    end
  end # each curve
end # :curves

desc <<-DESC
  Import ETDataset CSVs from #{ETDATASET_PATH}

  Defaults to importing all datasets listed in datasets.yml. Providing an optional DATASET environment
  parameter results in importing only one dataset. If an optional YEAR environment parameter is provided,
  imports the dataset for that country and year; if no YEAR is provided, import the year that is listed in
  datasets.yml for that country.

  DATASET=nl YEAR=2015 rake import
DESC
task :import => ['import:curves']
