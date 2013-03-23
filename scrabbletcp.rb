require 'socket'

hex_data = "00 2e 30 20 4c 4f 47 49 4e 20 67 69 6c 6c
6e 61 6e 61 20 6a 61 63 6b 37 36 20 31 38 32 31
20 31 20 31 32 33 35 38 31 20 67 69 6c 6c 6e 61
6e 61"

login_string = hex_data.scan(/\S\S/).map { |hx| hx.hex.chr }.join('')

s = TCPSocket.new('66.98.172.34', 1329)
s.puts login_string
while true
  puts s.recv(1024)
end
