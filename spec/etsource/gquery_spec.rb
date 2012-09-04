require 'spec_helper'

describe ETSource::Gquery do

  before(:each) do
    copy_fixtures_to_tmp
    stub_const("ETSource::Gquery::DIRECTORY", 'tmp/fixtures/gqueries')
  end

  let(:gquery){ gquery = ETSource::Gquery.find('total_co2_emissions') }

  describe "load" do

    it "should load a gquery from file" do
      gquery.key.should == 'total_co2_emissions'
      gquery.file_path.should include gquery.key
      gquery.deprecated_key == 'co2_emission_total'
      gquery.description.size.should > 0
      gquery.description.should include "MECE" #testing some words
      gquery.description.should include "graph." #testing some words
      gquery.unit.should == 'kg'
    end

  end

  describe "file_contents" do

    it "should be the same as the original" do
      gquery.send(:file_contents).should == \
        File.read("#{ETSource.root}/spec/fixtures/gqueries/total_co2_emissions.gql")
    end

    it "should not change when something changed" do
      gquery.unit = "Mtonne"
      gquery.send(:file_contents).should_not == \
        File.read("#{ETSource.root}/spec/fixtures/gqueries/total_co2_emissions.gql")
    end
  end

  describe "file_path" do

    it "should change when the key has changed" do
      gquery.key = "total_co2_emitted"
      gquery.key.should == "total_co2_emitted"
      gquery.file_path.should include "gqueries/total_co2_emitted.gql"
    end

  end

  describe "save!" do

    it "should not change anything when nothing changed" do
      cache = File.read(gquery.file_path)
      gquery.save!
      cache.should == File.read(gquery.file_path)
    end

    it "should delete the old file when the key has changed" do
      old_path = gquery.file_path
      gquery.key = "foo"
      gquery.save!
      expect { File.read(old_path) }.to raise_error
    end

    it "should create a new file when the key has changed" do
      gquery.key = "foo"
      gquery.save!
      expect { File.read(gquery.file_path) }.to_not raise_error
    end

  end

end
