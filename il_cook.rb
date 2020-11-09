#!/usr/bin/env ruby

require 'csv'
require_relative 'benford'

precincts = {}

CSV.foreach('data/IL/cook_2016.csv', headers: true) do |row|
  precinct = row['Precinct']
  precincts[precinct] = {}
  precincts[precinct]['Trump'] = {
    'total' => row['Donald J. Trump & Michael R. Pence']
  }
  precincts[precinct]['Clinton'] = {
    'total' => row['Hillary R. Clinton & Timothy M. Kaine']
  }
  precincts[precinct]['Johnson'] = {
    'total' => row['Gary Johnson & Bill Weld']
  }
  precincts[precinct]['Stein'] = {
    'total' => row['Jill Stein & Ajamu Baraka']
  }
end

benford(precincts)
