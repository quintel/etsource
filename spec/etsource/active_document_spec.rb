require 'spec_helper'

module ETSource

  class SomeDocument < ActiveDocument

    attr_accessor :description, :unit, :query

    FILE_SUFFIX = 'suffix'
    DIRECTORY   = 'active_document'

  end

end

module ETSource

describe SomeDocument do

  before(:each) do
    copy_fixtures_to_tmp
    stub_const("ETSource::SomeDocument::DIRECTORY",
               "tmp/fixtures/#{SomeDocument::DIRECTORY}")
  end

  let(:some_document){ some_document = SomeDocument.find('foo') }

  describe 'new' do
    context 'given dumb key' do
      it 'creates a new document' do
        expect(SomeDocument.new('key')).to be_a(SomeDocument)
      end
      xit 'raises and error when the key already exists' do
        expect(-> { SomeDocument.new('foo') } ).to \
          raise_error DuplicateKeyError
      end
    end
    context 'given file_path' do
      it 'creates a new document' do
        some_document = SomeDocument.new('my_map1/new')
        #TODO: make Parser smarter, so we can do without these attributes
        some_document.query = "this"
        some_document.description = "that"
        expect(some_document.save!).to be_true
      end
      xit 'raises and error when the key already exists' do
        SomeDocument.new('my_map1/new').save!
        expect(-> { SomeDocument.new('my_map2/new') } ).to \
          raise_error DuplicateKeyError
      end
    end
  end

  describe "absolute_file_path" do
    it "returns the absolute_path" do
      ETSource.stub!(:root) { "/tmp" }
      stub_const("ETSource::SomeDocument::DIRECTORY", "some_documents")
      some_document = SomeDocument.new('foo')

      expect(some_document.absolute_file_path).to eql '/tmp/some_documents/foo.suffix'
    end
  end

  describe "load" do

    it "should load a some_document from file" do
      some_document.key.should == 'foo'
      some_document.file_path.should include some_document.key
      some_document.description.size.should > 0
      some_document.description.should include "MECE" #testing some words
      some_document.description.should include "graph." #testing some words
      some_document.unit.should == 'kg'
    end

    it "loads a document from a subfolder" do
      another_document = ETSource::SomeDocument.find('bar')
      expect(another_document).to_not be_nil
    end

  end

  describe "key" do

    it "returns just the key part" do
      expect(some_document.key).to eql 'foo'
    end

    it "it impossible to set a empty or nil key" do
      expect(-> { some_document.key = nil }).to raise_error
      expect(-> { some_document.key = "" }).to raise_error
    end

  end

  describe "file_contents" do

    context 'when nothing changed' do
      it "should be the same as the original" do
        some_document.send(:file_contents).should == \
          File.read("#{ETSource.root}/spec/fixtures/active_document/foo.suffix")
      end
    end

    context 'when something has changed' do
      it "should not be the same as the original" do
        some_document.unit = "Mtonne"
        some_document.send(:file_contents).should_not == \
          File.read("#{ETSource.root}/spec/fixtures/active_document/foo.suffix")
      end
    end
  end

  describe "file_path" do

    it "should change when the key has changed" do
      some_document.key = "total_co2_emitted"
      some_document.key.should == "total_co2_emitted"
      some_document.file_path.should include "total_co2_emitted"
    end

  end

  describe "save!" do

    context 'when nothing changed' do

      it "should not change anything when nothing changed" do
        cache = File.read(some_document.file_path)
        some_document.save!
        cache.should == File.read(some_document.file_path)
      end

    end

    context 'when the key changed' do

      it "should delete the old file" do
        old_path = some_document.file_path
        some_document.key = "foo2"
        some_document.save!
        expect { File.read(old_path) }.to raise_error
      end

      it "should create a new file" do
        some_document.key = "foo2"
        some_document.save!
        expect { File.read(some_document.file_path) }.to_not raise_error
      end

      context 'when another object with that key already exists' do

        it 'raises error' do
          expect(-> { some_document.key = 'bar'}).to raise_error(DuplicateKeyError)
        end

      end

    end

  end

  describe "(Private) normalize_path" do
    # assume ETSource.root is in /tmp
    # and the Directory is some_documents
    before do
      ETSource.stub!(:root) { "/tmp" }
      stub_const("ETSource::SomeDocument::DIRECTORY", "some_documents")
      @some_document = SomeDocument.new('foo')
    end

    it "accepts just a key" do
      expect(@some_document.send(:normalize_path, 'foo')).to \
        eql 'some_documents/foo.suffix'
    end
    it "accepts a path" do
      expect(@some_document.send(:normalize_path, "some_documents/foo")).to \
        eql "some_documents/foo.suffix"
    end
    it "accepts a path with suffix" do
      expect(@some_document.send(:normalize_path, "some_documents/foo.suffix")).to \
        eql "some_documents/foo.suffix"
    end
    it "raises an error if given a full path" do
      expect(-> { @some_document.send(:normalize_path,
                                      "/some_documents/foo.suffix") }).to \
        raise_error InvalidKeyError
    end
  end

end #describe SomeDocument

end #module
