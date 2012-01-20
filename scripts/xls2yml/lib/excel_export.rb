module ETE
  # Handles the output of excel, that might contain many areas
  #
  class ExcelExport
    def initialize(basepath)
      @root = basepath
    end

    # Returns a list of the areas included in the export file
    def areas
      Dir.glob("#{@root}/*/").map{|a| a.gsub('//', '/')}
    end
  end
end