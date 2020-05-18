task symlink_curves: :environment do

  if ENV['DATASET'] and ENV['YEAR']
    # if a YEAR is specified, import the dataset for that year
    curves = { ENV['DATASET'] => ENV['YEAR'] }
  else
    # if YEAR nor DATASET are specified, point this out to the user.
    abort("\nNo DATASET and/or YEAR are specified. Make sure you run: \n \
           \nbundle exec rake symlink_curves DATASET=<dataset> YEAR=<year>")
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
