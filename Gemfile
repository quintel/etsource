source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{ repo_name }/#{ repo_name }" unless repo_name.include?('/')
  "https://github.com/#{ repo_name }.git"
end

gem 'rake'

group :development, :test do
  gem 'roo'
  gem 'atlas',    ref: '726d406', github: 'quintel/atlas'
end

group :test do
  gem 'rspec'
  gem 'rspec_junit_formatter'

  gem 'refinery', ref: '72eacf8', github: 'quintel/refinery'
  gem 'rubel',    ref: 'e36554a', github: 'quintel/rubel'
end
