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

  end

end
