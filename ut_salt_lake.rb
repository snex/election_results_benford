#!/usr/bin/env ruby

require 'nokogiri'
require_relative 'benford'

precincts = {}
xml = Nokogiri::XML(File.readlines('data/UT/salt_lake.xml').join)

candidates = xml.xpath("//ElectionResult//Contest[translate(@text,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')='PRESIDENT OF THE UNITED STATES']//Choice").map do |choice|
  choice.attributes['text'].value
end.uniq

vote_types = xml.xpath("//ElectionResult//Contest[translate(@text,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')='PRESIDENT OF THE UNITED STATES']//Choice//VoteType").map do |vt|
  vt.attributes['name'].value
end.uniq

xml.xpath('//ElectionResult//VoterTurnout//Precincts//Precinct').each do |precinct|
  p_name = precinct.attributes['name'].value
  p_ballots = precinct.attributes['ballotsCast'].value

  precincts[p_name] = {}
  candidates.each do |candidate|
    precincts[p_name][candidate] = {}
    precincts[p_name][candidate]['Total'] = '0'
  end
end

candidates.each do |candidate|
  vote_types.each do |vote_type|
    xml.xpath("//ElectionResult//Contest[translate(@text,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')='PRESIDENT OF THE UNITED STATES']//Choice[@text='#{candidate}']//VoteType[@name='#{vote_type}']//Precinct").each do |precinct|
      p_name = precinct.attributes['name'].value
      p_votes = precinct.attributes['votes'].value

      precincts[p_name][candidate][vote_type] = p_votes
      new_total = precincts[p_name][candidate]['Total'].to_i + p_votes.to_i
      precincts[p_name][candidate]['Total'] = new_total.to_s
    end
  end
end

benford(precincts)
