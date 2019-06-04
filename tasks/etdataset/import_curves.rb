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

    curves.each do |country, year|
      # If ETSource country is nl2016, one should look for nl in ETDataset folders
      if country == 'nl2016'
        etdataset_country = 'nl'
      else
        etdataset_country = country
      end

      # missing_curves is now a hash (dictionary) in the form:
      # { "curve_name" => "datasets/nl/curves/.../curve_name.csv" }
      missing_curves =
        Pathname.glob("#{ETDATASET_PATH}/curves/**/nl/2015/output/*.csv")
          .each_with_object({}) { |path, data| data[path.basename] = path }

      # Remove all insulation curves from the set of missing curves, since
      # these are copied later on
      missing_curves.each do |curve_name, curve_path|
        if curve_name.basename.to_s.start_with?('insulation')
          missing_curves.delete(curve_name.basename)
        end
      end

      dest = Pathname.new("datasets/#{ country }/curves")
      csvs = Pathname.glob("#{ETDATASET_PATH}/curves/**/#{ etdataset_country }/#{ year }/output/*.csv")

      puts "Importing #{ country }/#{ year } curves:"

      count = csvs.select.with_index do |csv, index|
        # Remove the old files, some of which may no longer exist in ETDataset.
        Pathname.glob(dest.join("/*.csv")).each(&FileUtils.method(:rm))

        csv_base = csv.basename('.csv').to_s

        if csv_base.start_with?('solar_pv')
          # Copy the solar_pv curve
          cp_csv(csv, dest)
          # and duplicate solar_pv to solar_pv_profile_1
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

      missing_curves.each do |curve_name, curve_path|
        puts "   - Missing curve: #{ curve_name }"

        # Create a path to a profile in a different year (it may not exist).
        other_year_path = [1, -1, 2, -2]
          .map { |other_year| curve_path.join("../../../../#{ etdataset_country }/#{ (year.to_i + other_year).to_s }/output/#{ curve_name }") }
          .detect(&:exist?)


        if other_year_path
          puts "   - Copying from #{ other_year_path }"

          # If the other year profile exists, copy it.
          cp_csv(other_year_path, dest)
        else
          puts "   - Symlinking to NL"

          # Symlink the NL 2015 profile.
          FileUtils.ln_sf(Pathname.new("../../nl/curves/#{ curve_name }"), Pathname.new("datasets/#{ country }/curves/"))
        end
      end

      if etdataset_country == 'nl'
        # Copy 1987 heat curves from ETDataset
        dest = Pathname.new("datasets/#{ country }/curves/heat/1987")
        heat_1987_csvs = Pathname.glob("#{ETDATASET_PATH}/curves/demand/households/space_heating/data/#{ etdataset_country }/1987/output/*.csv")
        heat_1987_csvs.each do |csv|
          cp_csv(csv, dest)
        end

        # Copy default heat curves from ETDataset
        dest = Pathname.new("datasets/#{ country }/curves/heat/default")
        heat_default_csvs = Pathname.glob("#{ETDATASET_PATH}/curves/demand/households/space_heating/data/#{ etdataset_country }/#{ year }/output/*.csv")
        heat_default_csvs.each do |csv|
          cp_csv(csv, dest)
        end

      else
        # symlink to NL2015 1987 heat curves
        Pathname.glob("datasets/nl/curves/heat/1987/*.csv").each do |csv|
          FileUtils.ln_sf(
            Pathname.new("../../../../nl/curves/heat/1987/#{ csv.basename }"),
            Pathname.new("datasets/#{ country }/curves/heat/1987/")
          )
        end

        # symlink to NL2015 default heat curves
        Pathname.glob("datasets/nl/curves/heat/default/*.csv").each do |csv|
          FileUtils.ln_sf(
            Pathname.new("../../../../nl/curves/heat/default/#{ csv.basename }"),
            Pathname.new("datasets/#{ country }/curves/heat/default/")
          )
        end
      end

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
