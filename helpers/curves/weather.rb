# Available variables
# @country, @etdataset_country, @dest, @year

# Weather profiles
def add_weather_profiles
  households_path = "#{ETDATASET_PATH}/curves/demand/households/space_heating/data/nl/"
  weather_path = "#{ETDATASET_PATH}/curves/supply/wind/data/#{ @etdataset_country }/"

  FileUtils.rm_rf(@dest.join("weather/"), :secure=>true)
  copy_to_weather(households_path) if @etdataset_country == 'nl'
  copy_to_weather(weather_path)
  symlink_weather
end

def copy_to_weather(etdata_path)
  copy_each_from_path(etdata_path, @year, "default")
  # Extreme weather years
  ["1987", "1997", "2004"].each do |extreme_weather_year|
    copy_each_from_path(etdata_path, extreme_weather_year,
                        extreme_weather_year)
  end
end

# copies all existing csvs from specified path and year to etsource
def copy_each_from_path(path, etdata_year, etsource_year)
  etsource_path = @dest.join("weather/#{ etsource_year }/")
  FileUtils.mkdir_p(etsource_path) unless etsource_path.exist?
  Pathname.glob(path + "#{ etdata_year }/output/*.csv").each do |csv|
    cp_csv(csv, etsource_path)
  end
end

# create symlink to the NL2015 if file does not exist
def symlink_weather
  ["default", "1987", "1997", "2004"].each do | weather_year |
    Pathname.glob(@dest + "../../nl/curves/weather/#{ weather_year }/*.csv").each do |csv|
      sym_path = @dest.join("weather/#{ weather_year }/")
      FileUtils.ln_sf(csv, sym_path) unless sym_path.join("#{ csv.basename }").exist?
    end
  end
end
