ruby '~> 4.0.2'

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{ repo_name }/#{ repo_name }" unless repo_name.include?('/')
  "https://github.com/#{ repo_name }.git"
end

gem 'rake'

group :development, :test do
  gem 'roo'
  gem 'atlas',    ref: 'f0fb6be', github: 'quintel/atlas'
end

group :test do
  gem 'rspec'
  gem 'rspec_junit_formatter'

  gem 'refinery', ref: '36b8e34', github: 'quintel/refinery'
  gem 'rubel',    ref: '9fe7010', github: 'quintel/rubel'
end
