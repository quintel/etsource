module ETE
  # The excel export is a collection of directories containing a bunch of files.
  # This objects deals with the single area, ie a first level subfolder of the
  # export
  class ExcelAreaExport
    FileMappings = {
      :groups      => 'groups',
      :converters  => 'converters',
      :carriers    => 'carriers',
      :links       => 'links',
      :sectors     => 'sectors',
      :uses        => 'uses',
      :time_curves => 'timecurves',
      :slots       => 'conversions'
    }

    def initialize(root_path)
      @root = root_path
    end

    def csv_for(key)
      "#{@root}/#{FileMappings[key]}.csv"
    end
  end
end
