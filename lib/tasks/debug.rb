namespace :debug do
  def silence_stream(stream)
    old_stream = stream.dup
    stream.reopen(RbConfig::CONFIG['host_os'] =~ /mswin|mingw/ ? 'NUL:' : '/dev/null')
    stream.sync = true
    yield
  ensure
    stream.reopen(old_stream)
  end

  desc 'Output before and after diagrams of the transport subgraph.'
  task :transport do
    $LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + '/..'))
    require 'etsource'

    runner = ETSource::Runner.new(ETSource::Dataset.find(:nl), :transport)
    exception = nil

    puts 'Setting up graph structure... '
    runner.graph

    print 'Setting up Refinery graph... '

    silence_stream(STDOUT) do
      Refinery::Diagram::Calculable.new(runner.refinery_graph).
        draw_to(ETSource.root.join('tmp').join('before.png'))
    end

    puts 'output to tmp/before.png'

    print 'Performing Refinery calculations... '

    begin
      runner.calculate
    rescue Refinery::IncalculableGraphError => ex
      print '(incalculable graph) '
      exception = ex
    end

    Refinery::Diagram::Calculable.new(runner.refinery_graph).
      draw_to(ETSource.root.join('tmp').join('after.png'))

    puts 'output to tmp/after.png'

    if exception
      puts
      puts exception.message
    end
  end # task :transport
end # namespace :debug
