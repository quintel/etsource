class Symlinker

  WEATHER_YEAR_SPECIAL_YEARS = [1987, 1997, 2004]

  # Symlinker links all nonexistent files for an etsource country
  # to the files from a source_area

  def initialize(source_area, country, year, symlink_weather = true)
    @country, @year, @symlink_weather = country, year, symlink_weather
    @source_path = "datasets/#{ source_area }"
    validate!
  end

  def symlink_curves
    Pathname.glob(@source_path + "/curves/**/*.csv").each do |csv|
      next if skip?(csv)
      d = Destination.new(csv.basename.to_s, @country, folder_year(csv))
      unless d.destination_path.join(csv.basename).exist?
        create_folder_and_symlink(csv.expand_path, d.destination_path.join(csv.basename))
      end
    end
  end

  def create_folder_and_symlink(from, to)
    to.parent.mkpath unless to.parent.directory?
    FileUtils.ln_sf(from, to)
  end

  def folder_year(csv)
    is_in_year_directory?(csv) ? parent_to_i(csv) : @year
  end

  def is_in_year_directory?(csv)
    WEATHER_YEAR_SPECIAL_YEARS.include?(parent_to_i(csv))
  end

  def parent_to_i(csv)
    csv.parent.basename.to_s.to_i
  end

  private
  def validate!
    unless Pathname.new(@source_path).expand_path.directory?
      raise ArgumentError.new("Symlinker source path does not exist")
    end
  end

  def skip?(file)
    return false if @symlink_weather
    return true if is_in_year_directory?(file)

    false
  end

end
