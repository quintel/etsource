desc <<-DESC
  Import's multiple CSV datasets
DESC

namespace :import do
  # See documentation for "task :import".
  task csv_import_datasets: :environment do
    raise ArgumentError, 'missing CSV argument' unless ENV['CSV']

    full_dataset = (ENV['FULL_DATASET'] || 'nl').freeze

    csv = CSV.read(ENV['CSV'],
                   headers: true,
                   skip_blanks: true,
                   internal_encoding: 'utf-8')

    csv.each do |row|
      keys            = Atlas::Dataset.attribute_set.map(&:name).map(&:to_s)
      region          = row.fetch('area').downcase.gsub(/\s/, '_')
      area_attributes = row.to_h.slice(*keys).merge(area: region)
      graph_values    = row.to_h.except(*keys)

      dataset = begin
        Atlas::Dataset::Derived.find(region)
      rescue Atlas::DocumentNotFoundError => e
        nil
      end

      unless dataset
        puts "Scaling new region #{ region }"
        Atlas::Scaler.new(
          full_dataset, region, row.fetch('number_of_residences')
        ).create_scaled_dataset

        dataset = Atlas::Dataset::Derived.find(region)
      end

      dataset.attributes = area_attributes
      dataset.save

      # Note: this method only works for graph methods which are related
      # to nodes and edges, NOT for slots.
      dataset.graph_values.create!

      graph_values.each_pair do |key, val|
        next unless key

        element_key, _, method = key.rpartition('-')

        dataset.graph_values.set(element_key, method, val.to_f)
        dataset.graph_values.save
      end

      puts "Saved area attributes and graph values to #{ region }"
    end
  end # :dataset
end
