# Available variables
# @country, @etdataset_country, @dest, @year

# Solar profiles
def add_solar_profiles
  # Duplicate solar_pv.csv to solar_pv_profile_1.csv.
  cp_csv(@dest.join("solar_pv.csv"),
         @dest.join("solar_pv_profile_1.csv"))

  # If nl, copy es2012 solar pv profile as solar_pv_profile_2.csv
  if @country == 'nl'
    cp_csv(Pathname.new("#{ETDATASET_PATH}/curves/supply/solar/data/es/2015/output/solar_pv.csv"),
           @dest.join("solar_pv_profile_2.csv"))
  else
    FileUtils.ln_sf(Pathname.new("../../nl/curves/solar_pv_profile_2.csv"), @dest)
  end
end
