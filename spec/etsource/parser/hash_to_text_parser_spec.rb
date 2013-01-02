module ETSource

  describe HashToTextParser do

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
        expect(p.to_text).to eql "- foo = bar\n"
      end

      it "parses two attributes" do
        p = HashToTextParser.new({foo: 'bar', fool: 'bars'})
        expect(p.to_text).to eql "- foo = bar\n- fool = bars\n"
      end

    end # describe to_text

  end # describe HashToTextParser

end # module ETSource
