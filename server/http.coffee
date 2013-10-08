http = require 'http'

server = http.createServer (request, response) ->
  console.log 'request received'
  console.log request
  response.writeHead 200, {"Content-Type": "text/plain"}
  response.end "Hello World\n"

server.listen 9147

console.log "Server listening on port 9147"