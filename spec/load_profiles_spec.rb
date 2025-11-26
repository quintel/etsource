# frozen_string_literal: true

require 'spec_helper'
require 'bigdecimal'

describe 'Load profiles' do
  CURVE_GLOB = '{,weather/default}/*.csv'

  def self.nl_profiles
    profiles_dir = Atlas::Dataset.find(:nl).dataset_dir.join('curves')

    Pathname.glob(profiles_dir.join(CURVE_GLOB)).map do |path|
      path.relative_path_from(profiles_dir).to_s.gsub(/\.csv$/, '')
    end
  end

  shared_examples 'a load profile CSV' do |curve|
    let(:curve_file) { curve }

    it 'does not permit CR (\r) line endings' do
      message = "expected #{ curve_file.relative_path_from(Atlas.data_dir) } " \
                "to not have CR line endings"

      expect(curve_file.read).not_to match(/\r[^\n]/), message
    end

    unless curve.basename.to_s == 'air_temperature.csv'
      let(:values) do
        File.foreach(curve_file, encoding: 'bom|utf-8').map do |line|
          BigDecimal(line.strip.scrub)
        end
      end

      it 'has values summing to 1/3600' do
        in_joules = values.reduce(BigDecimal('0'), :+) * BigDecimal('3600')

        # The sum of the values in the load profile ought to equal
        # 1.0 / 3600 since the load profile will implicitly convert values
        # from ETEngine, which are in Joules, into watthours.
        expect(in_joules).to be_within(BigDecimal('1e-7')).of(BigDecimal('1'))
      end

      it 'has 8760 lines' do
        expect(values.length).to eq(8760)
      end
    end
  end

  Atlas::Dataset.all.each do |dataset|
    # Skip testing a dataset curves if the curves directory is a symlink.
    next unless dataset.dataset_dir.join('curves').exist?

    describe "for #{dataset.key.upcase}" do
      if dataset.key != :example
        nl_profiles.each do |prof_name|
          curve_path = dataset.load_profile_path(prof_name)
          next unless curve_path.exist?

          it "should have a #{prof_name} load profile" do
            expect(curve_path).to be_file
          end
        end
      end

      if dataset.dataset_dir.join('curves').exist?
        Pathname.glob(dataset.dataset_dir.join('curves', CURVE_GLOB)) do |file|
          # Skip any curves which are symlinks to curves in other datasets.
          next unless file.exist?

          curve = file.dup

          context curve.basename.to_s do
            include_examples 'a load profile CSV', curve
          end
        end # each profile
      end
    end # for dataset
  end # each dataset
end # Load profiles
