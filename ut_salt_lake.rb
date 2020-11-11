#!/usr/bin/env ruby

require_relative 'clarity_xml_parser'
require_relative 'benford'

benford(clarity_parse_xml('data/UT/salt_lake.xml', 'PRESIDENT OF THE UNITED STATES'))
