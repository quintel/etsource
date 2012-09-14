module ETSource

  # This class contains the EnergyBalance of a certain Area.
  # The EnergyBalance contains per energy carrier how much is produced
  # tranformed, used (finaly demand) etc.
  class EnergyBalance

    DIRECTORY = 'energy_balances'

    attr_accessor :area_code, :unit

    def initialize(area_code = :nl, unit = :pj)
      @area_code = area_code.to_s
      @unit = unit
    end

    def get(use, carrier)
      convert(get_ktoe(use,carrier), unit)
    end

    # Returns the ktoe value from the EnergyBalance table
    # @return [Float]
    def get_ktoe(use, carrier)
      get_row(use)[carrier.downcase.strip.gsub(/\ /,"_").to_sym] ||
        raise("#{carrier} not found in EnergyBalance for #{@area_code}")
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

    def get_row(use)
      row = table.find do |row|
        row[0].downcase.delete("*").gsub(/\s/,"_").strip == use.downcase.strip.gsub(/\s/,"_")
      end || raise("#{use} not found in EnergyBalance for #{area_code}")
    end

    def table
      CSV.table("#{ETSource.root}/#{self.class::DIRECTORY}/#{area_code}.csv")
    end

    def convert(value, unit)
      case unit
      when :pj
        value * 0.041868
      when :twh
        value * 0.01163
      else
        raise "unit #{unit} unknown!"
      end
    end

  end

end
