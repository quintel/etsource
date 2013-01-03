require 'spec_helper'

module ETSource

  describe HashToTextParser do

    describe 'new' do
      it "should create a new parser" do
        expect(-> { HashToTextParser.new({}) }).to_not raise_error
      end
      it "should raise an ArgumentError when called with no Hash" do
        expect(-> { HashToTextParser.new() }).to raise_error ArgumentError
        expect(-> { HashToTextParser.new(nil) }).to raise_error ArgumentError
        expect(-> { HashToTextParser.new("string") }).to raise_error ArgumentError
      end
    end

    describe "to_text" do

      it "parses one attribute" do
        p = HashToTextParser.new({foo: 'bar'})
        expect(p.to_text).to eql "- foo = bar"
      end

      it "parses two attributes" do
        p = HashToTextParser.new({foo: 'bar', fool: 'bars'})
        expect(p.to_text).to eql "- foo = bar\n- fool = bars"
      end

      it "parses comments" do
        p = HashToTextParser.new({description: "hi\nthere!"})
        expect(p.to_text).to eql "# hi\n# there!"
      end

      it "parses query on one line" do
        query = "SUM(1+2)"
        p = HashToTextParser.new({query: query})
        expect(p.to_text).to eql query
      end

      it "parses query on two lines" do
        query = "SUM\n  (1,\n  2\n)"
        p = HashToTextParser.new({query: query})
        expect(p.to_text).to eql query
      end

      it "puts empty lines between comments and attributes" do
        hash = { description: "hi!", foo: 'bar' }
        p = HashToTextParser.new(hash)
        expect(p.to_text).to eql "# hi!\n\n- foo = bar"
      end

      it "puts empty lines between attributes and query" do
        hash = { foo: 'bar', query: "SUM(1,2)" }
        p = HashToTextParser.new(hash)
        expect(p.to_text).to eql "- foo = bar\n\nSUM(1,2)"
      end

      it "puts empty lines between comments and query" do
        hash = { description: 'hi', query: "SUM(1,2)" }
        p = HashToTextParser.new(hash)
        expect(p.to_text).to eql "# hi\n\nSUM(1,2)"
      end

    end # describe to_text

  end # describe HashToTextParser

end # module ETSource
