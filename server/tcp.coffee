# Load the net module to create a tcp server.
net = require 'net'

# Setup a tcp server
server = net.createServer (socket) ->

  # Every time someone connects, tell them hello and then close the connection.
  socket.addListener "connect", () ->
    sys.puts "Connection from " + socket.remoteAddress
    socket.end "Hello World\n"

server.listen 9147

console.log "TCP server listening on port 9147"