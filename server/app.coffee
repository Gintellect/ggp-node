path = require 'path'
express = require 'express'

socket = require './socket'
routes = require './routes'
dir =  path.normalize __dirname + "/../client"

app = express()
server = require('http').createServer(app)

# Hook Socket.io into Express
io = require('socket.io').listen(server)

app.configure ->
  app.use express.cookieParser()
  app.use express.bodyParser()
  app.use express.compress()
  app.use express.static dir

  #configure the local routes
  routes.configure app, dir, io

  app.use express.errorHandler({ dumpExceptions: true, showStack: true })

io.sockets.on('connection', socket)

exports = module.exports = server

exports.use = () ->
  app.use.apply app, arguments
