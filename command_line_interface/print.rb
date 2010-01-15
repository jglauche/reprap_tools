#!/usr/bin/env ruby

require 'g_code_sender'

# todo: Probe USB ports
sender = GCodeSender.new("/dev/ttyUSB0")

dryrun = true

f = File.open(ARGV[0],"r")
contents = f.readlines
f.close

# stage 1: fix g-code/multiply
# TODO

# stage 2: heat up and stuff

# stage 3: print


