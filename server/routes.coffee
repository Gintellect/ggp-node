Firebase = require 'firebase'
fb = new Firebase 'https://gintellect.firebaseio.com'

configure = (app, dir, io) ->
  #
  # json/api routes
  #

  app.get '/ggp/:playerName', (req, res) ->
    msg = 'we received a message for player ' + req.params.playerName
    console.log msg
    fb.set msg

  #all other request routes will be handled by angular on the server
  #so we return the single page app and let the client handle the rest

  app.get '*', (req, res) ->
    console.log 'GET'
    console.log req.path
    console.log req.header
    console.log req.body
    res.send '( ( name DeepBeige ) ( status available ) )'

  app.post '*', (req, res) ->
    console.log 'POST'
    console.log req.path
    console.log req.header
    console.log req.body
    res.send '( ( name DeepBeige ) ( status available ) )'


exports.configure = configure