require 'spec_helper'

describe 'Calculating the ETSource datasets' do
  datasets = Atlas::Dataset.all.select do |dataset|
    dataset.enabled && dataset.enabled[:etengine]
  end

  before(:all) do
    @graph = Atlas::GraphBuilder.build
  end

  datasets.each do |dataset|
    it "calculates the #{ dataset.key } dataset" do
      Atlas::Runner.new(dataset, @graph).calculate
    end
  end
end # Calculating the ETSource dataset
