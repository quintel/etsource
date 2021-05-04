require 'spec_helper'

def nl_curve_sets
  Atlas::Dataset.find(:nl).curve_sets
end

Atlas::Dataset.all.each do |dataset|
  RSpec.describe "#{dataset.key.to_s.upcase} dataset:" do
    # Skip the tests if ./curves is an alias to another dataset.
    next unless dataset.dataset_dir.join('curves').exist?

    nl_curve_sets.each do |nl_set|
      set = dataset.curve_sets.get(nl_set.name)

      # Skip if ./curves/{curve_set} is an alias to another dataset.
      next if set.path.join('').to_s == set.path.resolve('').to_s

      it "has a curve set called #{nl_set.name}" do
        expect(dataset.curve_sets.key?(nl_set.name)).to be(true)
      end

      it "has a default set of curves for the #{nl_set.name} curve set" do
        expect(set.variant?('default')).to be(true)
      end

      # For each variant, assert that it has the same files as the original.
      orig_files = nl_set.variant('default').curves.map(&:basename)

      set.each do |variant|
        describe "curves/#{set.name}/#{variant.name}" do
          weather_properties = Pathname.new('weather_properties.csv')

          it 'has the same curves as the NL default' do
            expect(orig_files)
              .to include(*(variant.curves.map(&:basename) - [weather_properties]))
          end

          next if variant.name == 'default'

          it 'has a weather_properties.csv' do
            expect(variant.curves.map(&:basename)).to include(weather_properties)
          end
        end
      end
    end

    # Weather profiles
    # --------------------------
    # Values in the insulation profiles should sum to 1/3600, representing the
    # demand profile throughout the year, converted from joules to watts.

    weather_set = dataset.dataset_dir.join('curves/weather')

    Pathname.glob(weather_set.join('**/*insulated_household.csv')).each do |file|
      context file.to_s do
        it 'should have values summing to 1.0' do
          sum = File.foreach(file).map(&:to_f).reduce(:+)
          expect(sum).to be_within(1e-7).of(1.0 / 3600)
        end
      end
    end
  end
end
