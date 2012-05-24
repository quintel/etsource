module ETE
  class Processor
    def initialize(opts = {})
      source_dir = opts[:source]
      @etsource_dir = opts[:dest]
      @export = ExcelExport.new(source_dir)
    end
    
    # This is the main action
    #
    def export_all
      @export.areas.each do |area_path|
        puts yellow("Processing #{area_path}")
        # create the destination directory
        area_code = area_path.split('/')[-1]
        destination_directory = "#{@etsource_dir}/datasets/#{area_code}".gsub('//', '/')

        unless File.directory?(destination_directory)
          puts "  Creating #{destination_directory}"
          Dir::mkdir(destination_directory)
        end

        @area_export = ExcelAreaExport.new(area_path)
        export_converters(@area_export, destination_directory)
        export_time_curves(@area_export, destination_directory)

        if @area_export.country == 'nl'
          export_topology(@area_export)
          export_excel_ids(@area_export)
        end
      end
    rescue Exception => e
      puts red("Export error: #{e}")
      puts "#{e.backtrace[0]}"
      puts "Current file: #{$current_file}"
      exit
    end
    
    private

    # writes to ETSOURCE/datasets/<area>/graph/export.yml
    def export_converters(export, destination_directory)
      converter_exporter = ConverterExporter.new(export)
      raw = converter_exporter.export
      lines = []
      current_converter_key = nil
      raw.each_pair do |converter_key, values|
        current_converter_key = converter_key
        lines << ":#{converter_key}:"
        values[:attributes].each_pair do |attr, val|
          lines << "  :#{attr}: #{val}"
        end
        values[:slots].each {|slot| lines << slot}
        values[:links].each {|link| lines << link} if values[:links]
        lines << ''
      end
      FileUtils.mkdir_p "#{destination_directory}/graph"
      dest_file = "#{destination_directory}/graph/export.yml"
      puts "  Saving converters to #{dest_file}"
      File.open(dest_file, 'w') {|f| f.write(lines.join("\n"))}
    rescue Exception => e
      raise "Error exporting converter #{current_converter_key}: #{e}"
    end


    # writes to ETSOURCE/datasets/<area>/time_curves.yml
    def export_time_curves(export, destination_directory)
      csv = export.csv_for(:time_curves)
      f = CSV.new(csv)
      out = {}
      f.parse do |row|
        converter_id = row[:converter_id].to_i
        value_type   = row[:value_type]
        year         = row[:year].to_i
        value        = row[:value].to_f
        out[converter_id] ||= {}
        out[converter_id][value_type] ||= {}
        out[converter_id][value_type][year] = value
      end
      dest_file = "#{destination_directory}/time_curves.yml"
      puts "  Saving timecurves to #{dest_file}"
      File.open(dest_file, 'w') do |f|
        out = {'time_curves' => out}.to_yaml
        out = out.gsub("---\n", "") # get rid of the initial ---
        f.write(out)
      end
    end

    # writes to ETSOURCE/topology/export.graph
    def export_topology(area_export)
      puts "Generating shared topology"
      converter_exporter = ConverterExporter.new(area_export)
      raw = converter_exporter.export
      FileUtils.mkdir_p "#{@etsource_dir}/topology"
      dest_file = "#{@etsource_dir}/topology/export.graph"
      puts "  Topology file: #{dest_file}"
      lines = []
      raw.each_pair do |key, values|
        lines << values[:info]
        values[:links_without_share].each do |link|
          lines << link
        end if values[:links_without_share].is_a?(Array)
        values[:slots_without_conversion].each do |slot|
          lines << slot
        end if values[:slots_without_conversion].is_a?(Array)
        lines << []
      end
      File.open(dest_file, 'w') {|f| f.write(lines.join("\n"))}
    end

    # writes to ETSOURCE/datasets/_default/graph/export.yml
    def export_excel_ids(area_export)
      output_file = "#{@etsource_dir}/datasets/_defaults/graph/excel_ids.yml"
      puts "  Generating excel ids in #{output_file}"
      converter_exporter = ConverterExporter.new(area_export)
      raw = converter_exporter.converters
      lines = []
      raw.each_pair do |excel_id, key|
        excel_id =
        lines << "#{key}: {excel_id: #{excel_id}}"
      end
      File.open(output_file, 'w') {|f| f.write(lines.join("\n"))}
    end
  end
end
