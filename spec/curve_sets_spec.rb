require 'spec_helper'

def nl_curve_sets
  base_path = Atlas::Dataset.find(:nl).dataset_dir

  Pathname.glob(base_path.join('curves').join('*')).map do |fullpath|
    fullpath.relative_path_from(base_path)
  end
end

Atlas::Dataset.all.each do |dataset|
  RSpec.describe "#{ dataset.key.to_s.upcase } dataset" do
    nl_curve_sets.each do |set_path|
      it "has a curve set at #{ dataset.key }/#{ set_path.join('default') }" do
        expect(dataset.dataset_dir.join(set_path).join('default')).to be_directory
      end

      # For each variant, assert that it has the same files as the original.
      orig_files =
        Pathname.glob(
          Atlas::Dataset.find(:nl).dataset_dir
          .join(set_path).join('default').join('*.csv')
        ).map(&:basename)

      Pathname.glob(dataset.dataset_dir.join(set_path).join('*')).each do |variant_path|
        describe variant_path.relative_path_from(dataset.dataset_dir) do
          orig_files.each do |basename|
            it "has a #{ basename } curve" do
              curves = dataset.dataset_dir
                .join(set_path).join(variant_path)
                .children.map(&:basename)

              expect(curves).to include(basename)
            end
          end # lol...
        end # describe variant
      end # each variant in the curve-set
    end # each curve set

    # Heat / insulation profiles
    # --------------------------
    # Values in the insulation profiles should sum to 1/3600, representing the
    # demand profile throughout the year, converted from joules to watts.

    heat_set = dataset.dataset_dir.join('curves/heat')

    Pathname.glob(heat_set.join('**/*insulated_household.csv')).each do |file|
      context file.to_s do
        it 'should have values summing to 1.0' do
          sum = File.foreach(file).map(&:to_f).reduce(:+)
          expect(sum).to be_within(1e-7).of(1.0 / 3600)
        end
      end
    end
  end # describe dataset
end # Dataset.all.each
