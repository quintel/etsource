module ETSource

class Dataset

  attr_accessor :area_code

  def initialize(area_code = 'nl')
    @area_code = area_code
  end

  def converters
    ETSource::Converters.all(area_code)
  end

end

end
