# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Renamed GQL functions' do
  RENAMED_FUNCTIONS = {
    INPUT_LINKS: :INPUT_EDGES,
    LG: :EDGE_GROUP,
    LINK: :EDGE,
    LINK_GROUP: :EG,
    OUTPUT_LINKS: :OUTPUT_EDGES
  }.freeze

  Atlas::Gquery.all.each do |gquery|
    describe "Gquery: #{gquery.key}" do
      it 'does not contain any renamed function' do
        RENAMED_FUNCTIONS.each do |old_name, new_name|
          expect(gquery.query.to_s.match?(/\b#{old_name}\(/)).to(
            be(false),
            "Gquery #{gquery.key} contains #{old_name} which has been renamed to #{new_name}"
          )
        end
      end
    end
  end

  Atlas::Input.all.each do |input|
    describe "Input: #{input.key}" do
      it 'does not contain any renamed function' do
        RENAMED_FUNCTIONS.each do |old_name, new_name|
          gql = <<~GQL
            #{input.query}
            #{input.start_value_gql}
            #{input.min_value_gql}
            #{input.max_value_gql}
          GQL

          expect(gql.match?(/\b#{old_name}\(/)).to(
            be(false),
            "Input #{input.key} contains #{old_name} which has been renamed to #{new_name}"
          )
        end
      end
    end
  end
end
