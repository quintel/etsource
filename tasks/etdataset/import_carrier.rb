namespace :import do
  desc <<-DESC
    Import data from an ETDataset carrier analysis file.

    Provide the task with a CARRIER variable specifying the key of the carrier to be
    updated.

    For example:

      rake import:carrier CARRIER=bio_oil

  DESC
  task carrier: :environment do
    carrier = Atlas::Carrier.find(ENV['CARRIER'])
    xlsx    = Roo::Spreadsheet.open("#{ETDATASET_PATH}/carriers_source_analyses/#{ENV['CARRIER']}.carrier.xlsx")

    unless carrier
      raise ArgumentError, "carrier #{ENV['CARRIER']} does not exist!"
    end

    carrier.attributes = xlsx.sheet('Dashboard')
      .each(attribute: 'Attribute', value: 'Value')
      .each_with_object({}) do |row, result|
        next unless row[:value].is_a?(Numeric)

        result[row[:attribute]] = row[:value]
      end

    carrier.save
  end # :carrier
end
