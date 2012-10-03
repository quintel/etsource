module ETE
  # Creates the string for representing a Slot in the YAML data.
  class SlotExporter
    attr_reader :converter_key

    # Public: Given slot data, returns an array containing the exported input
    # and output slots. When input or output conversions are not present, the
    # respective slot will be omitted.
    #
    # data               - A hash containing CSV data for the slot.
    # converter_exporter - The ConverterExporter which created the slot
    #                      exporter.
    #
    # Returns an array of SlotExporters, one for each slot matched in the
    # data.
    #
    def self.multiple(data, converter_exporter)
      [ :input, :output ].reject { |k| data[k].nil? }.map do |direction|
        SlotExporter.new(direction, data, converter_exporter)
      end
    end

    # Public: Tests if the given converter attributes include carrier
    # efficiency data.
    #
    # carrier    - The carrier key.
    # attributes - The parsed converter attributes.
    #
    # Returns true or false.
    #
    def self.carrier_efficient?(carrier, attributes)
      efficiency_attributes =
        ConverterExporter::EFFICIENCY_ATTRIBUTES[carrier]

      flat_data = efficiency_attributes && efficiency_attributes.any? do |key|
        attributes[key] && ! attributes[key].zero?
      end

      flat_data || (
        # Carrier efficiency data may have already been transformed into a
        # hash-string:
        attributes[:carrier_efficiency] &&
        attributes[:carrier_efficiency] =~ /#{ carrier }:/)
    end

    # Public: Creates a new SlotExporter. You probably want to use
    # SlotExporter.multiple rather than this method.
    #
    # direction - A symbol indicating if this is an :input or :output slot.
    # data      - The parsed CSV data for the slot.
    #
    # Returns the slot exporter instance.
    #
    def initialize(direction, data, converter_exporter)
      @direction     = direction
      @data          = data

      converter_id   = @data.fetch(:converter_id).to_i
      carrier_id     = @data.fetch(:carrier_id).to_i

      @converter_key = converter_exporter.converters[converter_id]
      @carrier_key   = converter_exporter.carriers(carrier_id)

      @converter_data =
        converter_exporter.converter_attributes[@converter_key]
    end

    # Public: Exports the slot data to an ETsource topology/dataset string.
    #
    # for_topology - Is the exported slot destined for the topology data,
    #                rather than a regional dataset?
    #
    # Returns the slot as a string.
    #
    def export(for_topology = false)
      return nil unless value = @data[@direction]

      data = if for_topology
        # For the topology (not region dataset):
        to_data(type: type)
      else
        # For the region dataset (not topology):
        to_data(
          conversion:    (dynamic_conversion? ? nil : value.to_f),
          reset_to_zero: @data[:reset_to_zero] == '1' || nil)
      end

      if for_topology
        # In topology data we can safely omit the data hash when there are no
        # values to be saved.
        '%s%s' % [ key, data.nil? ? '' : ": #{ data }" ]
      else
        # But in dataset data, it is required.
        '%s: %s' % [ key, data || '{}' ]
      end
    end

    #######
    private
    #######

    # Internal: The unique key (including carrier) as a string.
    #
    # Returns the slot key as a string.
    #
    def key
      if input?
        "#{ @converter_key }-(#{ @carrier_key })"
      else
        "(#{ @carrier_key })-#{ @converter_key }"
      end
    end

    # Internal: The "type" of slot if this is a special-case (e.g. elastic).
    #
    # Returns the type of the slot, or nil if the slot requires no special
    # behaviour in ETengine.
    #
    def type
      if carrier_efficient?
        :carrier_efficient
      elsif output? && @carrier_key == 'loss'
        :elastic
      elsif @data[:flexible]
        :elastic
      end
    end

    # Internal: Is the slot calculated dynmically in ETengine?
    #
    # Returns true or false.
    #
    def dynamic_conversion?
      (output? && @carrier_key == 'loss') ||
        carrier_efficient? || @data[:flexible]
    end

    # Internal: Determines if the slot uses carrier efficiency data to
    # calculate its conversion.
    #
    # Returns true or false.
    #
    def carrier_efficient?
      output? && self.class.carrier_efficient?(@carrier_key, @converter_data)
    end

    # Internal: Converts a hash to the pseudo-YAML we use for slot data.
    #
    # data - A hash whose data is to be formatted as a flat-style YAML hash.
    #
    # Examples:
    #
    #   # Ordinary use:
    #
    #   to_data(conversion: 0.75)
    #   # => "{ conversion: 0.75 }"
    #
    #   # nil attributes:
    #
    #   to_data(conversion: 0.75, type: nil)
    #   # => "{ conversion: 0.75 }"
    #
    #   # All nil attributes:
    #
    #   to_data(conversion: nil, type: nil)
    #   # => nil
    #
    # Returns the data as a string, or nil if no data needs to be saved.
    #
    def to_data(data)
      data.reject! { |_, value| value.nil? }

      if data.any?
        typecast = data.map do |key, value|
          "#{ key }: #{ value.is_a?(Symbol) ? value.inspect : value.to_s }"
        end

        "{#{ typecast.join(', ') }}"
      end
    end

    # Internal: Is this an input slot?
    #
    # Returns true or false.
    #
    def input?
      @direction == :input
    end

    # Internal: Is this an output slot?
    #
    # Returns true or false.
    #
    def output?
      ! input?
    end

  end # SlotExporter
end # ETE
