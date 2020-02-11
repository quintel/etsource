namespace :import do
  # See documentation for "task :import".
  task curves: :environment do
    require_relative './../../lib/curve_importer.rb'

    if ENV['DATASET']
      if ENV['YEAR']
        # if a YEAR is specified, import the curve for that year
        curves = { ENV['DATASET'] => ENV['YEAR'] }
      else
        # if no YEAR is specified, import the curve for the year listed in datasets.yml
        curves = { ENV['DATASET'] => YAML.load_file('datasets.yml')["#{ ENV['DATASET'] }"] }
      end
    else
      curves = YAML.load_file('curves.yml')
    end

    curves.each do |country, year|
      puts "Importing curves for: #{ country }/#{ year }"
      importer = CurveImporter.new(country, year)
      importer.import_curves

      encrypt_balance(Pathname.new("datasets/#{ country }/curves"))
    end
  end # each curve
end # :curves

desc <<-DESC
  Import ETDataset CSVs from #{ETDATASET_PATH}

  Defaults to importing all curves listed in curves.yml. Providing an optional DATASET environment
  parameter results in importing curves for only one dataset. If an optional YEAR environment parameter is provided,
  imports the curves for that country and year; if no YEAR is provided, import the year that is listed in
  curves.yml for that country.

  DATASET=nl YEAR=2015 rake import
DESC
task :import => ['import:curves']
