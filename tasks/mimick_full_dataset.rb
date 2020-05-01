desc <<-DESC
  symlinks all missing files and folders to DATASET (eg nl2020) and sets
  up a mimicked full file
DESC

task mimick_full_dataset: :environment do

  def symlink_files(source, destination)
    FileUtils.mkdir_p "datasets/#{destination}"

    Pathname.glob("datasets/#{source}/**") do |f|
      dest_f = Pathname.new("datasets/#{destination}/#{f.basename}").expand_path
      unless dest_f.exist? || f.basename.to_s.include?('full')
        if f.file?
          FileUtils.ln_sf(f.to_s.gsub('datasets', '..'), "datasets/#{destination}")
        else
          FileUtils.ln_s(f.to_s.gsub('datasets', '..'), "datasets/#{destination}")
        end
      end
    end
  end

  def mimick_full(source, destination)
    full = File.read(full_path(source))

    new_id = Atlas::Dataset.all.map(&:id).max + 1
    parent_id = full.lines[3].gsub(/\D/, '')

    adjusted_data =
      "- area = #{destination}
       - group = country
       - id = #{new_id}
       - parent_id = #{parent_id}
       - enabled.etengine = true
       - enabled.etmodel = false
       - analysis_year = #{destination.gsub(/\D/, '')}\n"

    full = adjusted_data.gsub(/\s+-/, "\n-") + full.lines[7..-1].join
    File.write(full_path(destination), full)
  end

  def full_path(dataset)
    Pathname.new("datasets/#{dataset}/#{dataset}.full.ad").expand_path
  end

  raise ArgumentError, 'missing DATASET' unless ENV['DATASET']
  base = ENV['DATASET'].gsub(/[^a-zA-Z]/, '')
  puts "Mimicking using base #{base}"
  symlink_files(base, ENV['DATASET'])
  mimick_full(base, ENV['DATASET'])
  puts "\e[32mDo not forget to add your mimicked datasets to the list in
        spec/full_mimicks_spec.rb to keep it up to date\e[0m"
end
