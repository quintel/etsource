require 'spec_helper'

module ETSource

  class SomeDocument
    include ActiveDocument

    attribute :description, String
    attribute :unit,        String
    attribute :query,       String

    # Ignore validation except in the validation tests.
    validates :query, presence: true, if: :do_validation
    attr_accessor :do_validation

    FILE_SUFFIX = 'suffix'
    DIRECTORY   = 'active_document'
  end

  class OtherDocument < SomeDocument
  end

  class FinalDocument < OtherDocument
  end

describe SomeDocument, :fixtures do

  let(:some_document) { some_document = SomeDocument.find('foo') }

  describe 'new' do
    context 'given no key or path' do
      it 'raises an error' do
        expect { SomeDocument.new({}) }.to raise_error(NoPathOrKeyError)
      end
    end # given no key or path

    context 'given a dumb key' do
      it 'creates a new document' do
        expect(SomeDocument.new(key: 'key')).to be_a(SomeDocument)
      end

      it 'sets the key (as a symbol)' do
        expect(SomeDocument.new(key: 'key').key).to eql(:key)
      end

      it 'sets no subdirectory' do
        expect(SomeDocument.new(path: 'key').subdirectory).to be_nil
      end

      xit 'raises and error when the key already exists' do
        expect(-> { SomeDocument.new(key: 'foo') } ).to \
          raise_error DuplicateKeyError
      end
    end # given a dumb key

    context 'given a path' do
      it 'creates a new document' do
        some_document = SomeDocument.new(path: 'my_map1/new')
        expect(some_document.save!).to be_true
        expect(some_document.key).to eql(:new)
      end

      it 'sets the key (as a symbol)' do
        expect(SomeDocument.new(path: 'a/b/thing').key).to eql(:thing)
      end

      it 'saves in that folder' do
        some_document = SomeDocument.new(path: 'my_map1/new')
        expect(some_document.key).to eql(:new)
        expect(some_document.path.to_s).to match /my_map1\/new/
      end

      it 'sets no subdirectory' do
        document = SomeDocument.new(path: 'my_map1/new')
        expect(document.subdirectory).to eq('my_map1')
      end

      xit 'raises and error when the key already exists' do
        SomeDocument.new(path: 'my_map1/new').save!

        expect(-> { SomeDocument.new(path: 'my_map2/new') } ).to \
          raise_error DuplicateKeyError
      end
    end # given a file path
  end # new

  describe 'to_hash' do
    it 'is empty when no attributes have been set' do
      expect(SomeDocument.new(key: 'a').to_hash).to be_empty
    end

    it 'contains attributes set by the user' do
      document = SomeDocument.new(key: 'a', unit: '%', description: 'Mine')
      hash     = document.to_hash

      expect(hash).to include(unit: '%')
      expect(hash).to include(description: 'Mine')
    end

    it 'omits attributes which have no value' do
      document = SomeDocument.new(key: 'a', unit: '%')
      hash     = document.to_hash

      expect(hash).to_not have_key(:query)
      expect(hash).to_not have_key(:description)
    end
  end

  describe "find" do

    it "should load a some_document from file" do
      expect(some_document.key).to eql(:foo)
      expect(some_document.path.to_s).to include(some_document.key.to_s)
      expect(some_document.description.size).to be > 0
      expect(some_document.description).to include "MECE" #testing some words
      expect(some_document.description).to include "graph." #testing some words
      expect(some_document.unit).to eq('kg')
    end

    it "should find by Symbol" do
      some_document = ETSource::SomeDocument.find(:foo)
      expect(some_document.key).to eql(:foo)
    end

    it "should find by String" do
      some_document = ETSource::SomeDocument.find('foo')
      expect(some_document.key).to eql(:foo)
    end

    it "loads a document from a subfolder" do
      another_document = ETSource::SomeDocument.find(:bar)
      expect(another_document).to_not be_nil
    end

    it 'loads subclassed documents' do
      document = OtherDocument.new(key: 'other')
      document.save!

      expect(SomeDocument.find('other')).to be
    end

    it 'raises an error if no document exists' do
      expect { SomeDocument.find('omg') }.
        to raise_error(DocumentNotFoundError)
    end

    it 'raises an error if the document belongs to a superclass' do
      OtherDocument.new(key: 'other').save!

      expect { FinalDocument.find('other') }.
        to raise_error(DocumentNotFoundError)
    end

  end

  describe "key" do
    it "returns just the key part" do
      expect(some_document.key).to eql(:foo)
    end
  end

  describe 'key=' do
    context 'setting the key to nil' do
      let(:doc) { SomeDocument.new(key: 'key') }

      it 'raises InvalidKeyError' do
        expect { doc.key = nil }.to raise_error(InvalidKeyError)
      end
    end

    context 'setting an empty key' do
      let(:doc) { SomeDocument.new(key: 'key') }

      it 'raises InvalidKeyError' do
        expect { doc.key = '' }.to raise_error(InvalidKeyError)
      end
    end

    context 'when the document is at the class DIRECTORY root' do
      let(:doc) { SomeDocument.new(key: 'key') }
      before    { doc.key = 'new' }

      it 'changes the document key' do
        expect(doc.key).to eql(:new)
      end

      it 'puts the file at the DIRECTORY root' do
        expect(doc.path).
          to eql(SomeDocument.directory.join('new.suffix'))
      end
    end

    context 'when the document path includes a subdirectory' do
      let(:doc) { SomeDocument.new(path: 'dir/key') }
      before    { doc.key = 'new' }

      it 'changes the document key' do
        expect(doc.key).to eql(:new)
      end

      it 'puts the file in the subdirectory' do
        expect(doc.path).
          to eql(SomeDocument.directory.join('dir/new.suffix'))
      end
    end

    context 'when the document name contains the suffix substring' do
      let(:doc) { SomeDocument.new(path: 'suffix.suffix') }
      before    { doc.key = 'new' }

      it 'changes the document key' do
        expect(doc.key).to eql(:new)
      end

      it 'puts the file at the DIRECTORY root' do
        # Asserts that the suffix is not altered.
        expect(doc.path).to eql(SomeDocument.directory.join('new.suffix'))
      end
    end

    context 'when the document is a subclass' do
      let(:doc) { FinalDocument.new(path: 'okay') }
      before    { doc.key = 'new' }

      it 'changes the document key' do
        expect(doc.key).to eql(:new)
      end

      it 'retains the subclass string in the filename' do
        expect(doc.path.to_s).to include('.final_document')
      end
    end
  end # key=

  context '#path=' do
    context 'on a "base" class instance' do
      let(:document) { SomeDocument.new(path: 'abc') }

      it 'sets the new key' do
        document.path = 'def'
        expect(document.key).to eq(:def)
      end

      it 'ignores new subclass prefixes' do
        document.path = 'def.final_document.ad'
        expect(document.path).to eql(SomeDocument.directory.join('def.suffix'))
      end

      it 'ignores new file extensions' do
        document.path = 'def.omg'
        expect(document.path.to_s).to match(%r{/def\.suffix$})
      end

      it 'sets new subdirectories' do
        document.path = 'yes/no/omg'
        expect(document.subdirectory).to eq('yes/no')
      end

      it 'raises an error if the path is above the document root' do
        expect { document.path = '../omg' }.
          to raise_error(IllegalDirectoryError)
      end
    end # on a "base" class instance

    context 'with an absolute path' do
      let(:document) { SomeDocument.new(path: 'abc') }

      it 'sets legal paths' do
        document.path = document.directory.join('efg')
        expect(document.path).to eq(document.directory.join('efg.suffix'))
      end

      it 'raises an error if the path is above the document root' do
        expect { document.path = document.directory.dirname.join('efg') }.
          to raise_error(IllegalDirectoryError)
      end
    end # with an absolute path

    context 'on a subclass instance' do
      let(:document) { FinalDocument.new(key: 'abc') }

      it 'retains the subclass prefix' do
        document.path = 'abc.other_document.suffix'

        expect(document.path.to_s).to     include('final_document')
        expect(document.path.to_s).to_not include('other_document')
      end
    end # on a subclass instance
  end # path=

  describe 'ns' do
    it 'returns nil when the document is in the root' do
      expect(SomeDocument.new(path: 'abc').ns).to be_nil
    end

    it 'returns "one" when the document is in a "one" subdirectory' do
      expect(SomeDocument.new(path: 'one/abc').ns).to eq('one')
    end

    it 'returns "one.two" when the document is in "one/two" subdirectory' do
      expect(SomeDocument.new(path: 'one/two/abc').ns).to eq('one.two')
    end
  end # ns

  describe 'ns=' do
    subject        { SomeDocument.new(path: 'one/abc') }
    let(:dir)      { SomeDocument.directory }

    context 'given nil' do
      before { subject.ns = nil }

      its(:ns)    { should be_nil }
      its(:path) { should eq(dir.join('abc.suffix')) }
    end # given nil

    context 'given ""' do
      before { subject.ns = '' }

      its(:ns)    { should be_nil }
      its(:path) { should eq(dir.join('abc.suffix')) }
    end # given ''

    context 'given "two"' do
      before { subject.ns = 'two' }

      its(:ns)   { should eq('two') }
      its(:path) { should eq(dir.join('two/abc.suffix')) }
    end # given "two"

    context 'given "two.three"' do
      before { subject.ns = 'two.three' }

      its(:ns)   { should eq('two.three') }
      its(:path) { should eq(dir.join('two/three/abc.suffix')) }
    end # given "two.three"

    context 'given "two/three"' do
      before { subject.ns = 'two/three' }

      its(:ns)   { should eq('two.three') }
      its(:path) { should eq(dir.join('two/three/abc.suffix')) }
    end # given "two/three"
  end # ns=

  describe "file_contents" do

    context 'when nothing changed' do
      it "should be the same as the original" do
        expect(some_document.send(:file_contents)).to eq(
          ETSource.root.join('spec/fixtures/active_document/foo.suffix').read)
      end
    end

    context 'when something has changed' do
      it "should not be the same as the original" do
        some_document.unit = "Mtonne"
        expect(some_document.send(:file_contents)).to_not eq(
          ETSource.root.join('spec/fixtures/active_document/foo.suffix').read)
      end
    end
  end

  describe "path" do
    it "should change when the key has changed" do
      some_document.key = :total_co2_emitted
      expect(some_document.key).to eql(:total_co2_emitted)
      expect(some_document.path.to_s).to include "total_co2_emitted"
    end
  end

  describe 'valid?' do
    let(:document) do
      SomeDocument.new(key: 'key').tap do |doc|
        doc.do_validation = true
      end
    end

    it 'is false if validation fails' do
      document.query = nil
      expect(document).to_not be_valid
    end

    it 'is true if validation succeeds' do
      document.query = 'MAX(0, 0)'
      expect(document).to be_valid
    end
  end

  describe "save!" do

    context 'new file' do

      it 'writes to disk' do
        some_document = SomeDocument.new(key: 'the_king_of_pop')
        expect(some_document.save!).to be_true
      end

    end

    context 'when nothing changed' do

      it "does not write to disk" do
        cache = some_document.path.read
        some_document.save!
        expect(cache).to eq(some_document.path.read)
      end

    end

    context 'when validation fails' do
      let(:result) do
        some_document.do_validation = true
        some_document.update_attributes!(description: 'Archer', query: nil)
      end

      it 'does not save the file' do
        original_contents = some_document.path.read
        (result rescue nil)
        expect(some_document.path.read).to eq(original_contents)
      end

      it 'raises an exception' do
        expect { result }.to raise_error(InvalidDocumentError)
      end
    end

    context 'when the key changed' do

      it "should delete the old file" do
        old_path = some_document.path
        some_document.key = "foo2"
        some_document.save!
        expect { old_path.read }.to raise_error
      end

      it "should create a new file" do
        some_document.key = "foo2"
        some_document.save!
        expect { some_document.path.read }.to_not raise_error
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

  describe '#update_attributes!' do
    let(:document) { SomeDocument.find('foo') }

    context 'when successful' do
      let(:result) do
        document.update_attributes!(description: 'Archer', query: '*')
      end

      it 'returns true' do
        expect(result).to be_true
      end

      it 'updates given attributes' do
        expect { result }.to change {
          document.attributes.values_at(:description, :query)
        }.to(%w( Archer * ))
      end

      it 'leaves omitted attributes alone' do
        expect { result }.to_not change(document, :unit)
      end
    end

    context 'when validation fails' do
      let(:result) do
        document.do_validation = true
        document.update_attributes!(description: 'Archer', query: nil)
      end

      it 'updates given attributes' do
        expect { (result rescue nil) }.to change {
          document.attributes.values_at(:description, :query)
        }.to(['Archer', nil])
      end

      it 'raises an error' do
        expect { result }.
          to raise_error(ETSource::InvalidDocumentError, /Query/)
      end
    end
  end # update_attributes!

  describe '#all' do
    context 'on a "leaf" class' do
      it 'returns only members of that class' do
        expect(FinalDocument.all).to have(1).document
      end
    end

    context 'on a "branch" class' do
      it "returns members of that class, and it's subclasses" do
        classes = OtherDocument.all.map(&:class).uniq

        expect(classes).to have(2).elements

        expect(classes).to include(OtherDocument)
        expect(classes).to include(FinalDocument)
      end
    end
  end # all

  describe 'changing the key on subclassed documents' do
    let(:doc) { OtherDocument.new(path: 'fd.other_document.suffix') }
    before { doc.key = 'pd' }

    it 'retains the extension and subclass' do
      expect(doc.key).to eql(:pd)
    end

    it 'retains the subclass suffix' do
      expect(doc.path.basename.to_s).
        to eql([
          doc.key,
          doc.class.subclass_suffix,
          doc.class::FILE_SUFFIX].join('.'))
    end
  end

  describe 'destroy!' do

    it "should delete the file" do
      path = some_document.path
      some_document.destroy!
      expect(path.exist?).to be_false
    end

  end

  describe 'inspect' do

    it 'should contain the key' do
      expect(some_document.to_s).to include(some_document.key.to_s)
    end

    it 'should contain the class name' do
      expect(some_document.to_s).to include(some_document.class.to_s)
    end

  end

  describe '#<=>' do
    let(:node) { Node.new(key: 'f') }

    it 'is -1 when the node has an "earlier" key' do
      expect(Node.new(key: 'a') <=> node).to eql(-1)
    end

    it 'is 0 when the node has an equal key' do
      expect(Node.new(key: 'f') <=> node).to eql(0)
    end

    it 'is 1 when the node has a "later" key' do
      expect(Node.new(key: 'z') <=> node).to eql(1)
    end
  end # <=>

  describe 'path normalization' do
    context 'given a path which includes the DIRECTORY' do
      let(:node) { SomeDocument.new(path: 'active_document/foo.suffix') }

      it 'the DIRECTORY still gets prepended' do
        expect(node.path).
          to eq(SomeDocument.directory.join('active_document/foo.suffix'))
      end
    end

    context 'given a path in a subdirectory' do
      let(:node) { SomeDocument.new(path: 'special/foo.suffix') }

      it 'does not change the given path' do
        expect(node.path).
          to eq(SomeDocument.directory.join('special/foo.suffix'))
      end
    end

    context 'given a path which contains a subdirectory and no key' do
      let(:node) { SomeDocument.new(path: 'special/foo') }

      it 'does not change the given path' do
        expect(node.path.sub_ext('')).
          to eq(SomeDocument.directory.join('special/foo'))
      end

      it 'adds the file extension' do
        expect(node.path.extname).to eq('.suffix')
      end
    end

    context 'given only a key' do
      let(:node) { SomeDocument.new(path: 'foo') }

      it 'adds the document directory' do
        expect(node.path.to_s).to match(%r{active_document/})
      end

      it 'adds the file extension' do
        expect(node.path.extname).to eq('.suffix')
      end

      it 'sets the filename to equal the key' do
        expect(node.path.basename.sub_ext('').to_s).to eq('foo')
      end
    end

    context 'given an absolute path' do
      let(:node) { SomeDocument.new(path: '/tmp/foo') }

      it 'raises an error' do
        expect { node }.to raise_error(IllegalDirectoryError)
      end
    end
  end # path normalization

end #describe SomeDocument

end #module
