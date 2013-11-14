desc 'Import ETDataset CSVs from ../etdataset'

desc <<-DESC
  Import ETDataset CSVs from ../etdataset

  Defaults to importing all datasets. Provide an optional DATASET environment
  variable to only import one:

  DATASET=de rake import
DESC
task :import do
  require 'pathname'
  require 'fileutils'

  # Copies the source CSV file to the given +to+ path, converting Windows CRLF
  # line endings to Unix LF.
  def cp_csv(from, to)
    to = to.join(from.basename) if to.directory? || ! to.to_s.match(/\.csv$/)
    File.write(to, File.read(from).gsub(/\r\n/, "\n"))
  end

  if ENV['DATASET']
    datasets = [Pathname.new("../etdataset/data/#{ ENV['DATASET'].downcase }")]
  else
    datasets = Pathname.new('../etdataset/data').children.select(&:directory?)
  end

  datasets.each do |source|
    dest = Pathname.new("datasets/#{ source.basename }")
    name = dest.basename.to_s.upcase
    csvs = Pathname.glob(source.join('*/*/output/*.csv'))

    %w( demands efficiencies shares time_curves ).each do |dir|
      # Remove the old files, some of which may no longer exist in ETDataset.
      Pathname.glob(dest.join("#{ dir }/*.csv")).each(&FileUtils.method(:rm))

      # Just in case the user deleted them...
      FileUtils.mkdir_p(dest.join(dir))
    end

    count = csvs.select.with_index do |csv, index|
      case csv.basename('.csv').to_s
      when /efficiency$/
        cp_csv(csv, dest.join('efficiencies'))
      when /(?:parent|child)_share$/
        cp_csv(csv, dest.join('shares'))
      when /time_curve$/
        cp_csv(csv, dest.join('time_curves'))
      when /^metal_demands/
        cp_csv(csv, dest.join('demands/metal_demands.csv'))
      when /^primary_production/
        cp_csv(csv, dest.join('primary_production.csv'))
      when /^corrected_energy_balance_step_2/
        cp_csv(csv, dest.join('energy_balance.csv'))
      when /^central_electricity_production_step_2/
        cp_csv(csv, dest.join('central_producers.csv'))
      end
    end # each csv

    puts "Imported #{ count.length } CSVs for #{ name }"
  end # each dataset
end # import

desc <<-DESC
  Open a pry or irb session preloaded with Atlas

  This is an alias for the :console task in Atlas, and requires that ETSource,
  Atlas all have a common parent directory:

  - Code
    - atlas
    - etsource
DESC
task :console do
  directory = File.dirname(File.expand_path(__FILE__))

  cd '../atlas'
  exec "bundle exec rake 'console[#{ directory }]'"
end
