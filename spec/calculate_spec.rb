require 'spec_helper'

describe 'Calculating the ETSource datasets', :slow do
  datasets = Atlas::Dataset.all
    .select { |dataset| dataset.enabled && dataset.enabled[:etengine] }
    .sort_by(&:key)

  if ENV['DATASET']
    datasets.select! do |dataset|
      ENV['DATASET'] == dataset.key.to_s
    end
  end

  if ENV['SEMAPHORE_JOB_COUNT']
    count = datasets.length
    jobs  = ENV['SEMAPHORE_JOB_COUNT'].to_i
    index = ENV['SEMAPHORE_JOB_INDEX'].to_i - 1

    start  = (count / jobs) * index
    finish = (count / jobs) * (index + 1)

    finish = count if jobs == index + 1

    datasets = datasets[start..(finish - 1)]
  end

  datasets.each do |dataset|
    it "calculates the #{ dataset.key } dataset" do
      Atlas::Runner.new(dataset).calculate
    end
  end
end # Calculating the ETSource dataset
