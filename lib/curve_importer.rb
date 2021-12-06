class CurveImporter
  require_relative "source"
  require_relative "destination"
  require_relative "symlinker"
  require_relative "solar"
  include Solar

  WEATHER_YEAR_SPECIAL_YEARS = [1987, 1997, 2004]
  DEFAULT_AREA = "nl"
  SKIP_STARTS = %w(flh)

  def initialize(country, year)
    # If ETSource country is nl (either nl2012, nl2013, nl or nl2016),
    # one should look for nl in ETDataset folder
    @country = country
    @etdataset_country = country.start_with?('nl') ? 'nl' : country
    @dest = Pathname.new("datasets/#{ @country }/curves")
    @year = year
  end

  def import_curves
    prepare
    import_from_data_folders
    import_weather_years if include_weather?
    extend_solar_profiles(@dest, @country)
    # unless @country == DEFAULT_AREA
    #   symlinker = Symlinker.new(DEFAULT_AREA, @country, @year, include_weather?)
    #   symlinker.symlink_curves
    # end
  end

  def prepare
    FileUtils.rm_rf(@dest, :secure=>true)
    remove_stale
  end

  def import_from_data_folders(year=@year)
    base_paths = "#{ETDATASET_PATH}/curves/**/data/"
    Pathname.glob(base_paths).each do | base_path |
      source = Source.new(base_path, @etdataset_country, year)
      copy_from_source(source) if source.etdata_path
    end
  end

  def import_weather_years
    WEATHER_YEAR_SPECIAL_YEARS.each{ | year | import_from_data_folders(year) }
  end

  def copy_from_source(source)
    source.files.each do | file |
      next if skip?(file.basename.to_s)
      destination = Destination.new(file.basename.to_s, @country, source.year)
      cp_csv(destination.destination_path, file)
    end
  end

  # Copies the source CSV file to the given +to+ path, converting Windows CRLF
  # line endings to Unix LF.
  def cp_csv(to, from)
    if to.directory? || ! to.to_s.match(/\.(csv|ad)$/)
      to = to.join(from.basename)
    end
    to.parent.mkpath unless to.parent.directory?
    File.write(to, File.read(from).gsub(/\r\n/, "\n"))
  end

  def remove_stale
    FileUtils.rm_rf(Pathname.new("datasets/#{ @country }/load_profiles/"),
                                 :secure=>true)
  end

  def skip?(filename)
    return true unless filename.end_with?('csv')

    SKIP_STARTS.each do |name_start|
      return true if filename.start_with?(name_start)
    end

    false
  end

  def include_weather?
    @etdataset_country == 'nl'
  end
end
