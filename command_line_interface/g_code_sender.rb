class GCodeSender
  
  attr_accessor :gcode
  
  def initialize(port)
    @port = port
    @line = 0
    @lines = 0
    @current = 0
    @gcode = nil
    open_port
  end
  
  def open_port
    return false unless @port
    begin
      @pipe = File.open(@port,"r+")
    
      return true
    rescue  
      puts "Cannot connect to #{@port}"
      exit
      return false
    end
  end
  
  def send_cmd(cmd)
    puts "will send command #{cmd}"
    begin
      @pipe.puts cmd
      response = []
      while(response.size == 0) do
        sleep 0.1
        response = @pipe.readlines
      end
      got_ok = false
      response.each do |res|
        if res.include? "Resend"
          @line = res.gsub("\r\n","").gsub("Resend:","").to_i
          puts "comm error, have to resend #{@line}"
          return false
        end  
        if res.include? "T:"
          puts res # qnd   
        end
        if res.include? "ok"
          got_ok = true
          puts "ok"
        end
      end
      return got_ok      
    rescue Exception => ex
      puts "Exception #{ex} at send_cmd"
      return nil
    end
  end

  def send_line(number)
    cmd = gcode[number].strip
    cmd += " N#{number}"
    checksum = cmd.bytes.inject{|a,b| a^b}
    res = send_cmd(cmd+"*"+checksum.to_s)
    unless res == false
      @line += 1
    end
  end
  
  def start
    send_cmd("M110 -1") # reset line count
    @line = 0
    
    if @gcode == nil
      puts "nothing to send"
      return
    end
    
    @lines = gcode.size
   
    puts "sending #{@lines} lines to the machine"
    while @lines > @line 
      send_line(@line)
    end
    puts "done."
        
        
  end
  

end