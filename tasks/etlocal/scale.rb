desc <<-DESC
  Scale a dataset to number_of_residences

  Mandatory arguments:

  - FULL_DATASET         = a full dataset
  - NUMBER_OF_RESIDENCES = number of residences
  - DERIVED_DATASET      = new derived dataset name

DESC

task scale: :environment do
  raise ArgumentError, 'missing FULL_DATASET argument'         unless ENV['FULL_DATASET']
  raise ArgumentError, 'missing DERIVED_DATASET argument'      unless ENV['DERIVED_DATASET']
  raise ArgumentError, 'missing NUMBER_OF_RESIDENCES argument' unless ENV['NUMBER_OF_RESIDENCES']

  Atlas::Scaler.new(
    ENV['FULL_DATASET'], ENV['DERIVED_DATASET'], ENV['NUMBER_OF_RESIDENCES']
  ).create_scaled_dataset
end
