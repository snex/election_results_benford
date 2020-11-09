#!/usr/bin/env ruby

require 'csv'
require_relative 'benford'

precincts = {}

CSV.foreach('data/IL/cook_2016.csv', headers: true) do |row|
  precinct = row['Precinct']
  precincts[precinct] = {}
  precincts[precinct]['Trump'] = {
    'total' => row['Donald J. Trump & Michael R. Pence'].gsub(',', '')
  }
  precincts[precinct]['Clinton'] = {
    'total' => row['Hillary R. Clinton & Timothy M. Kaine'].gsub(',', '')
  }
  precincts[precinct]['Johnson'] = {
    'total' => row['Gary Johnson & Bill Weld'].gsub(',', '')
  }
  precincts[precinct]['Stein'] = {
    'total' => row['Jill Stein & Ajamu Baraka'].gsub(',', '')
  }
end

benford(precincts)
