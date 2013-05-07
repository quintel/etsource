require 'fileutils'
require 'yaml'

require 'support/coverage' if ENV['COVERAGE']
require 'support/fixtures'

require_relative '../lib/etsource.rb'

require 'shoulda-matchers'

RSpec.configure do |config|
  # Use only the new "expect" syntax.
  config.expect_with(:rspec) { |c| c.syntax = :expect }

  # Tries to find examples / groups with the focus tag, and runs them. If no
  # examples are focues, run everything. Prevents the need to specify
  # `--tag focus` when you only want to run certain examples.
  config.filter_run(focus: true)
  config.run_all_when_everything_filtered = true

  # Allow adding examples to a filter group with only a symbol.
  config.treat_symbols_as_metadata_keys_with_true_values = true

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  # Use a (safe) copy of spec/fixtures as the data-source when the "fixtures"
  # metadata is set on a spec group or example.
  config.include ETSource::Spec::Fixtures, fixtures: true
end
