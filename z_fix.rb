#!/usr/bin/env ruby

f = File.open(ARGV[0],"r")
contents = f.readlines
f.close

z = 0;
f = File.open(ARGV[0],"w")

newfile = []
contents.each do |line|
  if line[0..1] == "G1"
    l = line.split(" ")
    if l.size < 3
      next
    end
    z_movement = l[3].gsub("Z","").to_f
    #if z != nil
      if z != z_movement
        f.puts "G1 Z#{z_movement} F75\n"
      end
    #end
    z = z_movement
    
  end
    
  f.puts line
end

z += 10
f.puts "G1 Z#{z} F75\n"




f.close

