require 'spec_helper'

# The typical heat demand of new (future) residences is matched to the heat
# demand of the residences from the last construction period. See
# inputs/demand/households/households_number/new_residences_total/
# households_number_of_residences_new.ad, which calculates:
#
#   heat_demand_per_residence_<type>_new =
#     DIVIDE(preset_demand of <type>_2005_present, present_number_of_<type>_2005_present)
#
# GQL's DIVIDE returns 0.0 when either operand is zero, so a dataset without
# residences in the last construction period does not raise an error: new
# residences of that type silently end up with zero space heating demand.
# The same zero also collapses the relative change in the demolition input.
#
# Therefore every dataset must have residences in the last construction period
# for each residence type present in its housing stock.

RESIDENCE_TYPES = %w[
  apartments
  detached_houses
  semi_detached_houses
  terraced_houses
].freeze

LAST_CONSTRUCTION_PERIOD = '2005_present'.freeze

Atlas::Dataset.all.each do |dataset|
  RSpec.describe "#{dataset.key.to_s.upcase} dataset:" do
    RESIDENCE_TYPES.each do |type|
      # Datasets whose housing stock contains no semi-detached houses have no
      # residences of that type in any construction period. All other types
      # are still verified.
      next if type == 'semi_detached_houses' && !dataset.has_semi_detached_houses

      attribute = :"present_number_of_#{type}_#{LAST_CONSTRUCTION_PERIOD}"

      it "has #{type} in the #{LAST_CONSTRUCTION_PERIOD} construction period" do
        expect(dataset.public_send(attribute)).to be > 0
      end
    end
  end
end
