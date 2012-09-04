require_relative '../lib/etsource.rb'

require 'fileutils'
require 'yaml'

def copy_fixtures_to_tmp
  # copy files to a temporary directory and use this directory as a
  # fixtures directory
  FileUtils.rm_r  "#{ETSource.root}/tmp/fixtures" , force: true
  FileUtils.mkdir "#{ETSource.root}/tmp/fixtures"
  FileUtils.cp_r  "#{ETSource.root}/spec/fixtures", "#{ETSource.root}/tmp"
end
