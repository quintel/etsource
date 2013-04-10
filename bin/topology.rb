#!/bin/env ruby

$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + '/../lib'))

require 'fileutils'
require 'pathname'
require 'etsource'

ROOT_PATH = Pathname.new(__FILE__).dirname.parent.expand_path
DATA_PATH = ROOT_PATH.join('data/nodes')

nodes   = YAML.load_file(ROOT_PATH.join('topology/export.graph'))
sectors = nodes.group_by { |key, data| data['sector'] || 'nosector' }

# Given a node key and data, tries to infer what Node subclass it should be
# given.
def subclass(key, data)
  return 'final_demand_node' if key.to_s.match(/final_demand/)
  return 'demand_node'       if key.to_s.match(/demand/)

  out_slots, in_slots = data['slots'].partition { |s| s.match(/^\(/) }
  in_slots.map!  { |slot| match = slot.match(/\((.*)\)/) ; match[1] }
  out_slots.map! { |slot| match = slot.match(/\((.*)\)/) ; match[1] }

  if (in_slots - out_slots).any?
    'converter'
  end
end

# +sectors+ is now a hash where each key is a sector, and each value an array
# containing all the nodes in that sector. The values look like this:
#
#   [ [ 'node_one_key', node_one_attributes_hash ],
#     [ 'node_two_key', node_one_attributes_hash ], ... ]

sectors.each do |sector, nodes|
  directory = DATA_PATH.join(sector)

  puts "#{ sector } (at #{ directory.to_s })"
  puts '-' * ((sector.length + directory.to_s.length) + 6)

  # Make the sector directory if it doesn't exist already.
  unless File.directory?(directory)
    FileUtils.mkdir_p(directory)
    puts "* Created #{ directory.inspect }"
  end

  nodes.each do |key, data|

    # Refactor Slots
    out_slots, in_slots = data['slots'].partition { |s| s.match(/^\(/) }
    data[:in_slots]  = in_slots.map  { |slot| slot.match(/\((.*)\)/)[1] }
    data[:out_slots] = out_slots.map { |slot| slot.match(/\((.*)\)/)[1] }

    # Try to infer the subclass for the node.
    type   = subclass(key, data)
    suffix = ".#{ type }" if type

    # Throw away links and (old) slots
    data.delete('links')
    data.delete('slots')

    dumped = ETSource::HashToTextParser.new(data).to_text

    File.write(directory.join("#{ key }#{ suffix }.ad"), dumped)
    puts "* Wrote node #{ key.inspect } as a #{ type || 'node' }"
  end

  puts
end

puts 'All done.'
