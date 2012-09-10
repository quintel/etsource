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
      query:           "SUM(\n  1,\n  2\n)",
      unit:            "%",
      deprecated_key:  "foo",
      foo:             "bar",
      baz:             ""
    }
  end

  describe "initialize" do
    it "should raise an error when nothing is provided" do
      expect { ETSource::Parser.new("") }.to raise_error
    end
  end

  describe "to_hash" do

    it "should parse comments" do
      p = ETSource::Parser.new(text)
      p.to_hash[:description].should == "line1\nline2"
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
      p.to_hash[:query].should == "SUM(\n  1,\n  2\n)"
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

end

