class GCodeSender
  
  def initialize(port)
    @port = port
    check_port
  end
  
  def check_port
    return false unless @port
    begin
      f = File.open(@port,"r+")
      f.close
      return true
    rescue  
      return false
    end
  end

end