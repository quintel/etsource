module ETSource
  class Input
    include ActiveDocument

    DIRECTORY = 'data/inputs'

    attribute :id,              Integer
    attribute :query,           String
    attribute :share_group,     String
    attribute :label,           String
    attribute :label_query,     String
    attribute :comments,        String

    attribute :max_value,       Float
    attribute :max_value_gql,   String
    attribute :min_value,       Float
    attribute :min_value_gql,   String
    attribute :start_value,     Float
    attribute :start_value_gql, String
    attribute :step_value,      Float
    attribute :factor,          Float

    attribute :unit,            String
    attribute :update_period,   String
    attribute :update_type,     String
    attribute :default_unit,    String
    attribute :dependent_on,    String

    validates_presence_of :query

  end # Input
end # ETSource
