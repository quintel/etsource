# def use_fixtures
  # copy_fixtures_to_tmp
  # stub_directories
# end

# # copy files to a temporary directory and use this directory as a
# # fixtures directory, so were are sure that the fixtures are 'reset'.
# def copy_fixtures_to_tmp
# end

# # Stub out all the directories of classes that have a DIRECTORY constant
# # to use the fixtures directory.
# def stub_directories
  # ETSource.stub!(:data_dir).
   # and_return(Pathname.new(ETSource.root.join('tmp/fixtures')))
# end

module ETSource
  module Spec
    module Fixtures
      def self.included(klass)
        dir = Pathname.new(ETSource.root.join('tmp/fixtures'))

        klass.around(:each) do |example|
          ETSource.with_data_dir(dir) { example.run }
        end

        klass.before(:each) do
          FileUtils.rm_r(dir, force: true)
          FileUtils.mkdir_p(dir)
          FileUtils.cp_r(ETSource.root.join('spec/fixtures'), dir.parent)
        end
      end
    end # Fixtures
  end # Spec
end # ETSource
