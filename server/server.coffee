port = process.env.PORT ? process.argv.splice(2)[0] ? 8088
require('./app').listen port, () ->
  console.log 'listening on port ' + port
