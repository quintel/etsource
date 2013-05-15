require 'spec_helper'

module ETSource

describe EnergyUnit do

  let(:eu) { EnergyUnit.new(3600.0, :pj) }

  describe '#initialize' do

    it 'remembers unit' do
      expect(eu.unit).to eq :pj
    end

  end

  describe '#to_unit' do

    context 'same unit' do

      it 'calculates correctly' do
        expect(eu.to_unit(:pj)).to eql 3600.0
      end

    end

    context 'different unit' do

     it 'supports twh' do
        expect(eu.to_unit(:twh)).to eql 1000.0
     end

     it 'supports kwh' do
        expect(eu.to_unit(:kwh)).to eql 1_000_000_000_000.0
     end

     it 'supports mj' do
        expect(eu.to_unit(:mj)).to eql 3600.0 * 10**6
      end

     it 'supports tj' do
        expect(eu.to_unit(:tj)).to eql 3600.0 * 10**3
     end

    end

    context 'non-existing unit' do

      it 'raises an error' do
        expect { eu.to_unit(:jamie_foxx) }.to raise_error
      end

    end


  end

end

end

