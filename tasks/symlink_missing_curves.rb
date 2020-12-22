desc <<-DESC
  Symlinks all missing curves to DESTINATION dataset. Excludes
  weather years as these are highly dataset specific.
  Example:
  'rake symlink_missing_curves DESTINATION=uk SOURCE=nl'
  adds symlinks for any missing curves in the uk/curves folder
  pointing to the nl/curves folder.
DESC

task symlink_missing_curves: :environment do

  def symlink_files(source, destination)

    Pathname.glob("datasets/#{source}/curves/*.csv") do |f|
      dest_f = Pathname.new("datasets/#{destination}/curves/#{f.basename}").expand_path
      unless dest_f.exist?
        if f.file?
          FileUtils.ln_sf(f.to_s.gsub('datasets', '../..'), "datasets/#{destination}/curves")
        else
          FileUtils.ln_s(f.to_s.gsub('datasets', '../..'), "datasets/#{destination}/curves")
        end
      end
    end
  end

  raise ArgumentError, 'missing DESTINATION' unless ENV['DESTINATION']

  if ENV['SOURCE']
    source = ENV['SOURCE']
  else
    source = ENV['DESTINATION'].gsub(/[^a-zA-Z]/, '')
  end

  puts "Adding missing curves to #{ENV['DESTINATION']} using curves from #{source}"
  symlink_files(source, ENV['DESTINATION'])
end
