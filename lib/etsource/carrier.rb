module ETSource
  class Carrier
    include ActiveDocument

    attr_accessor :cost_per_mj, :sustainable, :mj_per_kg,
                  :co2_conversion_per_mj, :infinite,
                  :typical_production_per_km2, :kg_per_liter

    DIRECTORY = 'data/carrier'

  end
end
