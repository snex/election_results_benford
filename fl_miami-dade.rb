#!/usr/bin/env ruby

require 'csv'
require_relative 'benford'

precincts = {}

CSV.foreach('data/FL/miami-dade.csv', headers: true) do |row|
  precinct = row['Precinct Name']
  candidate = row['Candidate Issue']

  precincts[precinct] ||= {}
  precincts[precinct][candidate] ||= {}
  precincts[precinct][candidate]['Provisional'] = row['Provisional Votes']
  precincts[precinct][candidate]['Mail-In'] = row['Mail Votes']
  precincts[precinct][candidate]['Early'] = row['Early Votes']
  precincts[precinct][candidate]['Election Day'] = row['Election Day Votes']
  precincts[precinct][candidate]['Total'] = row['Total Votes']
end

benford(precincts)
