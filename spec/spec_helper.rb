require 'fileutils'
require 'yaml'

require 'support/coverage' if ENV['COVERAGE']
require 'support/fixtures'

require_relative '../lib/etsource.rb'
