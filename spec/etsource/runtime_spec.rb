require 'spec_helper'

module ETSource

  describe Runtime do

    before(:each) do
      copy_fixtures_to_tmp
      stub_const("ETSource::Dataset::DIRECTORY",
                 "tmp/fixtures/#{Dataset::DIRECTORY}")
      stub_const("ETSource::EnergyBalance::DIRECTORY",
                 "tmp/fixtures/#{EnergyBalance::DIRECTORY}")
    end

    let(:dataset) { Dataset.find(:nl) }
    let(:runtime) { Runtime.new(dataset) }

    it "executes basic ruby code" do
      expect(runtime.execute("1+1")).to eql 2
      expect(runtime.execute("[1,2,3].reduce(:+)")).to eql 6
    end

    it "executes standard function from Rubel" do
      expect(runtime.execute("SUM(1,2)")).to eql 3
    end

    it "executes Energy Balance functions" do
      expect(runtime.execute("EB('Residential', 'Natural Gas')")).to be > -1
    end

    it "executes Energy Balance functions without quotes" do
      expect(runtime.execute("EB(residential, natural_gas)")).to be > -1
    end

    it "executes combinations of the above" do
      query = "EB('residential', 'natural Gas')"
      eb_function = runtime.execute(query)
      expect(runtime.execute("#{query} * 2")).to eql eb_function * 2
    end

  end

end
