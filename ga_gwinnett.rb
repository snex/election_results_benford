#!/usr/bin/env ruby

require_relative 'clarity_xml_parser'
require_relative 'benford'

benford(clarity_parse_xml('data/GA/gwinnett.xml', 'PRESIDENT OF THE UNITED STATES/PRESIDENTEDE LOS ESTADOS UNIDOS'))
