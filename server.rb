require 'socket'
require 'os'
server = TCPServer.new('192.168.0.104',7760)



def poweroff(client)
  puts %x[shutdown now 2>&1] if OS.linux?
  puts `"shutdown /s"` if OS.windows?
end

while client = server.accept
  url = client.gets.chomp

  case
  when url.include?('poweroff')
    poweroff(client)
  end



  client.close
end

