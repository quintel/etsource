require 'spec_helper'

module ETSource

  class SomeDocument
    include ActiveDocument

    attr_accessor :description, :unit, :query

    FILE_SUFFIX = 'suffix'
    DIRECTORY   = 'active_document'
  end

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

  describe "find" do

    it "should load a some_document from file" do
      expect(some_document.key).to eq('foo')
      expect(some_document.file_path).to include some_document.key
      expect(some_document.description.size).to be > 0
      expect(some_document.description).to include "MECE" #testing some words
      expect(some_document.description).to include "graph." #testing some words
      expect(some_document.unit).to eq('kg')
    end

    it "should find by Symbol" do
      some_document = ETSource::SomeDocument.find(:foo)
      expect(some_document.key).to eql 'foo'
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
        expect(some_document.send(:file_contents)).to eq(
          File.read("#{ETSource.root}/spec/fixtures/active_document/foo.suffix"))
      end
    end

    context 'when something has changed' do
      it "should not be the same as the original" do
        some_document.unit = "Mtonne"
        expect(some_document.send(:file_contents)).to_not eq(
          File.read("#{ETSource.root}/spec/fixtures/active_document/foo.suffix"))
      end
    end
  end

  describe "file_path" do

    it "should change when the key has changed" do
      some_document.key = "total_co2_emitted"
      expect(some_document.key).to eq("total_co2_emitted")
      expect(some_document.file_path).to include "total_co2_emitted"
    end

  end

  describe "save!" do

    context 'new file' do

      it 'writes to disk' do
        some_document = SomeDocument.new('the_king_of_pop')
        expect(some_document.save!).to be_true
      end

    end

    context 'when nothing changed' do

      it "does not write to disk" do
        cache = File.read(some_document.file_path)
        some_document.save!
        expect(cache).to eq(File.read(some_document.file_path))
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
          pending 'Pending re-introduction of duplicate-key check' do
            # Was temporarily removed due to stack overflows with the
            # ETengine specs.
            expect(-> { some_document.key = 'bar'}).
              to raise_error(DuplicateKeyError)
          end
        end

      end

    end

  end # describe save!

  describe 'destroy!' do

    it "should delete the file" do
      path = some_document.file_path
      some_document.destroy!
      expect(File.exists?(path)).to be_false
    end

  end

  describe 'inspect' do

    it 'should contain the key' do
      expect(some_document.to_s).to include some_document.key
    end

    it 'should contain the class name' do
      expect(some_document.to_s).to include some_document.class.to_s
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
