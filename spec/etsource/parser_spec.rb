require 'spec_helper'

module ETSource

describe Parser do

  let(:text) do
    <<TEXT
# line1
# line2

- unit = %
- deprecated_key = foo
- foo = bar
- baz = 1
- array = a, b, c

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
      baz:             1,
      array:           ["a","b","c"]
    }
  end

  let(:p) { Parser.new(text) }

  describe "initialize" do
    it "should raise an error when empty string is provided" do
      expect { Parser.new("") }.to raise_error(ArgumentError)
      expect { Parser.new(nil) }.to raise_error(ArgumentError)
    end
  end

  describe "to_hash" do

    it "parses comments" do
      expect(p.to_hash[:description]).to eql "line1\nline2"
    end

    it "respects trailing spaces, even though we dislike them" do
      p = Parser.new("# line1 \n# line2\n")
      expect(p.to_hash[:description]).to eql "line1 \nline2"
    end

    it "parses attributes" do
      expect(p.to_hash[:unit]).to eql "%"
      expect(p.to_hash[:deprecated_key]).to eql "foo"
      expect(p.to_hash[:foo]).to eql "bar"
    end

    it "respects integers" do
      p = Parser.new("- number = 1")
      expect(p.to_hash[:number]).to eql 1
    end

    it "respects floats" do
      p = Parser.new("- number = 1.0")
      expect(p.to_hash[:number]).to eql 1.0
    end

    it "respects floats as scientific notations" do
      p = Parser.new("- number = 1.0e+0")
      expect(p.to_hash[:number]).to eql 1.0
    end

    it "parses arrays" do
      expect(p.to_hash[:array]).to eql ["a","b","c"]
    end

    it "should parse query" do
      p = Parser.new("SUM(\n  1,\n  2\n)")
      expect(p.to_hash[:query]).to eql "SUM(\n  1,\n  2\n)"
    end

    it "should give itself back" do
      p = Parser.new(text)
      expect(p.to_text).to eql text
    end

    it "does not return query when there is none" do
      p = Parser.new("- foo = bar\n")
      expect(p.to_hash).to eql({foo: "bar"})
    end

    it "does not parse empty lines as query line(s)" do
      p = Parser.new("\n")
      expect(p.to_hash).to eql({})
      p = Parser.new(" ")
      expect(p.to_hash).to eql({})
    end

  end

  describe "to_text" do

    it "should parse completely" do
      p = Parser.new(hash)
      expect(p.to_text).to eql text
    end

    it "should give itself back" do
      p = Parser.new(hash)
      expect(p.to_hash).to eql hash
    end

    it "parses one attribute" do
      p = Parser.new({foo: 'bar'})
      expect(p.to_text).to eql "- foo = bar\n"
    end

    it "parses two attributes" do
      p = Parser.new({foo: 'bar', fool: 'bars'})
      expect(p.to_text).to eql "- foo = bar\n- fool = bars\n"
    end

  end

  describe "to_yaml" do
    it "should parse from hash" do
      p = Parser.new({foo: :bar, 1 => "two"})
      expect(p.to_yaml).to eql "---\nfoo: :bar\n1: two\n"
    end

    it "should parse from existing yaml file" do
      copy_fixtures_to_tmp
      path = "#{ETSource.root}/tmp/fixtures/inputs/agriculture_electricity_demand.yml"
      p = Parser.new(YAML.load_file(path))
      expect(p.to_yaml).to eql File.read(path)
    end

    it "should parse Symbol keys as strings" do
      p = Parser.new({foo: :bar})
      expect(p.to_yaml).to eql "---\nfoo: :bar\n"
    end
  end

end

end
