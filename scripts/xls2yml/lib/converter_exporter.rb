
module ETE
  class ConverterExporter
    # Attributes we're reading from the CSV file. We discard the others

    # converter_id;name;key;use_id;sector_id;energy_balance_group_id;co2_free;preset_demand;demand_expected_value;
    # network_capacity_available_in_mw;network_capacity_used_in_mw;technical_lifetime;
    # decrease_in_nominal_capacity_over_lifetime;construction_time;costs_per_mj;
    # network_expansion_costs_in_euro_per_mw;ccs_investment_per_mw_input;
    # ccs_operation_and_maintenance_cost_per_full_load_hour;typical_nominal_input_capacity;decommissioning_costs_per_mw_input;
    # full_load_hours;residual_value_per_mw_input;operation_and_maintenance_cost_fixed_per_mw_input;
    # wacc;operation_and_maintenance_cost_variable_per_full_load_hour;land_use_per_unit;installing_costs_per_mw_input;purchase_price_per_mw_input;economic_lifetime;part_ets;simult_sd;simult_se;simult_wd;simult_we;peak_load_units_present;availability;variability;;;;;;;;;;;;;;;;;
    ATTRIBUTES = [
      :co2_free,
      :preset_demand,
      :demand_expected_value,
      :network_capacity_available_in_mw,
      :network_capacity_used_in_mw,
      :technical_lifetime,
      :decrease_in_nomimal_capacity_over_lifetime,
      :construction_time,
      :costs_per_mj,
      :network_expansion_costs_in_euro_per_mw,
      :ccs_investment_per_mw_input,
      :ccs_operation_and_maintenance_cost_per_full_load_hour,
      :typical_nominal_input_capacity,
      :decommissioning_costs_per_mw_input,
      :full_load_hours,
      :residual_value_per_mw_input,
      :operation_and_maintenance_cost_fixed_per_mw_input,
      :wacc,
      :operation_and_maintenance_cost_variable_per_full_load_hour,
      :land_use_per_unit,
      :installing_costs_per_mw_input,
      :purchase_price_per_mw_input,
      :economic_lifetime,
      :part_ets,
      :simult_sd,
      :simult_se,
      :simult_wd,
      :simult_we,
      :peak_load_units_present,
      :availability,
      :variability,
      :decrease_in_nominal_capacity_over_lifetime
    ]

    def initialize(excel_export)
      @excel_export = excel_export
      build_converters
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
    #   info: key; full_key; sector; use; energy_balance_group; groups
    #  converter_key_2:
    #    ...
    #
    def export
      # let's first collect all the items, individually grouped by converter
      # full_key

      converter_data                = parse_converters
      converter_groups              = parse_converter_groups
      # converter_info needs this list, so let's make it available
      @cached_converter_groups      = converter_groups
      converter_info                = parse_converter_info
      slot_data                     = parse_slots
      link_data                     = parse_links
      links_without_share_data      = parse_links(false)
      slots_without_conversion_data = parse_slots(false)

      out = {}
      converters.values.each do |converter_key|
        out[converter_key] = {
          :attributes               => converter_data[converter_key],
          :slots                    => slot_data[converter_key],
          :slots_without_conversion => slots_without_conversion_data[converter_key],
          :links                    => link_data[converter_key],
          :links_without_share      => links_without_share_data[converter_key],
          :info                     => converter_info[converter_key],
          :groups                   => converter_groups[converter_key]
        }
      end
      out
    end

    # this builds the converter string used in export.graph
    def parse_converter_info
      out = {}
      CSV.new(@excel_export.csv_for(:converters)).parse do |row|
        key = row[:key]
        use_id = row[:use_id].to_i
        use    = uses[use_id]
        sector_id = row[:sector_id].to_i
        sector    = sectors[sector_id]
        energy_balance_group_id = row[:energy_balance_group_id].to_i
        energy_balance_group    = energy_balance_groups[energy_balance_group_id]

        if use == 'undefined'
          full_key = "#{key}_#{sector}".to_sym
        else
          full_key = "#{key}_#{sector}_#{use}".to_sym
        end

        groups = @cached_converter_groups[full_key].compact.join(',') if @cached_converter_groups[full_key].is_a?(Array)
        string = "#{full_key};\t#{key};\t#{sector};\t#{use};#{energy_balance_group};\t#{groups}"
        out[full_key] = string
      end
      out
    end

    def parse_converters
      out = {}
      f = CSV.new(@excel_export.csv_for(:converters))
      f.parse do |row|
        converter_id = row[:converter_id].to_i
        key = converters[converter_id]
        conv_attrs = {}
        ATTRIBUTES.each do |attr|
          conv_attrs[attr] = row[attr].to_f if row[attr]
        end
        conv_attrs[:demand] = conv_attrs[:preset_demand] if conv_attrs[:preset_demand]
        out[key] = conv_attrs
      end
      out
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
    #   - converter-(carrier): {conversion: 1.00}  # for inputs
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
            out[converter] << "#{converter}-(#{carrier}): {conversion: #{row[:input].to_f}}"
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
        share = row[:share].nil? ? nil : row[:share].to_f
        out[parent] ||= []
        if include_share
          out[parent] << "#{parent}-(#{carrier}) -- #{link_type} --> (#{carrier})-#{child}: {share: #{share || 'nil'}}"
        else
          out[parent] << "#{parent}-(#{carrier}) -- #{link_type} --> (#{carrier})-#{child}"
        end
      end
      out
    end

    # Most CSV files use object ids and export using the object key.
    # These methods create a fast lookup map
    #

    def converters
      @_converters ||= build_converters
    end

    private

    # creates a hash in the format
    # converter.id => converter.full_key (including used and sector)
    #
    def build_converters
      out = {}
      CSV.new(@excel_export.csv_for(:converters)).parse do |row|
        key = row[:key]
        use_id    = row[:use_id].to_i
        sector_id = row[:sector_id].to_i
        full_key = "#{key}_#{sectors[sector_id]}_#{uses[use_id]}".to_sym
        out[row[:converter_id].to_i] = full_key.to_sym
      end
      out
    end

    def carriers(id)
      @_carriers ||= build_carriers
      c = @_carriers[id]
      raise "Missing carrier! #{c} ##{id}" if !c || !predefined_carriers.include?(c.to_sym)
      c
    end

    def build_carriers
      out = {}
      CSV.new(@excel_export.csv_for(:carriers)).parse do |row|
        out[row[:carrier_id].to_i] = row[:key]
      end
      out
    end

    # To prevent using bad carrier names let's compare the string we want to use
    # with those defined in datasets/nl/carriers.yml. It would be nicer to use a
    # generic locations such as datasets/_defaults or something similar
    def predefined_carriers
      full_yaml = File.read('../../datasets/_defaults/carriers.yml') + "\n" +
                  File.read('../../datasets/nl/carriers.yml')
      @predefined_carriers ||= YAML::load(full_yaml)[:carriers].keys
    end

    def uses
      @_uses ||= build_uses
    end

    def build_uses
      out = {}
      CSV.new(@excel_export.csv_for(:uses)).parse do |row|
        out[row[:id].to_i] = row[:use]
      end
      out
    end

    def sectors
      @_sectors ||= build_sectors
    end

    def build_sectors
      out = {}
      CSV.new(@excel_export.csv_for(:sectors)).parse do |row|
        out[row[:id].to_i] = row[:sector]
      end
      out
    end

    def groups
      @_groups ||= build_groups
    end

    def build_groups
      out = {}
      CSV.new(@excel_export.csv_for(:groups)).parse do |row|
        out[row[:id].to_i] = row[:key]
      end
      out
    end

    def energy_balance_groups
      @_energy_balance_groups ||= build_energy_balance_groups
    end

    def build_energy_balance_groups
      out = {}
      CSV.new(@excel_export.csv_for(:energy_balance_groups)).parse do |row|
        out[row[:group_id].to_i] = row[:name]
      end
      out
    end
  end
end
