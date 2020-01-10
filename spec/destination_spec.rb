require 'spec_helper'
require 'destination.rb'

ETSOURCE_PATH  = File.expand_path('../../', __FILE__)
ETDATASET_PATH = ETSOURCE_PATH.sub('etsource', 'etdataset')

describe Destination do
  let(:dest) { Pathname.new("datasets/nl2016/curves").expand_path }
  let(:etdata_buildings_file) { "buildings_appliances.csv" }
  let(:destination_buildings) { Destination.new( etdata_buildings_file, "nl2016", 2016) }
  let(:etdata_wind_file) { "wind_inland_baseline.csv" }


  describe '#destination_path' do
    it 'in base folder' do
      expect(destination_buildings.destination_path).to eq(dest)
    end

    it 'in weather/default folder' do
      destination_wind = Destination.new( etdata_wind_file, "nl2016", 2016)
      expect(destination_wind.destination_path).to eq(dest.join("weather/default"))
    end

    it 'in weather/1987 folder' do
      destination_wind = Destination.new( etdata_wind_file, "nl2016", 1987)
      expect(destination_wind.destination_path).to eq(dest.join("weather/1987"))
    end
  end
end