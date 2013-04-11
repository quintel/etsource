def use_fixtures
  copy_fixtures_to_tmp
  stub_directories
end

# copy files to a temporary directory and use this directory as a
# fixtures directory, so were are sure that the fixtures are 'reset'.
def copy_fixtures_to_tmp
  FileUtils.rm_r    "#{ETSource.root}/tmp/fixtures" , force: true
  FileUtils.mkdir_p "#{ETSource.root}/tmp/fixtures"
  FileUtils.cp_r    "#{ETSource.root}/spec/fixtures", "#{ETSource.root}/tmp"
end

# Stub out all the directories of classes that have a DIRECTORY constant
# to use the fixtures directory.
def stub_directories
  ETSource.constants.each do |constant_name|
    if defined?(ETSource.const_get(constant_name)::DIRECTORY)
      directory = ETSource.const_get(constant_name)::DIRECTORY.gsub(/^data\//,'')
      unless directory.match /tmp\/fixtures/
        stub_const("ETSource::#{constant_name}::DIRECTORY",
                   "tmp/fixtures/#{directory}")
      end
    end
  end

  stub_const('ETSource::Util::TOPOLOGY_DIR', 'tmp/fixtures/data/topology')
end
