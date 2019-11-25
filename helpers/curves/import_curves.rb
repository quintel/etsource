class ImportCurves
  require_relative 'copy_exceptions.rb'
  require_relative 'copy_and_symlink.rb'
  require_relative 'solar.rb'
  require_relative 'weather.rb'

  def initialize(country, year)
    # If ETSource country is nl (either nl2012, nl2013, nl or nl2016),
    # one should look for nl in ETDataset folder
    @country = country
    @etdataset_country = country.start_with?('nl') ? 'nl' : country
    @dest = Pathname.new("datasets/#{ country }/curves")
    @year = year
  end

  # Copy or symlink all curves from etdataset
  # You can mark curves you do not initially wish to import
  # in copy_exceptions.rb
  def import_curves
    FileUtils.mkdir_p(@dest) unless @dest.exist?
    remove_stale
    copy_and_symlink
  end

  # Add methods that handle the curve csv files, you wish to
  # handle differently
  def import_curve_exceptions
    add_weather_profiles
  end

  # Copies the source CSV file to the given +to+ path, converting Windows CRLF
  # line endings to Unix LF.
  def cp_csv(from, to)
    if to.directory? || ! to.to_s.match(/\.(csv|ad)$/)
      to = to.join(from.basename)
    end
    File.write(to, File.read(from).gsub(/\r\n/, "\n"))
  end

  # Add stale folders that are no longer used for removal
  def remove_stale
    FileUtils.rm_rf(Pathname.new("datasets/#{ @country }/load_profiles/"),
                                 :secure=>true)
  end
end
