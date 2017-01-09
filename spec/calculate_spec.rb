require 'spec_helper'

describe 'Calculating the ETSource datasets' do
  datasets = Atlas::Dataset.all.select do |dataset|
    dataset.enabled && dataset.enabled[:etengine]
  end

  datasets.each do |dataset|
    it "calculates the #{ dataset.key } dataset" do
      Atlas::Runner.new(dataset).calculate
    end
  end
end # Calculating the ETSource dataset
