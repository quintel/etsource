require 'spec_helper'

describe ETSource::Parser do

  let(:text) do
    <<TEXT
# line1
# line2

- unit = %
- deprecated_key = foo
- foo = bar
- baz =

SUM(
  1,
  2
)
TEXT
  end

  let(:hash) do
    {
      description:     "line1\nline2",
      query:           "SUM(\n  1,\n  2\n)\n",
      unit:            "%",
      deprecated_key:  "foo",
      foo:             "bar",
      baz:             ""
    }
  end

  describe "initialize" do
    it "should raise an error when empty string is provided" do
      expect { ETSource::Parser.new("") }.to raise_error(ArgumentError)
      expect { ETSource::Parser.new(nil) }.to raise_error(ArgumentError)
    end
  end

  describe "to_hash" do

    it "should parse comments" do
      p = ETSource::Parser.new(text)
      p.to_hash[:description].should == "line1\nline2"
    end

    it "should respect trailing spaces, even though we dislike them" do
      p = ETSource::Parser.new("# line1 \n# line2\n")
      p.to_hash[:description].should == "line1 \nline2"
    end

    it "should repect trailing empty lines, even though we dislike them" do
      p = ETSource::Parser.new("SUM(\n  1,\n  2\n)\n")
      p.to_hash[:query].should == "SUM(\n  1,\n  2\n)\n"
    end

    it "should parse variables" do
      p = ETSource::Parser.new(text)
      p.to_hash[:unit].should == "%"
      p.to_hash[:deprecated_key].should == "foo"
      p.to_hash[:foo].should == "bar"
      p.to_hash[:baz].should == ""
    end

    it "should parse query" do
      p = ETSource::Parser.new(text)
      p.to_hash[:query].should == "SUM(\n  1,\n  2\n)\n"
    end

    it "should give itself back" do
      p = ETSource::Parser.new(text)
      p.to_text.should == text
    end
  end

  describe "to_text" do

    it "should parse completely" do
      p = ETSource::Parser.new(hash)
      p.to_text.should == text
    end

    it "should give itself back" do
      p = ETSource::Parser.new(hash)
      p.to_hash.should == hash
    end

  end

  describe "to_yaml" do
    it "should parse from hash" do
      p = ETSource::Parser.new({foo: :bar, 1 => "two"})
      p.to_yaml.should == "---\nfoo: :bar\n1: two\n"
    end

    it "should parse from existing yaml file" do
      copy_fixtures_to_tmp
      path = "#{ETSource.root}/tmp/fixtures/inputs/agriculture_electricity_demand.yml"
      p = ETSource::Parser.new(YAML.load_file(path))
      p.to_yaml.should == File.read(path)
    end

    it "should parse Symbol keys as strings" do
      p = ETSource::Parser.new({foo: :bar})
      p.to_yaml.should == "---\nfoo: :bar\n"
    end
  end

end

