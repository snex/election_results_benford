#!/usr/bin/env ruby

require_relative 'clarity_xml_parser'
require_relative 'benford'

benford(clarity_parse_xml('data/PA/allegheny_2020.xml', 'PRESIDENTIAL ELECTORS'))
