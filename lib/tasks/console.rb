desc "Open an Irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -r #{File.expand_path("../..",__FILE__)}/etsource.rb"
end

desc "Open an Pry session preloaded with this library"
task :pry do
  sh "pry -rubygems -Ilib -r#{File.expand_path("../..",__FILE__)}/etsource.rb"
end
