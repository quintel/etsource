require 'spec_helper'

describe ETSource do

  describe "root" do
    it "should return a string" do
      expect(ETSource.root.size).to be > 1
    end
  end

  describe '#data_dir' do
    it 'returns a Pathname' do
      expect(ETSource.data_dir).to be_a(Pathname)
    end

    it 'is a subdirectory of the root path' do
      expect(ETSource.data_dir.to_s).to include(ETSource.root)
    end
  end

  describe '#with_data_dir' do
    it 'temporarily changes the data directory' do
      ETSource.with_data_dir("#{ ETSource.root }/tmp") do
        expect(ETSource.data_dir.to_s).to eql("#{ ETSource.root }/tmp")
      end
    end

    it 'restores the previous directory when finished' do
      originally = ETSource.data_dir

      ETSource.with_data_dir('/tmp') {}

      expect(ETSource.data_dir).to eql(originally)
      expect(ETSource.data_dir).to_not eql('/tmp')
    end

    it 'restores the previous directory if an exception happens' do
      originally = ETSource.data_dir

      begin
        ETSource.with_data_dir('/tmp') { raise 'Nope' }
      rescue StandardError => exception
        raise exception unless exception.message == 'Nope'
      end

      expect(ETSource.data_dir).to eql(originally)
      expect(ETSource.data_dir).to_not eql('/tmp')
    end
  end

end
