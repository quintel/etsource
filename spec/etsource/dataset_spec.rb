require 'spec_helper'

module ETSource; describe Dataset, :fixures do
  describe "#new" do
    it "sets key" do
      dataset = Dataset.new(key: :nl)
      expect(dataset.key).to eql(:nl)
    end
  end # describe #new

  describe "#find" do
    it "finds the Dutch dataset from file" do
      dataset = Dataset.find(:nl)
      expect(dataset).to be_a(Dataset)
      expect(dataset.key).to eql(:nl)
    end

    it "finds the UK dataset from file" do
      dataset = Dataset.find(:uk)
      expect(dataset).to be_a(Dataset)
      expect(dataset.key).to eql(:uk)
    end
  end # describe #load

  describe '#path' do
    let(:dataset) { Dataset.new(key: :kr) }

    it 'includes the data directory' do
      expect(dataset.path.to_s).to include(ETSource.data_dir.to_s)
    end

    it 'points to the datasets subdirectory' do
      expect(dataset.path.to_s).to include('/datasets/')
    end

    it 'includes the dataset key' do
      expect(dataset.path.to_s).to end_with('/kr')
    end
  end

  describe "#energy_balance" do
    it "has a energy_balance" do
      dataset = Dataset.find(:nl)
      expect(dataset.energy_balance).to be_a(EnergyBalance)
    end
  end

  describe '#shares' do
    let(:dataset) { Dataset.find(:nl) }
    let(:shares)  { dataset.shares(:cars) }

    it 'returns a ShareData for the correct area' do
      expect(shares.dataset).to eql(dataset)
    end

    it 'returns a ShareData for the correct file key' do
      expect(shares.file_key).to eql(:cars)
    end

    it 'raises UnknownShareDataError when no shares data exists' do
      expect { Dataset.find(:nl).shares(:nope) }.
        to raise_error(UnknownShareDataError)
    end
  end # shares
end ; end
