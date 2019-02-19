# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'real_estate data' do
  FILES = %w[
    insulation_costs_existing_apartments
    insulation_costs_existing_buildings
    insulation_costs_existing_corner_houses
    insulation_costs_existing_detached_houses
    insulation_costs_existing_semi_detached_houses
    insulation_costs_existing_terraced_houses
    insulation_costs_new_builds
  ].freeze

  datasets = Atlas::Dataset.all.reject do |ds|
    ds.dataset_dir.join('real_estate').symlink?
  end

  datasets.each do |ds|
    FILES.each do |filename|
      path = ds.dataset_dir.join("real_estate/#{filename}.csv")

      context "#{ds.key}/real_estate/#{filename}.csv" do
        it 'exists' do
          expect(path.exist?).to be(true)
        end
      end
    end
  end
end
