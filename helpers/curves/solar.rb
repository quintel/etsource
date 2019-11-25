# Available variables
# @country, @etdataset_country, @dest, @year

# Solar profiles
def weather_year_solar_profiles
  ["default", "1987", "1997", "2004"].each do | weather_year |
    extend_solar_profiles(@dest.join("weather/#{ weather_year }/"))
  end
end

def extend_solar_profiles(path)
  # Duplicate solar_pv.csv to solar_pv_profile_1.csv.
  solar_profile = path.join("solar_pv.csv")
  if solar_profile.exist?
    cp_csv(solar_profile,
           path.join("solar_pv_profile_1.csv"))
  end
  # If nl, copy es2012 solar pv profile as solar_pv_profile_2.csv
  if @country == 'nl'
    cp_csv(Pathname.new("#{ETDATASET_PATH}/curves/supply/solar/data/es/2015/output/solar_pv.csv"),
           path.join("solar_pv_profile_2.csv"))
  end
end
