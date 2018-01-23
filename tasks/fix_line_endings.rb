desc <<-DESC
  Changes CSV files to change line-endings to LF
DESC
task :fix_line_endings do
  Dir.glob('datasets/**/*.csv').each do |filename|
    if (content = File.read(filename)).match(/\r[^\n]/)
      File.write(filename, content.split(/\r/).join("\n"))
    end
  end
end
