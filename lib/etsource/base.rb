module ETSource
  # Parent directory where all the 'models' live
  # such as inputs, gqueries etc.
  def self.root
    File.expand_path('../../..',__FILE__)
  end

  # Public: Path to the directory in which ActiveDocument files typically
  # reside. This will normally have subfolders like datasets/, nodes/, etc.
  #
  # Returns a Pathname.
  def self.data_dir
    @data_dir ||= Pathname.new(root).join('data')
  end

  # Public: Wrap around a block of code to work with a temporarily altered
  # +data_dir+ setting.
  #
  # directory - The new, but temporary, data_dir path.
  #
  # Returns the result of your block.
  def self.with_data_dir(directory)
    previous  = data_dir
    @data_dir = Pathname.new(directory)

    yield
  ensure
    @data_dir = previous
  end
end # ETSource
