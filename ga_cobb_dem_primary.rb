#!/usr/bin/env ruby

require_relative 'clarity_xml_parser'
require_relative 'benford'

benford(clarity_parse_xml('data/GA/cobb_dem_primary.xml', 'DEM - PRESIDENT OF THE UNITED STATES'))
