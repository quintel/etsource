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

      it "respects empty lines" do
        p = TextToHashParser.new("# line1\n#\n# line2\n")
        expect(p.to_hash[:description]).to eql "line1\n\nline2"
      end

      it "parses attributes" do
        expect(p.to_hash[:unit]).to eql "%"
        expect(p.to_hash[:deprecated_key]).to eql "foo"
        expect(p.to_hash[:foo]).to eql "bar"
      end

      it "parses attributes to nil when its empty with a space" do
        p = TextToHashParser.new("- unit = ")
        expect(p.to_hash[:unit]).to eq ""
        expect(p.to_hash[:query]).to be_nil
      end

      it "parses attributes to nil when its empty without a space" do
        p = TextToHashParser.new("- unit =")
        expect(p.to_hash[:unit]).to eq ""
        expect(p.to_hash[:query]).to be_nil
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

      it "parses arrays of strings" do
        p = TextToHashParser.new("- array = [a, b, c]")
        expect(p.to_hash[:array]).to eql %w(a b c)
      end

      it "parses arrays of numerics" do
        p = TextToHashParser.new("- array = [2, 2.1, 2.0e3]")
        expect(p.to_hash[:array]).to eql [2, 2.1, 2000.0]
      end

      it "parses empty arrays" do
        p = TextToHashParser.new("- array = []")
        expect(p.to_hash[:array]).to eql []
      end

      it "parses empty arrays with whitespace" do
        p = TextToHashParser.new("- array = [ ]  ")
        expect(p.to_hash[:array]).to eql []
      end

      it 'parses hashes' do
        p = TextToHashParser.new("- hash.one = 1\n- hash.two = 2")
        expect(p.to_hash[:hash]).to eql(one: 1, two: 2)
      end

      it 'parses nested hashes' do
        p = TextToHashParser.new("- hash.one = 1\n- hash.two.three = 4")
        expect(p.to_hash[:hash]).to eql(one: 1, two: { three: 4 })
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
