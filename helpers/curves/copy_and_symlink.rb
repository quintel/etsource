# Available variables
# @country, @etdataset_country, @dest, @year

# Move all current etsource curves to hash (missing_curves {curve_name: path}).
# Update curves from etdataset and check which curves are still missing.
def copy_and_symlink
  missing_curves =
    Pathname.glob("#{ETDATASET_PATH}/curves/**/nl/2015/output/*.csv")
      .each_with_object({}) { |path, data| data[path.basename] = path }
  missing_curves = remove_exceptions_from_curves(missing_curves)

  Pathname.glob(@dest.join("/*.csv")).each(&FileUtils.method(:rm))
  csvs_path = "#{ETDATASET_PATH}/curves/**/#{ @etdataset_country }/#{ @year }/output/*.csv"
  Pathname.glob(csvs_path).each do |csv|
    update_csv(csv)
    missing_curves.delete(csv.basename)
  end

  missing_curves.each{ |curve_name, path| handle_missing_curve(curve_name, path) }
end

# Remove old csv and copy
def update_csv(csv)
  csv_base = csv.basename('.csv').to_s
  cp_csv(csv, @dest) if curve_is_no_exception(csv_base)
end

# For a missing curve try to copy a csv from other years
# else symlink the nl 2015 curve.
def handle_missing_curve(curve_name, curve_path)
  other_year_path = [1, -1, 2, -2, 3, -3]
    .map { |other_year| curve_path.join("../../../../#{ @etdataset_country }/#{ (@year.to_i + other_year).to_s }/output/#{ curve_name }") }
    .detect(&:exist?)

  if other_year_path
    cp_csv(other_year_path, @dest)
  else
    FileUtils.ln_sf(@dest.join("../../nl/curves/#{ curve_name }").expand_path, @dest)
  end
end
