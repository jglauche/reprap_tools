#!/usr/bin/env ruby

require "rubygems"
require "activesupport"

require 'g_code_sender'

# todo: Probe USB ports
interface = "/dev/ttyUSB2"
sender = GCodeSender.new(interface)


dryrun = true

f = File.open(ARGV[0],"r")
contents = f.readlines
f.close

# stage 1: fix g-code/multiply
# TODO

sender.gcode = contents

# stage 2: heat up and stuff
# TODO

# stage 3: print

sender.start

