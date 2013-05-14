module ETSource

  # This class contains the EnergyBalance of a certain Area.
  # The EnergyBalance contains per energy carrier how much is produced
  # tranformed, used (finaly demand) etc.
  #
  # Currently, it is presumed that the EnergyBalance values are provided
  # in ktoe, the standard of the IEA.
  class EnergyBalance

    DIRECTORY =     'energy_balances'
    ORIGINAL_UNIT = :ktoe

    attr_accessor :key, :unit

    def initialize(key = :nl, unit = :pj)
      @key  = key
      @unit = unit
    end

    # Loads a stored energy balance
    def self.find(key, year = nil)
      raise InvalidKeyError.new(key) unless key
      new(key)
    end

    # Returns the energy balance item in the correct unit
    def get(use, carrier)
      convert_to_unit(get_cell(use, carrier))
    end

    # basicly the same as get, but then in one big string, separates by comma
    # @ return [Float]
    def query(string)
      params = string.split(",")
      get(params.first, params.last)
    end

    #######
    private
    #######

    # Returns the value from the EnergyBalance table
    # @return [Float]
    def get_cell(use, carrier)
      get_row(use)[carrier.to_s.downcase.strip.gsub(/\ /, "_").to_sym] ||
        raise(UnknownCarrierError.new(carrier, key))
    end

    # Get a row from the CSV file
    # Returns a CSV::Row object
    def get_row(use)
      row = table.find do |row|
        row[0].downcase.delete("*").gsub(/\s/, "_").strip ==
          use.to_s.downcase.strip.gsub(/\s/, "_")
      end
      row || raise(UnknownUseError.new(use, key))
    end

    # Load the whole table
    # Returns a CSV object
    def table
      CSV.table("#{ETSource.data_dir}/#{self.class::DIRECTORY}/#{key}.csv")
    end

    def convert_to_unit(value)
      EnergyUnit.new(value, ORIGINAL_UNIT).to_unit(unit)
    end

  end # Dataset
end # ETSource
