#!/usr/bin/env ruby

require 'csv'
require_relative 'benford'

precincts = {}

CSV.foreach('data/OH/cuyahoga.csv', headers: true) do |row|
  precinct = row['precinct']
  precincts[precinct] = {}
  precincts[precinct]['Trump'] = {
    'total' => row['trump'].gsub(',', '')
  }
  precincts[precinct]['Biden'] = {
    'total' => row['biden'].gsub(',', '')
  }
  precincts[precinct]['JoJo'] = {
    'total' => row['jojo'].gsub(',', '')
  }
  precincts[precinct]['Hawkins'] = {
    'total' => row['hawkins'].gsub(',', '')
  }
  precincts[precinct]['Write-In'] = {
    'total' => row['write-in'].gsub(',', '')
  }
end

benford(precincts)
