desc <<-DESC
  Add standard carrier values to each carriers.csv file
  Use the following variables to specify your carrier:
    key={carrier_name} co2_conversion_per_mj={value} cost_per_mj={value}
    potential_co2_conversion_per_mj={value}
DESC

task add_carrier: :environment do
  ATTRIBUTES = %w[key co2_conversion_per_mj cost_per_mj potential_co2_conversion_per_mj]
  missing = (ATTRIBUTES - ENV.keys)

  unless missing.empty?
    raise ArgumentError, "missing #{missing}"
  end

  def carrier_exists?(carrier_name, dataset)
    dataset.carriers.get(carrier_name, ATTRIBUTES[1])
  rescue
    false
  end

  carrier_name = ENV['key']

  Atlas::Dataset.all.each do |dataset|
    next if carrier_exists?(carrier_name, dataset)

    ATTRIBUTES.each do |key|
      next if key == 'key'

      dataset.carriers.set(carrier_name, key, ENV[key])
    end

    dataset.carriers.save!
  end
end
