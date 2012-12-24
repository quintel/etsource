module ETSource

class ActiveDocument

  attr_accessor :file_path

  def initialize(file_path, opts = nil)
    self.file_path = @last_saved_file_path = file_path

    opts.each do |key, value|
      self.send("#{key}=", value)
    end unless opts.nil?
  end

  # Returns the key part of the path. Folders and extensions of course are
  # not part of the key.
  #
  # Example:
  #
  #   general/co2/total_co2_emissions.gql returns total_co2_emissions
  #
  def key
    File.basename(file_path, ".#{self.class::FILE_SUFFIX}")
  end

  # Changing the key changes a part of the file_path
  def key=(new_key)
    raise DuplicateKeyError.new(new_key) if self.class.find(new_key)
    raise InvalidKeyError.new(new_key) if new_key == ""
    self.file_path = self.file_path.gsub(key,new_key)
  end

  def self.all
    self.load_directory
  end

  # Return the object with the key if it exists
  # Returns nil if the object is not found
  def self.find(key)
    results = self.all.select { |i| i.key == key }
    raise "Double keys found: #{results.inspect}!" if results.size > 1
    results.first
  end

  def save!
    save_to_file
  end

  def destroy!
    destroy_file
  end

  def to_s
    "<#{self.class}: #{key}>"
  end

  #######
  private
  #######

  # saves it to file
  def save_to_file
    f = File.open(file_path, 'w')
    f.write(file_contents)
    f.close

    delete_old_file unless @last_saved_file_path == file_path
  end

  def delete_old_file
    File.delete(@last_saved_file_path) #delete old file
    @last_saved_file_path = file_path
  end

  # Delete the file
  def destroy_file
    File.delete(file_path)
  end

  # Depending on the format, file_content will be something similar
  # to yaml, or the 'document' style.
  def file_contents
    parser = ETSource::Parser.new(to_hash)
    if self.class::FILE_SUFFIX == 'yml'
      parser.to_yaml
    else
      parser.to_text
    end
  end

  # Creates a hash of the current Object.
  def to_hash
    instance_variables.inject({}) do |hash, var|
      key = var[1..-1].to_sym #take out the leading @
      unless not_exported_variables.include?(key)
        hash[key] = instance_variable_get(var)
      end
      hash
    end
  end

  # Do not export these instance_variables
  def not_exported_variables
    [:file_path, :last_saved_file_path]
  end

  # DEBT: now all objects always get totally read and created. We can
  # optimize this by just loading the keys, until we need more.
  def self.load_directory
    items = []
    Dir.glob("#{ETSource.root}/#{self::DIRECTORY}/**/*.#{self::FILE_SUFFIX}") do |path|
      items << load_from_file(path)
    end
    items
  end

  def self.load_from_file(path)
    parsed_content = ETSource::Parser.new(File.read(path)).to_hash
    new(path, parsed_content)
  end


end #class ActiveDocument
end #module ETSource
