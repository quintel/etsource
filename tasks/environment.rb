ETSOURCE_PATH  = File.expand_path(`pwd`.strip).freeze
ETDATASET_PATH = ETSOURCE_PATH.sub('etsource', 'etdataset').freeze

task :environment do
  require 'bundler'
  require 'pathname'

  require 'fileutils'
  require 'yaml'
  require_relative './../helpers/encrypt_balance'

  Bundler.require(:development)

  Atlas.data_dir = ETSOURCE_PATH
end

