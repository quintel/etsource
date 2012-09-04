require 'spec_helper'

describe ETSource::Input do

  before(:each) do
    copy_fixtures_to_tmp
    stub_const("ETSource::Input::DIRECTORY", 'tmp/fixtures/inputs')
  end

  Dir.glob("#{ETSource.root}/spec/fixtures/inputs/*.yml").each do |file_name|

    base_name = File.basename(file_name, '.yml')

    describe base_name do

      describe "find" do

        it "should not return nil when something is found" do
          input = ETSource::Input.find(base_name)
          input.should_not be_nil
        end

        it "should return nil when nothing is found" do
          input = ETSource::Input.find("I do not exist for sure")
          input.should be_nil
        end

        it "should have the same key as used in the find" do
          input = ETSource::Input.find(base_name)
          input.key.should == base_name
        end

        it "should have a proper query" do
          input = ETSource::Input.find(base_name)
          input.query.size.should > 0
        end
      end

      describe "all" do

        it "should load all existing inputs" do
          input = ETSource::Input.all
          input.should have_at_least(1).input
        end

      end

      describe "file_contents" do

        it "should be the same as the original" do
          input = ETSource::Input.find(base_name)
          input.send(:file_contents).should == \
            File.read(input.file_path)
        end

      end # describe #file_contents

    end # describe basename

  end #Dir.glob

end # describe ETSource::Input
