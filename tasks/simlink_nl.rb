desc <<-DESC
  symlinks all missing files and folders from nl default to DESTINATION
DESC

task symlink_nl: :environment do
  raise ArgumentError, 'missing DESTINATION' unless ENV['DESTINATION']
  symlink_base('nl', ENV['DESTINATION'])
end

def symlink_base(source, destination)
  Pathname.glob("datasets/#{source}/**") do |f|
    dest_f = Pathname.new("datasets/#{destination}/#{f.basename}").expand_path
    unless dest_f.exist? || f.basename.to_s.include?('full')
      if f.file?
        FileUtils.ln_sf(f.expand_path, "datasets/#{destination}")
      else
        FileUtils.ln_s(f.expand_path, "datasets/#{destination}")
      end
    end
  end
end
