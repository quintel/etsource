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
    if year == "2015"
      base_dataset = "nl"
    else
      base_dataset = "nl#{year}"
    end

    dest = Pathname.new("datasets/#{ area }/curves/")
    source = Pathname.new("../../#{base_dataset}/curves/")
    source_heat = Pathname.new("../../../../#{base_dataset}/curves/heat/")

    puts "Symlinking curves for: #{ area }/#{ year }"

    # Remove old directory that is symlinked to the NL2015 curves
    # in order to prevent circular symlinks
    FileUtils.rm_rf(Pathname.new("datasets/#{ area }/curves/"), :secure=>true)
    FileUtils.rm_rf(Pathname.new("datasets/#{ area }/load_profiles/"), :secure=>true)

    # Create new empty directories
    FileUtils.mkdir_p(dest)
    FileUtils.mkdir_p(dest.join("heat/"))
    FileUtils.mkdir_p(dest.join("heat/1987"))
    FileUtils.mkdir_p(dest.join("heat/default"))

    # Symlink all curves in the root directory
    Pathname.glob("datasets/#{base_dataset}/curves/*.csv").each do |csv|
      # Symlink to base country curve
      FileUtils.ln_sf(Pathname.new(source.join(csv.basename)), Pathname.new(dest))
    end

    # Symlink all curves in the heat/1987 directory
    Pathname.glob("datasets/#{base_dataset}/curves/heat/1987/*.csv").each do |csv|
      # Symlink to base country curve
      FileUtils.ln_sf(Pathname.new(source_heat.join("1987/#{csv.basename}")), Pathname.new(dest.join("heat/1987")))
    end

    # Symlink all curves in the heat/default directory
    Pathname.glob("datasets/#{base_dataset}/curves/heat/default/*.csv").each do |csv|
      # Symlink to base country curve
      FileUtils.ln_sf(Pathname.new(source_heat.join("default/#{csv.basename}")), Pathname.new(dest.join("heat/default")))
    end

    encrypt_balance(dest)
  end # each curve

end # task
