require 'spec_helper'

describe 'Load profiles' do
  def self.nl_profiles
    profiles_dir = Atlas::Dataset.find(:nl).dataset_dir.join('load_profiles')

    Pathname.glob(profiles_dir.join('*.csv')).map do |path|
      path.relative_path_from(profiles_dir).basename('.csv')
    end
  end

  Atlas::Dataset.all.each do |dataset|
    describe "for #{ dataset.key.upcase }" do
      if dataset.key != :example
        nl_profiles.each do |prof_name|
          it "should have a #{ prof_name } load profile" do
            expect(dataset.load_profile_path(prof_name)).to be_file
          end
        end
      end

      Pathname.glob(dataset.dataset_dir.join('load_profiles/*.csv')) do |file|
        it "#{ file.basename } does not permit CR (\\r) line endings" do
          message = "expected #{ file.relative_path_from(Atlas.data_dir) } " \
                    "to not have CR line endings"

          expect(file.read).to_not match(/\r[^\n]/), message
        end

        it "#{ file.basename } should have values summing to 1/3600" do
          values    = File.foreach(file).map(&:to_f)
          in_joules = values.reduce(:+) * 3600

          # The sum of the values in the load profile ought to equal 1.0 / 3600
          # since the load profile will implicitly convert values from ETEngine,
          # which are in Joules, into watthours.
          expect(in_joules).to be_within(1e-7).of(1.0)
        end # have values summing to 1/3600
      end # each profile
    end # for dataset
  end # each dataset
end # Load profiles
