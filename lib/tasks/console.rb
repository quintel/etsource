namespace :console do
  task :run do
    command = system("which pry > /dev/null 2>&1") ? 'pry' : 'irb'
    exec "#{ command } -I./lib -r./lib/etsource.rb"
  end
end

desc 'Open a pry or irb session preloaded with Turbine'
task console: ['console:run']
