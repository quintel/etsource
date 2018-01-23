task :environment do
  require 'bundler'
  require 'dotenv/load'
  require 'pathname'

  require 'fileutils'
  require 'yaml'
  require_relative './../helpers/encrypt_balance'

  Bundler.require(:development)
  Dotenv.load('../.env', '../.env.default')

  Atlas.data_dir = File.expand_path(File.dirname(__FILE__).parent)

  puts Atlas.data_dir
end

