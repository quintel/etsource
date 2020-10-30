# frozen_string_literal: true

require 'spec_helper'

describe 'Load profiles' do
  CURVE_GLOB = '{,weather/default}/*.csv'

  def self.nl_profiles
    profiles_dir = Atlas::Dataset.find(:nl).dataset_dir.join('curves')

    Pathname.glob(profiles_dir.join(CURVE_GLOB)).map do |path|
      path.relative_path_from(profiles_dir).to_s.gsub(/\.csv$/, '')
    end
  end

  # Internal: Determines if a path to a curve is a symlink to a curve elsewhere.
  #
  # Checks each parent directory up to the path of the dataset, but not beyond
  # in case ETSource itself is symlinked.
  #
  # Returns true or false.
  def self.symlinked_curve?(dataset, path)
    prev = nil

    while path != dataset.dataset_dir
      return true  if path.symlink?
      return false if path == prev

      prev = path
      path = path.parent
    end

    false
  end

  Atlas::Dataset.all.each do |dataset|
    # Skip testing a dataset curves if the curves directory is a symlink.
    next if symlinked_curve?(dataset, dataset.dataset_dir.join('curves'))

    describe "for #{dataset.key.upcase}" do
      if dataset.key != :example
        nl_profiles.each do |prof_name|
          curve_path = dataset.load_profile_path(prof_name)
          next if symlinked_curve?(dataset, curve_path)

          it "should have a #{prof_name} load profile" do
            expect(curve_path).to be_file
          end
        end
      end

      unless dataset.dataset_dir.join('curves').symlink?
        Pathname.glob(dataset.dataset_dir.join('curves', CURVE_GLOB)) do |file|
          # Skip any curves which are symlinks to curves in other datasets.
          next if symlinked_curve?(dataset, file)

          it "#{file.basename} does not permit CR (\\r) line endings" do
            message = "expected #{ file.relative_path_from(Atlas.data_dir) } " \
                      "to not have CR line endings"

            expect(file.read).not_to match(/\r[^\n]/), message
          end

          if file.basename.to_s != 'air_temperature.csv'
            it "#{file.basename} should have values summing to 1/3600" do
              values    = File.foreach(file).map(&:to_f)
              in_joules = values.reduce(:+) * 3600

              # The sum of the values in the load profile ought to equal
              # 1.0 / 3600 since the load profile will implicitly convert values
              # from ETEngine, which are in Joules, into watthours.
              expect(in_joules).to be_within(1e-7).of(1.0)
            end
          end
        end # each profile
      end
    end # for dataset
  end # each dataset
end # Load profiles
