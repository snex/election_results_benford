#!/usr/bin/env ruby

require 'csv'
require_relative 'benford'

precincts = {}

CSV.foreach('data/AZ/maricopa.csv', headers: true) do |row|
  precinct = row['PrecinctName']
  candidate = row['CandidateName']

  precincts[precinct] ||= {}
  precincts[precinct][candidate] ||= {
    'Total' => row['Votes'],
    'Early' => row['Votes_EARLY VOTE'],
    'Election Day' => row['Votes_ELECTION DAY'],
    'Provisional' => row['Votes_PROVISIONAL']
  }
end

benford(precincts)
