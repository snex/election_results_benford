#!/usr/bin/env ruby

require 'csv'
require_relative 'benford'

precincts = {}

CSV.foreach('data/CA/san_francisco.csv', headers: true) do |row|
  precinct = row['Precinct']
  precincts[precinct] = {}
  precincts[precinct]['Trump'] = {
    'total' => row['DONALD J. TRUMP AND MICHAEL R. PENCE'].gsub(',', '')
  }
  precincts[precinct]['Biden'] = {
    'total' => row['JOSEPH R. BIDEN AND KAMALA D. HARRIS'].gsub(',', '')
  }
  precincts[precinct]['La Riva'] = {
    'total' => row['GLORIA LA RIVA AND SUNIL FREEMAN'].gsub(',', '')
  }
  precincts[precinct]['DeLa Fuente'] = {
    'total' => row['ROQUE "ROCKY" DE LA FUENTE GUERRA AND KANYE OMARI WEST'].gsub(',', '')
  }
  precincts[precinct]['Hawkins'] = {
    'total' => row['HOWIE HAWKINS AND ANGELA NICOLE WALKER'].gsub(',', '')
  }
  precincts[precinct]['JoJo'] = {
    'total' => row['JO JORGENSEN AND JEREMY "SPIKE" COHEN'].gsub(',', '')
  }
  precincts[precinct]['Write-In'] = {
    'total' => row['Write-in'].gsub(',', '')
  }
  precincts[precinct]['Carroll'] = {
    'total' => row['BRIAN CARROLL AND AMAR PATEL Qualified Write In'].gsub(',', '')
  }
  precincts[precinct]['Mark Charles'] = {
    'total' => row['MARK CHARLES AND ADRIAN WALLACE Qualified Write In'].gsub(',', '')
  }
  precincts[precinct]['Kishore'] = {
    'total' => row['JOSEPH KISHORE AND NORISSA SANTA CRUZ Qualified Write In'].gsub(',', '')
  }
  precincts[precinct]['Pierce'] = {
    'total' => row['BROCK PIERCE AND KARLA BALLARD Qualified Write In'].gsub(',', '')
  }
  precincts[precinct]['Ventura'] = {
    'total' => row['JESSE VENTURA AND CYNTHIA MCKINNEY Qualified Write In'].gsub(',', '')
  }
end

benford(precincts)
