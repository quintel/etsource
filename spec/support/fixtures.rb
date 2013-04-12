module ETSource
  module Spec
    # Included into RSpec examples and groups when they ask for it. Changes
    # the fixture directory and creates a copy of the fixtures.
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
