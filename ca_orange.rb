#!/usr/bin/env ruby

require 'csv'
require_relative 'benford'

precincts = {}

CSV.foreach('data/CA/orange.csv', headers: true) do |row|
  precinct = row['Precinct']
  candidate = row['Candidate Name']

  precincts[precinct] ||= {}
  precincts[precinct][candidate] ||= {
    'Total' => row['Votes'].gsub(',', '')
  }
end

benford(precincts)
