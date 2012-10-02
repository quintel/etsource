module ETE
  class ConverterExporter
    # Attributes we're reading from the CSV file. We discard the others

    ATTRIBUTES = [
      :availability,
      :average_effective_output_of_nominal_capacity_over_lifetime,
      :ccs_investment_per_mw_input,
      :ccs_operation_and_maintenance_cost_per_full_load_hour,
      :co2_free,
      :construction_time,
      :costs_per_mj,
      :decommissioning_costs_per_mw_input,
      :decrease_in_nominal_capacity_over_lifetime,
      :demand_expected_value,
      :economic_lifetime,
      :electrical_efficiency_when_using_coal,
      :electrical_efficiency_when_using_wood_pellets,
      :forecasting_error,
      :full_load_hours,
      :households_supplied_per_unit,
      :installing_costs_per_mw_input,
      :land_use_per_unit,
      :max_demand,
      :network_capacity_available_in_mw,
      :network_capacity_used_in_mw,
      :network_expansion_costs_in_euro_per_mw,
      :operation_and_maintenance_cost_fixed_per_mw_input,
      :operation_and_maintenance_cost_variable_per_full_load_hour,
      :part_ets,
      :part_load_efficiency_penalty,
      :part_load_operating_point,
      :peak_load_units_present,
      :preset_demand,
      :purchase_price_per_mw_input,
      :residual_value_per_mw_input,
      :simult_sd,
      :simult_se,
      :simult_wd,
      :simult_we,
      :simult_supply,
      :technical_lifetime,
      :typical_effective_input_capacity,
      :typical_nominal_input_capacity,
      :variability,
      :wacc,
      :electricity_output_capacity,
      :heat_output_capacity
    ]

    def initialize(excel_export, opts = {})
      @excel_export = excel_export
      @etsource_root = opts[:etsource_root] || File.expand_path("#{File.dirname(__FILE__)}/../../../")
      converters # cache converter keys immediately
    end

    # returns a giant hash in this format:
    #
    # converter_key_1:
    #   attributes:
    #      co2_free: 12345
    #      ...
    #   slots:
    #      - (loss)-heatpump_addon: {conversion: 0.0}
    #      ...
    #   slots_without_conversion:
    #      - (loss)-heatpump_addon
    #      ...
    #   links:
    #      - coal_distribution-(coal) -- i --> (coal)-coal_export: {share: 0.0}
    #      ...
    #   links_without_share:
    #      - coal_distribution-(coal) -- i --> (coal)-coal_export
    #      ...
    #   info: key; _key; sector; use; energy_balance_group; groups
    #  converter_key_2:
    #    ...
    #
    def export
      # let's first collect all the items, individually grouped by converter key

      converter_groups              = parse_converter_groups
      # converter_info needs this list, so let's make it available
      @cached_converter_groups      = converter_groups
      converter_info                = parse_converter_info
      sector_keys                   = parse_sector_key
      slot_data                     = parse_slots
      link_data                     = parse_links
      links_without_share_data      = parse_links(false)
      slots_without_conversion_data = parse_slots(false)

      out = {}
      converters.values.each do |converter_key|
        out[converter_key] = {
          :attributes               => converter_attributes[converter_key],
          :slots                    => slot_data[converter_key],
          :slots_without_conversion => slots_without_conversion_data[converter_key],
          :links                    => link_data[converter_key],
          :links_without_share      => links_without_share_data[converter_key],
          :info                     => converter_info[converter_key],
          :sector                   => sector_keys[converter_key],
          :groups                   => converter_groups[converter_key]
        }
      end
      out
    end

    # this builds a lookup hash for sector keys.
    def parse_sector_key
      out = {}
      CSV.new(@excel_export.csv_for(:converters)).parse do |row|
        key       = row[:key].to_sym
        sector_id = row[:sector_id].to_i
        sector    = sectors[sector_id]
        out[key]  = sector
      end
      out
    end

    # this builds the converter string used in export.graph
    def parse_converter_info
      out = {}
      CSV.new(@excel_export.csv_for(:converters)).parse do |row|
        key       = row[:key].to_sym
        use_id    = row[:use_id].to_i
        use       = uses[use_id]
        sector_id = row[:sector_id].to_i
        sector    = sectors[sector_id]
        energy_balance_group_id = row[:energy_balance_group_id].to_i
        energy_balance_group    = energy_balance_groups[energy_balance_group_id]

        out[key] = {
          :sector => sector,
          :use => use,
          :energy_balance_group => energy_balance_group
        }
      end
      out
    end

    # memoized hash of the converter attributes
    #
    def converter_attributes
      unless @_converter_attributes
        @_converter_attributes = {}
        CSV.new(@excel_export.csv_for(:converters)).parse do |row|
          converter_id = row[:converter_id].to_i
          key = converters[converter_id]
          attrs = {}
          ATTRIBUTES.each do |attr|
            attrs[attr] = row[attr].to_f if row[attr]
          end
          # Copying peak_load_units_present to peak_load_units
          # https://github.com/dennisschoenmakers/etengine/issues/386
          attrs[:peak_load_units] = attrs[:peak_load_units_present] if attrs[:peak_load_units_present]
          @_converter_attributes[key] = attrs
        end
      end
      @_converter_attributes
    end

    def parse_converter_groups
      out = {}
      f = CSV.new(@excel_export.csv_for(:converter_groups))
      f.parse do |row|
        group_id = row[:definition_id].to_i
        converter_id = row[:converter_id].to_i

        key = converters[converter_id]
        out[key] ||= []
        out[key] << groups[group_id]
      end
      out
    end

    # This will generate a hash in the format
    #
    # converter_full_key:
    #   - (carrier)-converter: {conversion: 1.00}, # for outputs
    #   - converter-(carrier): {conversion: 1.00[, reset_to_zero: true]} # inputs
    #
    def parse_slots(include_conversion = true)
      out = {}
      CSV.new(@excel_export.csv_for(:slots)).parse do |row|
        converter_id = row[:converter_id].to_i
        converter    = converters[converter_id]
        carrier_id   = row[:carrier_id].to_i
        carrier      = carriers(carrier_id)
        out[converter] ||= []

        if row[:input]
          if include_conversion
            s = "#{converter}-(#{carrier}): {conversion: #{row[:input].to_f}"
            s += ", reset_to_zero: true" if row[:reset_to_zero].to_i == 1
            s += "}"
            out[converter] << s
          else
            out[converter] << "#{converter}-(#{carrier})"
          end
        end
        if row[:output]
          if include_conversion
            out[converter] << "(#{carrier})-#{converter}: {conversion: #{row[:output].to_f}}"
          else
            out[converter] << "(#{carrier})-#{converter}"
          end
        end
      end
      out
    end

    # generates lines in the format
    # converter-(carrier) -- link_type --> (carrier)-converter: {share: 1.234}
    #
    def parse_links(include_share = true)
      out = {}
      CSV.new(@excel_export.csv_for(:links)).parse do |row|
        parent = converters[row[:parent_id].to_i]
        child  = converters[row[:child_id].to_i]
        carrier = carriers( row[:carrier_id].to_i )
        link_type = case row[:link_type].to_i
        when 1 then 's'
        when 2 then 'd'
        when 3 then 'f'
        when 4 then 'c'
        when 5 then 'i'
        end
        unless child
          raise "Error parsing link, missing child converter! " +
            "parent: #{parent}, " +
            "child_id: #{row[:child_id]}, " +
            "carrier: #{carrier}, " +
            "link_type: #{link_type}"
        end
        out[parent] ||= []
        if include_share
          share = row[:share].nil? ? nil : row[:share].to_f
          priority = row[:priority]
          # the max demand attribute is defined in the converter export csv.
          # right side converter
          max_demand = converter_attributes[child][:max_demand]
          s = "#{parent}-(#{carrier}) -- #{link_type} --> (#{carrier})-#{child}: {"
          attrs = []
          attrs << "share: #{share}" if share
          # attrs << "max_demand: #{max_demand}" if max_demand
          attrs << "priority: #{priority}" if priority
          s += attrs.join(", ")
          s +="}"
          out[parent] << s
        else
          out[parent] << "#{parent}-(#{carrier}) -- #{link_type} --> (#{carrier})-#{child}"
        end
      end
      out
    end

    # Most CSV files use object ids and export using the object key.
    # These methods create a fast lookup map
    #

    # creates a hash in the format
    # converter.id => converter.key (including used and sector)
    #
    def converters
      unless @_converters
        @_converters = {}
        CSV.new(@excel_export.csv_for(:converters)).parse do |row|
          key = row[:key].to_sym
          @_converters[row[:converter_id].to_i] = key
        end
      end
      @_converters
    end

    private

    def carriers(id)
      unless @_carriers
        @_carriers = {}
        CSV.new(@excel_export.csv_for(:carriers)).parse do |row|
          @_carriers[row[:carrier_id].to_i] = row[:key]
        end
      end
      c = @_carriers[id]
      raise "Missing carrier! #{c} ##{id}" if !c || !predefined_carriers.include?(c.to_sym)
      c
    end

    # To prevent using bad carrier names let's compare the string we want to use
    # with those defined in datasets/nl/carriers.yml. It would be nicer to use a
    # generic locations such as datasets/_defaults or something similar
    def predefined_carriers
      return @predefined_carriers if @predefined_carriers
      defaults = YAML::load File.read("#{@etsource_root}/datasets/_defaults/carriers/defaults.yml")
      nl_carriers = YAML::load File.read("#{@etsource_root}/datasets/nl/carriers.yml")
      @predefined_carriers = (defaults.merge(nl_carriers[:carriers])).keys
    end

    def uses
      unless @_uses
        @_uses = {}
        CSV.new(@excel_export.csv_for(:uses)).parse do |row|
          @_uses[row[:id].to_i] = row[:use]
        end
      end
      @_uses
    end

    def sectors
      unless @_sectors
        @_sectors = {}
        CSV.new(@excel_export.csv_for(:sectors)).parse do |row|
          @_sectors[row[:id].to_i] = row[:sector]
        end
      end
      @_sectors
    end

    def groups
      unless @_groups
        @_groups = {}
        CSV.new(@excel_export.csv_for(:groups)).parse do |row|
          @_groups[row[:id].to_i] = row[:key]
        end
      end
      @_groups
    end

    def energy_balance_groups
      unless @_energy_balance_groups
        @_energy_balance_groups = {}
        CSV.new(@excel_export.csv_for(:energy_balance_groups)).parse do |row|
          @_energy_balance_groups[row[:group_id].to_i] = row[:name]
        end
      end
      @_energy_balance_groups
    end
  end
end
