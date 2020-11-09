#!/usr/bin/env ruby

require 'csv'
require_relative 'benford'

precincts = {}

CSV.foreach('data/WI/milwaukee.csv', headers: true) do |row|
  ward = row['ward']
  precincts[ward] = {}
  precincts[ward]['biden'] = {
    'total' => row['biden']
  }
  precincts[ward]['trump'] = {
    'total' => row['trump']
  }
  precincts[ward]['blankenship'] = {
    'total' => row['blankenship']
  }
  precincts[ward]['jojo'] = {
    'total' => row['jojo']
  }
  precincts[ward]['carroll'] = {
    'total' => row['carroll']
  }
  precincts[ward]['write-in'] = {
    'total' => row['write-in']
  }
end

benford(precincts)
