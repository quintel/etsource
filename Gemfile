ruby '~> 3.2.7'

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{ repo_name }/#{ repo_name }" unless repo_name.include?('/')
  "https://github.com/#{ repo_name }.git"
end

gem 'rake'

group :development, :test do
  gem 'roo'
<<<<<<< HEAD
  gem 'atlas',         ref: '34f6d2b', github: 'quintel/atlas'
=======
  gem 'atlas',    ref: '10976bd', github: 'quintel/atlas'
>>>>>>> 21c64e7630 (Bump Atlas to quintel/atlas@10976bd)
end

group :test do
  gem 'rspec'
  gem 'rspec_junit_formatter'

  gem 'refinery', ref: 'c39c9b1', github: 'quintel/refinery'
  gem 'rubel',    ref: 'e36554a', github: 'quintel/rubel'
end
