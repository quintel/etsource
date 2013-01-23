require 'spec_helper'

module ETSource

  describe TextToHashParser do

    let(:text) do <<TEXT
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

    let(:p) { TextToHashParser.new(text) }

    describe 'new' do
      it "should create a new parser" do
        expect(-> { TextToHashParser.new("SUM(1,2)") }).to_not raise_error
      end
      it "should not raise an error when empty string is provided" do
        expect { TextToHashParser.new("") }.to_not raise_error
      end
      it "should raise an error when nil is provided" do
        expect { TextToHashParser.new(nil) }.to_not raise_error
      end
    end

    describe "to_hash" do

      it "parses comments" do
        expect(p.to_hash[:description]).to eql "line1\nline2"
      end

      it "respects trailing spaces, even though we dislike them" do
        p = TextToHashParser.new("# line1 \n# line2\n")
        expect(p.to_hash[:description]).to eql "line1 \nline2"
      end

      it "parses attributes" do
        expect(p.to_hash[:unit]).to eql "%"
        expect(p.to_hash[:deprecated_key]).to eql "foo"
        expect(p.to_hash[:foo]).to eql "bar"
      end

      it "respects integers" do
        p = TextToHashParser.new("- number = 1")
        expect(p.to_hash[:number]).to eql 1
      end

      it "respects floats" do
        p = TextToHashParser.new("- number = 1.0")
        expect(p.to_hash[:number]).to eql 1.0
      end

      it "respects floats as scientific notations" do
        p = TextToHashParser.new("- number = 1.0e+0")
        expect(p.to_hash[:number]).to eql 1.0
      end

      it "parses arrays" do
        p = TextToHashParser.new("- array = a, b, c")
        expect(p.to_hash[:array]).to eql ["a","b","c"]
      end

      it "should parse query" do
        p = TextToHashParser.new("SUM(\n  1,\n  2\n)")
        expect(p.to_hash[:query]).to eql "SUM(\n  1,\n  2\n)"
      end

      it "does not return query when there is none" do
        p = TextToHashParser.new("- foo = bar\n")
        expect(p.to_hash).to eql({foo: "bar"})
      end

      it "does not parse empty lines as query line(s)" do
        p = TextToHashParser.new("\n")
        expect(p.to_hash).to eql({})
        p = TextToHashParser.new(" ")
        expect(p.to_hash).to eql({})
      end

    end # describe to_hash

  end # describe TextToHashParser

end # module ETSource::Parser
