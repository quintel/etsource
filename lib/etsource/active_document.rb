module ETSource

class ActiveDocument

  def initialize(attr_hash = {})
    attr_hash.each do |key,value|
      self.send("#{key}=", value)
    end
  end

  def self.all
    self.load_directory
  end

  def self.find(key)
    self.all.select{|i|i.key == key}.first
  end

  # saves an instance
  def save
    save_to_file
  end

  # saves it to file
  def save_to_file
    f = File.open('w',file_path)
    f.write(file_contents)
    f.close
  end

  def file_contents
    if FORMAT == 'document'
      ETsource.Parser.new
    end
  end

  def self.load_directory
    items = []
    Dir.glob("#{ETSource.root}/#{directory_store}/**/*.yml") do |yml_file|
      key = yml_file.split("/").last.split(".").first
      items << self.new(YAML.load_file(yml_file).merge({key:key}))
    end
    items
  end

end
end
