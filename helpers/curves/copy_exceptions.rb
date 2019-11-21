#### EXCEPTIONS ON COPY OR SYMLINK CURVE ####
# air           Files to weather folder are copied serperately
# insulation

# Files you do not want to initially copy or symlink
def curve_is_no_exception(curve_name)
  (!curve_name.start_with?('air') &&
    !curve_name.start_with?('insulation'))
end

def remove_exceptions_from_curves(curves)
  curves.select do |curve_name, curve_path|
    curve_is_no_exception(curve_name.basename.to_s)
  end
end