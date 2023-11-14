require 'spec_helper'

RSpec::Matchers.define :be_fever_group do |*|
  def valid_groups
    Atlas::Config.read('fever.groups').map(&:to_sym)
  end

  match do |actual|
    valid_groups.include?(actual)
  end

  failure_message do |actual|
    "expected that #{actual} would be a valid fever group (allowed are: " \
    "#{valid_groups.inspect})"
  end
end

RSpec.describe 'config/fever/groups.yml' do
  it 'does not contain any duplicate keys' do
    config = Atlas::Config.read('fever.groups').map(&:to_sym)
    counts = config.group_by { |group| group }

    expect(counts.all? { |_, count| count.one? }).to be(true)
  end

  Atlas::EnergyNode.all.select(&:fever).each do |node|
    describe "#{node.key} node" do
      it 'uses a valid Fever group' do
        expect(node.fever.group).to be_fever_group
      end
    end
  end
end
