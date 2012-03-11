#!/usr/bin/ruby1.9
# reads STL file from command line
# outputs it's basic dimensions (assuming it's a square) in format x,y,z

require "rubygems"
require "triangular"

file = Triangular.parse_file(ARGV[0])
bounds = file.get_bounds
puts ["x","y","z"].map{|a| eval "bounds[0].#{a}.abs+bounds[1].#{a}.abs"}.join(",")

