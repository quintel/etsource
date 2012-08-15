#!/usr/bin/env ruby
# use it by ruby gqueries_compare.rb master anotherbranch scenario_id
# it will take some time to procces 

require 'rubygems'
require 'yaml'
require 'git'
require 'fileutils'
require 'httparty'

class GqueriesData
  include HTTParty
  base_uri "http://etengine.dev/api/v3/scenarios/#{ARGV[2]}/sandbox"
  headers "User-Agent" => "Etsource", "Content-length" => "0"
end  
  
if ARGV.length == 3
  current_dir = File.dirname(__FILE__)

  @git = Git.open("#{current_dir}/../")
  branch_1 = ARGV[0]
  branch_2 = ARGV[1]
  
  branches = @git.branches.local.map!{|x| x.to_s}
  
  unless branches.include?(branch_1) and branches.include?(branch_2)
    puts "cannot find branches"
    exit
  end
  puts "We will compare #{branch_1} with #{branch_2}"
  puts "Dont use etsource now it will switch branches"
  
  puts "Switch to #{branch_1} branch for all gqueries"
  @git.checkout(branch_1)
  gqueries_1 = {}
  Dir.glob("gqueries/**/*.gql").each do |f|
    file = File.open(f, "rb")
    gqueries_1[Pathname.new(f).basename] = file.read
    file.close
  end
  
  puts "Switch to #{branch_2} branch for all gqueries"
  @git.checkout(branch_2)
  gqueries_2 = {}
  Dir.glob("gqueries/**/*.gql").each do |f|
    file = File.open(f, "rb")
    gqueries_2[Pathname.new(f).basename] = file.read
    file.close
  end
  
  puts "Done with swithing branches. Free to work on it now will the calculation is running"
  puts "Start calculation"

  gqueries_1.each do |key,value|
    
    if gqueries_2.has_key?(key)
      value_2  = gqueries_2[key]
      if value != value_2
        gql_1 = value.lines.reject{|l| l.match(/^[#-]/)}.join(" ").gsub(/\r/," ").gsub(/\n/," ")
        gql_2 = value_2.lines.reject{|l| l.match(/^[#-]/)}.join(" ").gsub(/\r/," ").gsub(/\n/," ")
        
        data_1 = GqueriesData.get("",:query => {:gql => gql_1})
        data_2 = GqueriesData.get("",:query => {:gql => gql_2})
        
        if !data_1['errors'].nil? or !data_2['errors'].nil?
          puts "Gql gives error at #{key}"
        else
          result = data_1.to_a - data_2.to_a
          unless result.empty?
            puts "Error at #{key}"
          end
        end
      end  
      gqueries_1.delete(key)
      gqueries_2.delete(key)
    end  
    
  end
  
  puts "Check this gqueries out by hand:" if gqueries_1.length > 0 or gqueries_2.length > 0
  if gqueries_1.length > 0
    puts "From branch #{branch_1}:"
    gqueries_1.to_s
  end
  
  if gqueries_2.length > 0
    puts "From branch #{branch_2}:"
    gqueries_2.to_s
  end
  
  puts "Finished"
  
end