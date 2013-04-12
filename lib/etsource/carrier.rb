module ETSource
  class Carrier
    include ActiveDocument

    DIRECTORY = 'carrier'

    attribute :sustainable,                Boolean
    attribute :infinite,                   Boolean
    attribute :cost_per_mj,                Float
    attribute :mj_per_kg,                  Float
    attribute :co2_conversion_per_mj,      Float
    attribute :typical_production_per_km2, Float
    attribute :kg_per_liter,               Float

  end # Carrier
end # ETSource
