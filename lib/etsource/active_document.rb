module ETSource

class ActiveDocument

  def initialize(attr_hash)
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
