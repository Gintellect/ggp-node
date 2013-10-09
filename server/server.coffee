http = require 'http'

respondToRequest = (reply, res) ->
  headers = 
    'Content-type': 'text/acl'
    'Content-length': reply.length
    'Access-Control-Allow-Origin': '*'
    'Access-Control-Allow-Methods': 'POST, GET, OPTIONS'
    'Access-Control-Allow-Headers': 'Content-Type'
    'Access-Control-Allow-Age': 86400
  res.writeHead 200, headers
  res.write reply
  res.end()

respondToInfo = (res) ->
  reply = '( ( name DeepBeige ) ( status available ) )'
  respondToRequest reply, res

server = http.createServer (req, res) ->
  body = ""

  req.on 'data', (chunk) ->
    body += chunk

  req.on 'end', () ->
    if body is '( INFO )'
      respondToInfo res
    else
      console.log 'UNKNOWN MESSAGE TYPE'
      console.log body
    
server.listen 8088

console.log "Server listening on port 8088"