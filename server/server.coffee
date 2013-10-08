port = process.env.PORT ? process.argv.splice(2)[0] ? 8085
require('./app').listen port, () ->
  console.log 'listening on port ' + port
