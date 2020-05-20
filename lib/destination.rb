class Destination
  attr_reader :destination_path

  WEATHER_CURVE_STARTS = %w(wind solar air insulation weather flh buildings_heating agriculture_heating)
  WEATHER_YEAR_SPECIAL_YEARS = [1987, 1997, 2004]

  def initialize(file_name, country, year)
    @country, @year, @file_name = country, year, file_name
  end

  def destination_path
    if is_weather?
      weather_path.expand_path
    else
      destination_base_path.expand_path
    end
  end

  private

  def destination_base_path
    Pathname.new("datasets/#{ @country }/curves")
  end

  def weather_path
    year_folder = WEATHER_YEAR_SPECIAL_YEARS.include?(@year) ? @year : "default"
    destination_base_path.join("weather/#{ year_folder }/")
  end

  def is_weather?
    WEATHER_CURVE_STARTS.each do |name_start|
      return true if @file_name.start_with?(name_start)
    end
    false
  end

end