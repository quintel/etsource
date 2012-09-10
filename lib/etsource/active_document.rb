module ETSource

class ActiveDocument

  attr_accessor :file_path

  def initialize(attr_hash = {})
    attr_hash.each do |key,value|
      self.send("#{key}=", value)
    end
  end

  def key
    file_path.split("/").last.split(".").first
  end

  def self.all
    self.load_directory
  end

  def self.find(key)
    self.all.select{|i|i.key == key}.first
  end

  def save
    save_to_file
  end

  def destroy
    destroy_file
  end

  #######
  private
  #######

  # saves it to file
  def save_to_file
    f = File.open('w',file_path)
    f.write(file_contents)
    f.close
  end

  # Delete the file
  def destroy_file
    File.delete(file_path)
  end

  # Depending on the format, file_content will be something similar
  # to yaml, or the 'document' style.
  def file_contents
  end

  # DEBT: now all objects always get totally read and created. We can
  # optimize this by just loading the keys, until we need more.
  def self.load_directory
    items = []
    Dir.glob("#{ETSource.root}/#{self::DIRECTORY}/**/*.{yml,gql}") do |file_path|
      items << load_from_file(file_path)
    end
    items
  end

  def self.load_from_file(file_path)
    parsed_content = ETSource::Parser.new(File.read(file_path)).to_hash
    new(parsed_content.merge({file_path:file_path}))
  end

end #class ActiveDocument
end #module ETSource
