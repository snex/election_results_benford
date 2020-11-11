#!/usr/bin/env ruby

require_relative 'clarity_xml_parser'
require_relative 'benford'

benford(clarity_parse_xml('data/IL/dupage.xml', 'PRESIDENT AND VICE PRESIDENT OF THE UNITED STATES'))
