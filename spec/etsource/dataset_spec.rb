require 'spec_helper'

module ETSource; describe Dataset, :fixures do
  describe "#new" do
    it "sets key" do
      dataset = Dataset.new(:nl)
      expect(dataset.key).to eql "nl"
    end
  end # describe #new

  describe "#find" do
    it "finds the Dutch dataset from file" do
      dataset = Dataset.find(:nl)
      expect(dataset).to be_a(Dataset)
      expect(dataset.key).to eql 'nl'
    end

    it "finds the UK dataset from file" do
      dataset = Dataset.find(:uk)
      expect(dataset).to be_a(Dataset)
      expect(dataset.key).to eql 'uk'
    end
  end # describe #load

  describe "#energy_balance" do
    it "has a energy_balance" do
      dataset = Dataset.find(:nl)
      expect(dataset.energy_balance).to be_a(EnergyBalance)
    end
  end

  describe '#shares' do
    let(:shares) { Dataset.find(:nl).shares(:cars) }

    it 'returns a ShareData for the correct area' do
      expect(shares.area).to eql(:nl)
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
