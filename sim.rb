#!/usr/bin/env ruby

require 'rubystats'
require_relative 'benford'

can_A = 'Alice'
can_B = 'Bob'

avg_can_A = 0.8
stddev_can_A = 0.1

num_precincts = 2000
avg_precinct_size = 1000
stddev_precinct_size = 300

avg_precinct_turnout = 0.8
stddev_precinct_turnout = 0.1
precincts = {}

1.upto(num_precincts) do |precinct|
  precincts[precinct] = {}
  precinct_size = Rubystats::NormalDistribution.new(avg_precinct_size, stddev_precinct_size).rng.to_i
  precinct_weight_can_A = 0.0
  precinct_turnout = 0.0

  while precinct_weight_can_A <= 0.0 || precinct_weight_can_A > 1.0
    precinct_weight_can_A = Rubystats::NormalDistribution.new(avg_can_A, stddev_can_A).rng
  end

  while precinct_turnout <= 0.0 || precinct_turnout > 1.0
    precinct_turnout = Rubystats::NormalDistribution.new(avg_precinct_turnout, stddev_precinct_turnout).rng
  end

  precinct_total_votes = (precinct_size * precinct_turnout).to_i
  can_A_votes = 0

  1.upto(precinct_total_votes) do |voter|
    can_A_votes += 1 if rand < precinct_weight_can_A
  end

  precincts[precinct][can_A] = {
    'Total' => can_A_votes.to_s
  }
  precincts[precinct][can_B] = {
    'Total' => (precinct_total_votes - can_A_votes).to_s
  }
end

ap precincts
benford(precincts)
