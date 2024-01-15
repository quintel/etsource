source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{ repo_name }/#{ repo_name }" unless repo_name.include?('/')
  "https://github.com/#{ repo_name }.git"
end

gem 'rake'

group :development, :test do
  gem 'roo'
  gem 'atlas',    ref: 'f684c54', github: 'quintel/atlas'
end

group :test do
  gem 'rspec'
  gem 'rspec_junit_formatter'

  gem 'refinery', ref: 'de8e83c', github: 'quintel/refinery'
  gem 'rubel',    ref: 'e36554a', github: 'quintel/rubel'
end
