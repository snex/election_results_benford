#!/usr/bin/env ruby

require 'csv'
require_relative 'benford'

precincts = {}

CSV.foreach('data/WA/king.csv', headers: true) do |row|
  precinct = row['Precinct']
  candidate = row['CounterType']

  precincts[precinct] ||= {}
  precincts[precinct][candidate] ||= {
    'Total' => row['SumOfCount'].gsub(',', '')
  }
end

benford(precincts)
