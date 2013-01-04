# More info at https://github.com/guard/guard#readme

guard 'rspec' do
  # library
  watch('lib/etsource.rb')           { "spec" }
  watch(%r{^lib/etsource/(.+)\.rb$}) { "spec" }

  # specs
  watch('spec/spec_helper.rb')       { "spec" }
  watch(%r{^spec/.+_spec\.rb$})

  # fixtures
  watch(%r{^spec/fixtures/(.+)})     { "spec" }
end
