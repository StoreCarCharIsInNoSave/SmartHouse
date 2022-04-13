require 'socket'
require 'os'

ipv4 = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}.ip_address
server = TCPServer.new(ipv4,7760)



def poweroff(client)
  puts %x[shutdown now 2>&1] if OS.linux?
  system 'shutdown /s /t 0' if OS.windows?
end

while client = server.accept
  url = client.gets.chomp

  case
  when url.include?('poweroff')
    poweroff(client)
  end



  client.close
end

