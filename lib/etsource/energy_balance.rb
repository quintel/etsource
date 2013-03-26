module ETSource

  # This class contains the EnergyBalance of a certain Area.
  # The EnergyBalance contains per energy carrier how much is produced
  # tranformed, used (finaly demand) etc.
  #
  # Currently, it is presumed that the EnergyBalance values are provided
  # in ktoe, the standard of the IEA.
  class EnergyBalance

    DIRECTORY = 'data/energy_balances'

    attr_accessor :key, :unit

    def initialize(key = :nl, unit = :pj)
      @key  = key
      @unit = unit
    end

    # Loads a stored energy balance
    def self.find(key)
      raise InvalidKeyError.new(key) unless key
      new(key)
    end

    # Returns the energy balance item in the correct unit
    def get(use, carrier)
      convert(get_ktoe(use,carrier), unit)
    end

    # Returns the ktoe value from the EnergyBalance table
    # @return [Float]
    def get_ktoe(use, carrier)
      get_row(use)[carrier.to_s.downcase.strip.gsub(/\ /,"_").to_sym] ||
        raise(UnknownCarrierError.new(carrier, key))
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

    # Get a row from the CSV file
    # Returns a CSV::Row object
    def get_row(use)
      row = table.find do |row|
        row[0].downcase.delete("*").gsub(/\s/,"_").strip ==
          use.to_s.downcase.strip.gsub(/\s/,"_")
      end
      row || raise(UnknownUseError.new(use, key))
    end

    # Load the whole table
    # Returns a CSV object
    def table
      CSV.table("#{ETSource.root}/#{self.class::DIRECTORY}/#{key}.csv")
    end

    # Converts a value from the ktoe to 'unit'
    def convert(value, unit)
      case unit
      when :pj
        value * 0.041868
      when :twh
        value * 0.01163
      else
        raise UnknownUnitError.new(unit)
      end
    end

  end # Dataset
end # ETSource
