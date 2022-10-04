desc <<-DESC
  Changes CSV files to change line-endings to LF
DESC
task fix_line_endings: :environment do
  dataset = ENV['DATASET'] ? "#{ENV['DATASET']}/" : '**'

  Dir.glob("#{Atlas.data_dir}/datasets/#{dataset}**/*.csv").each do |filename|
    content = File.read(filename)

    if content.match(/\r(?:\n)/) || content.start_with?("\xEF\xBB\xBF")
      content.sub!(/^\xEF\xBB\xBF/, '')
      File.write(filename, content.split.join("\n"))
    end
  end
end
