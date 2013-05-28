source "https://rubygems.org"
ruby "1.9.3"

group :development, :test do
  gem 'refinery', git: 'git@github.com:quintel/refinery.git'
end

group :test do
  gem 'rspec'
  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-fsevent', '~> 0.9.1'
  gem 'simplecov'
  gem 'shoulda-matchers'

  # Growl notifications in Guard.
  gem 'ruby_gntp', require: false
end

gemspec
