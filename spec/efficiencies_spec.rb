require 'spec_helper'

Pathname.glob(Atlas.data_dir.join('datasets/*/efficiencies/*.csv')).each do |csv_path|
  region_name = csv_path.to_s.match(%r{datasets/([^/]+)/})[1]
  filename    = csv_path.basename

  describe "#{ region_name }/efficiencies/#{ filename }" do
    before(:all) do
      @document = Atlas::CSVDocument.new(csv_path)
    end

    it 'has a "key" header' do
      expect(@document.table.headers[0]).to eql(:key)
    end

    it 'has a "share" header' do
      expect(@document.table.headers[1]).to eql(:share)
    end

    it 'has a numeric value for each efficiency' do
      @document.table.each do |row|
        expect(row[1]).to be_a(Numeric)
      end
    end

    it 'each row begins with "input" or "output"' do
      @document.table.each do |row|
        expect(row[0]).to match(/\A(in|out)put\./)
      end
    end

    it 'has a valid carrier in each row' do
      @document.table.each do |row|
        carrier_key = row[0].split('.')[1]
        expect { Atlas::Carrier.find(carrier_key) }.to_not raise_error
      end
    end
  end
end
