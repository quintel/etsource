module Solar
  WEATHER_YEAR_FOLDERS = [1987, 1997, 2004, "default"]
  SOLAR_PROFILE_2 = "#{ETDATASET_PATH}/curves/supply/solar/data/es/2015/output/solar_pv.csv"

  # Solar profiles
  def extend_solar_profiles(dest, country)
    WEATHER_YEAR_FOLDERS.each do | weather_year |
      extend_solar_profiles_for_year(dest.join("weather/#{ weather_year }/"),
                                     country)
    end
  end

  def extend_solar_profiles_for_year(path, country)
    # Duplicate solar_pv.csv to solar_pv_profile_1.csv.
    solar_profile = path.join("solar_pv.csv")
    if solar_profile.exist?
      cp_csv(path.join("solar_pv_profile_1.csv"), solar_profile)
    end
    # If nl, copy es2015 solar pv profile as solar_pv_profile_2.csv
    if country == 'nl'
      cp_csv(path.join("solar_pv_profile_2.csv"), Pathname.new(SOLAR_PROFILE_2))
    end
  end

end
