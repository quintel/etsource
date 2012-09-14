module ETSource

  # This class contains the EnergyBalance of a certain Area.
  # The EnergyBalance contains per energy carrier how much is produced
  # tranformed, used (finaly demand) etc.
  class EnergyBalance

    DIRECTORY = 'energy_balances'

    attr_accessor :area_code

    def initialize(area_code)
      @area_code = area_code
    end

    def query(string)
    end

    def table
      CSV.table("#{ETSource.root}/#{self.class::DIRECTORY}/#{area_code}.csv")
    end

    # Returns a value from the EnergyBalance table
    # @return [Float]
    def get(use, carrier)
      row = table.find do |row|
        #remove * characters and substitute spaces for underscores on both ends
        row[0].downcase.gsub(/\*/,"").gsub(/\ /,"_").strip == use.downcase.strip.gsub(/\ /,"_")
      end || raise("#{use} not found in EnergyBalance for #{area_code}")
      row[carrier.downcase.strip.gsub(/\ /,"_").to_sym] || raise("#{carrier} not found in EnergyBalance for #{@area_code}")
    end

    # basicly the same as get, but then in one big string, separates by comma
    # @ return [Float]
    def query(string)
      params = string.split(",")
      get(params.first, params.last)
    end

  end

end
