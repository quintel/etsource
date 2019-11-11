task symlink_curves: :environment do

  if ENV['DATASET']
    if ENV['YEAR']
      # if a YEAR is specified, import the dataset for that year
      curves = { ENV['DATASET'] => ENV['YEAR'] }
    else
      # if no YEAR is specified, import the dataset for the year listed in datasets.yml
      curves = { ENV['DATASET'] => YAML.load_file('local_curves.yml')["#{ ENV['DATASET'] }"] }
    end
  else
    curves = YAML.load_file('local_curves.yml')
  end

  curves.each do |area, year|
    # Check to which base dataset the dataset should symlink
    # Note: the script only symlinks to NL datasets
    if year == "2015"
      base_dataset = "nl"
    else
      base_dataset = "nl#{year}"
    end

    dest = Pathname.new("datasets/#{ area }/")
    source = Pathname.new("../#{base_dataset}/curves/")
    source_heat = Pathname.new("../../../#{base_dataset}/curves/weather/")

    puts "Symlinking curves for: #{ area }/#{ year }"

    # Remove old directory that is symlinked to the NL2015 curves
    # in order to prevent circular symlinks
    FileUtils.rm_rf(Pathname.new("datasets/#{ area }/curves/"), :secure=>true)
    FileUtils.rm_rf(Pathname.new("datasets/#{ area }/load_profiles/"), :secure=>true)

    # Symlink all curves in the root directory
    FileUtils.ln_sf(source, dest)

    encrypt_balance(dest)
  end # each curve

end # task
