require 'spec_helper'
require 'source.rb'

ETSOURCE_PATH  = File.expand_path('../../', __FILE__)
ETDATASET_PATH = ETSOURCE_PATH.sub('etsource', 'etdataset')

describe Source do
  let(:default_year) { 2015 }
  let(:etdata_path) { "#{ETDATASET_PATH}/curves/demand/buildings/appliances/data/nl/2015/output/" }
  let(:etdata_small_path) {Pathname.new("#{ETDATASET_PATH}/curves/demand/buildings/appliances/data/")}
  let(:source) { Source.new(etdata_small_path, "nl", default_year) }


  describe '#set_valid_path' do
    before do
      unless File.exist?(ETDATASET_PATH)
        skip('Cannot test Source when ETDataset is not present')
      end
    end

    context 'with valid path' do
      it 'keeps the path' do
        source
        expect(source.etdata_path.to_s).to eq(etdata_path)
      end
    end

    context 'with unavailable country' do
      let(:european_source) { Source.new(etdata_small_path, "eu", default_year) }

      it 'be falsey' do
        european_source
        expect(european_source.etdata_path).to eq(false)
      end
    end

    context 'with unavailable year' do
      let(:unvalid_source) { Source.new(etdata_small_path, "nl", (default_year - 1)) }

      it 'creates a valid path' do
        unvalid_source
        expect(unvalid_source.etdata_path.to_s).to eq(etdata_path)
      end

      context 'out of range' do
        let(:unvalid_source_old) { Source.new(etdata_small_path, "nl", (default_year - 4)) }

        it 'be falsey' do
          unvalid_source_old
          expect(unvalid_source_old.etdata_path).to eq(false)
        end
      end
    end
  end

end
