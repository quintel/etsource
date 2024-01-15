desc <<-DESC
  Import's multiple CSV datasets
DESC

namespace :import do
  # See documentation for "task :import".
  task csv_import_datasets: :environment do
    raise ArgumentError, 'missing CSV argument' unless ENV['CSV']

    full_dataset = (ENV['FULL_DATASET'] || 'nl').freeze

    # Needs this magic in order to remove starting \uFEFF character
    csv_string = File.read(ENV['CSV']).sub("\xEF\xBB\xBF", "").gsub("\r", "")

    CSV.parse(csv_string, headers: true, skip_blanks: true).each do |row|
      keys   = Atlas::Dataset.attribute_set.map(&:name).map(&:to_s)
      region = row.fetch('area').downcase.gsub(/\s/, '_')

      dataset = find_or_scale_by(region, full_dataset, row)
      dataset.attributes = row.to_h.slice(*keys).merge(area: region)
      dataset.save

      dataset.graph_values.create!

      set_graph_values(dataset, row.to_h.except(*keys))

      puts "Saved area attributes and graph values to #{ region }"
    end
  end # :dataset

  def find_or_scale_by(region, full_dataset, row)
    begin
      Atlas::Dataset::Derived.find(region)
    rescue Atlas::DocumentNotFoundError => e
      puts "Scaling new region #{ region }"
      Atlas::Scaler.new(
        full_dataset, region, row.fetch('number_of_inhabitants')
      ).create_scaled_dataset

      Atlas::Dataset::Derived.find(region)
    end
  end

  def set_graph_values(dataset, graph_values)
    graph_values.each_pair do |key, val|
      next if key.blank? || val.blank?

      element_key, _, method = key.rpartition('-')

      value = if method =~ /input|output/
        method, carrier = method.split('@')

        Hash[carrier, val.to_f]
      else
        val.to_f
      end

      dataset.graph_values.set(element_key, method, value)
      dataset.graph_values.save
    end
  end
end
