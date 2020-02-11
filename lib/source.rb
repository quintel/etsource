class Source
  # etdata_path is false when no path available
  attr_reader :etdata_path
  attr_reader :year

  def initialize(base_path, country, year)
    @country, @year, @base_path = country, year.to_i, base_path
  end

  def etdata_path
    if nonexisting_country_path?
      return false
    elsif nonexisting_year_path?
      try_other_years(country_path) || false
    else
      year_path.join("output/").exist? ? year_path.join("output/") : false
    end
  end

  def country_path
    @country_path ||= @base_path.join(@country + "/")
  end

  def year_path(year=@year)
    country_path.join("#{year}/")
  end

  # After three years (future and past) the data is deemed outdated.
  # Unavailable paths will eventually be symlinked by the CurveImporter
  # to NLdefault instead of copied from Source
  def try_other_years(country_path)
    [1, -1, 2, -2, 3, -3].map { |y| year_path(@year + y).join("output/") }
                         .detect(&:exist?)
  end

  def files
    etdata_path.children(false).map{ | child | etdata_path.join(child) } if etdata_path
  end

  private
  def nonexisting_country_path?
    !country_path.directory?
  end

  def nonexisting_year_path?
    !year_path.directory?
  end

end
