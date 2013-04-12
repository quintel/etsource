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
  ETSource.stub!(:data_dir).
   and_return(Pathname.new(ETSource.root.join('tmp/fixtures')))
end
