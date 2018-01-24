task :environment do
  require 'bundler'
  require 'dotenv/load'
  require 'pathname'

  require 'fileutils'
  require 'yaml'
  require_relative './../helpers/encrypt_balance'

  Bundler.require(:development)

  root = File.expand_path(`pwd`.strip).freeze

  ETDATASET_PATH = root.sub('etsource', 'etdataset')

  Atlas.data_dir = root
end

