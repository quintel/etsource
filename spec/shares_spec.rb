require 'spec_helper'

Pathname.glob(Atlas.data_dir.join('datasets/*/shares/*.csv')).each do |csv_path|
  region_name = csv_path.to_s.match(%r{datasets/([^/]+)/})[1]
  filename    = csv_path.basename

  describe "#{ region_name }/shares/#{ filename }" do
    before(:all) do
      @document = Atlas::CSVDocument.new(csv_path)
    end

    it 'has a "key" header' do
      expect(@document.table.headers[0]).to eql(:key)
    end

    it 'has a "share" header' do
      expect(@document.table.headers[1]).to eql(:share)
    end

    it 'has a total share of 1.0' do
      expect(@document.table.sum { |row| row[:share] }).to be_within(1e-12).of(1)
    end
  end
end
