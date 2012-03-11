#!/usr/bin/ruby1.9
#
# requires ruby 1.9 and triangular gem! 
#
# reads STL file from command line
# outputs it's basic dimensions (assuming it's a square) in format x,y,z

require "rubygems"
require "triangular"

file = Triangular.parse_file(ARGV[0])
file.align_to_origin!
bounds = file.get_bounds
puts ["x","y","z"].map{|a| eval "bounds[1].#{a}"}.join(",")

