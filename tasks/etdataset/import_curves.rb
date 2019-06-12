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
      # If ETSource country is nl (either nl2012, nl2013, nl or nl2016),
      # one should look for nl in ETDataset folders
      if country.start_with? 'nl'
        etdataset_country = 'nl'
      else
        etdataset_country = country
      end

      # Missing_curves is now a hash (dictionary) in the form:
      # { "curve_name" => "datasets/nl/curves/.../curve_name.csv" }
      missing_curves =
        Pathname.glob("#{ETDATASET_PATH}/curves/**/nl/2015/output/*.csv")
          .each_with_object({}) { |path, data| data[path.basename] = path }

      # Remove all heat curves from the set of missing curves, since
      # these are copied separately at a later stage in this script
      missing_curves.each do |curve_name, curve_path|
        if (curve_name.basename.to_s.start_with?('air') || curve_name.basename.to_s.start_with?('insulation'))
          missing_curves.delete(curve_name.basename)
        end
      end

      dest = Pathname.new("datasets/#{ country }/curves")
      csvs = Pathname.glob("#{ETDATASET_PATH}/curves/**/#{ etdataset_country }/#{ year }/output/*.csv")

      puts "Importing curves for: #{ country }/#{ year }"

      csvs.select.with_index do |csv, index|
        # Remove old load_profiles directory, if it still exists
        FileUtils.rm_rf(Pathname.new("datasets/#{ country }/load_profiles/"), :secure=>true)

        # Remove the old files, some of which may no longer exist in ETDataset.
        Pathname.glob(dest.join("/*.csv")).each(&FileUtils.method(:rm))

        csv_base = csv.basename('.csv').to_s

        if (!csv_base.start_with?('air') && !csv_base.start_with?('insulation'))
          # Copy the new files
          cp_csv(csv, dest)
        end

        # If nl, copy es2012 solar pv profile as solar_pv_profile_2.csv
        if country == 'nl'
          cp_csv(Pathname.new("#{ETDATASET_PATH}/curves/supply/solar/data/es/2015/output/solar_pv.csv"), Pathname.new("datasets/#{ country }/curves/solar_pv_profile_2.csv"))
        else
          FileUtils.ln_sf(Pathname.new("../../nl/curves/solar_pv_profile_2.csv"), dest)
        end

        # Remove the name of this file from missing_curves.
        missing_curves.delete(csv.basename)
      end

      missing_curves.each do |curve_name, curve_path|
        # Create a path to a profile in a different year (it may not exist).
        other_year_path = [1, -1, 2, -2]
          .map { |other_year| curve_path.join("../../../../#{ etdataset_country }/#{ (year.to_i + other_year).to_s }/output/#{ curve_name }") }
          .detect(&:exist?)

        if other_year_path
          # If the other year curve exists, copy it.
          cp_csv(other_year_path, dest)
        else
          # Else, symlink the nl 2015 curve.
          FileUtils.ln_sf(Pathname.new("../../nl/curves/#{ curve_name }"), dest)
        end
      end

      # Duplicate solar_pv.csv to solar_pv_profile_1.csv.
      cp_csv(Pathname.new("datasets/#{ country }/curves/solar_pv.csv"), Pathname.new("datasets/#{ country }/curves/solar_pv_profile_1.csv"))

      if etdataset_country == 'nl'
        # If the directories for the heat curves do not exist yet,
        # create new empty ones
        ["curves/", "curves/1987", "curves/1997", "curves/2004", "curves/default"].each do |dir|
          if !dest.join(dir).exist?
            FileUtils.mkdir_p(dest.join(dir))
          end
        end

        # Copy heat curves from ETDataset for the extreme weather years (1987, 1997, and 2004).
        ["1987", "1997", "2004"].each do |extreme_weather_year|
          Pathname.glob("#{ETDATASET_PATH}/curves/demand/households/space_heating/data/nl/#{ extreme_weather_year }/output/*.csv").each do |csv|
            cp_csv(csv, dest.join("weather/#{ extreme_weather_year }"))
          end

        # Copy default heat curves from ETDataset.
        Pathname.glob("#{ETDATASET_PATH}/curves/demand/households/space_heating/data/nl/#{ year }/output/*.csv").each do |csv|
          cp_csv(csv, dest.join("weather/default"))
        end
      else
        # Remove old directory with heat curves and create a new symlink to the NL2015 heat curves
        FileUtils.rm_rf(dest.join("/heat/"), :secure=>true)
        FileUtils.ln_sf(Pathname.new("../../nl/curves/weather/"), dest)
      end

      encrypt_balance(dest)
    end
  end # each curve
end # :curves

desc <<-DESC
  Import ETDataset CSVs from #{ETDATASET_PATH}

  Defaults to importing all curves listed in curves.yml. Providing an optional DATASET environment
  parameter results in importing curves for only one dataset. If an optional YEAR environment parameter is provided,
  imports the curves for that country and year; if no YEAR is provided, import the year that is listed in
  curves.yml for that country.

  DATASET=nl YEAR=2015 rake import
DESC
task :import => ['import:curves']
