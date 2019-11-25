#### EXCEPTIONS ON COPY OR SYMLINK CURVE ####

# Files you do not want to initially copy or symlink
def curve_is_no_exception(curve_name)
  !curve_is_part_of_weather_folder(curve_name)
end

def curve_is_part_of_weather_folder(curve_name)
  (curve_name.start_with?('air') ||
    curve_name.start_with?('insulation') ||
    curve_name.start_with?('weather') ||
    curve_name.start_with?('solar') ||
    curve_name.start_with?('wind'))
end

def remove_exceptions_from_curves(curves)
  curves.select do |curve_name, curve_path|
    curve_is_no_exception(curve_name.basename.to_s)
  end
end