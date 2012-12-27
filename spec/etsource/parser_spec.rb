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

    it "parses comments" do
      p = ETSource::Parser.new(text)
      expect(p.to_hash[:description]).to eql "line1\nline2"
    end

    it "respects trailing spaces, even though we dislike them" do
      p = ETSource::Parser.new("# line1 \n# line2\n")
      expect(p.to_hash[:description]).to eql "line1 \nline2"
    end

    it "respects trailing empty lines, even though we dislike them" do
      p = ETSource::Parser.new("SUM(\n  1,\n  2\n)\n")
      expect(p.to_hash[:query]).to eql "SUM(\n  1,\n  2\n)\n"
    end

    it "parses attributes" do
      p = ETSource::Parser.new(text)
      expect(p.to_hash[:unit]).to eql "%"
      expect(p.to_hash[:deprecated_key]).to eql "foo"
      expect(p.to_hash[:foo]).to eql "bar"
      expect(p.to_hash[:baz]).to eql ""
    end

    it "should parse query" do
      p = ETSource::Parser.new(text)
      expect(p.to_hash[:query]).to eql "SUM(\n  1,\n  2\n)\n"
    end

    it "should give itself back" do
      p = ETSource::Parser.new(text)
      expect(p.to_text).to eql text
    end
  end

  describe "to_text" do

    it "should parse completely" do
      p = ETSource::Parser.new(hash)
      expect(p.to_text).to eql text
    end

    it "should give itself back" do
      p = ETSource::Parser.new(hash)
      expect(p.to_hash).to eql hash
    end

  end

  describe "to_yaml" do
    it "should parse from hash" do
      p = ETSource::Parser.new({foo: :bar, 1 => "two"})
      expect(p.to_yaml).to eql "---\nfoo: :bar\n1: two\n"
    end

    it "should parse from existing yaml file" do
      copy_fixtures_to_tmp
      path = "#{ETSource.root}/tmp/fixtures/inputs/agriculture_electricity_demand.yml"
      p = ETSource::Parser.new(YAML.load_file(path))
      expect(p.to_yaml).to eql File.read(path)
    end

    it "should parse Symbol keys as strings" do
      p = ETSource::Parser.new({foo: :bar})
      expect(p.to_yaml).to eql "---\nfoo: :bar\n"
    end
  end

end

