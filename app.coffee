app = require './app/main'
http = require 'http'
server = (http.createServer app).listen 3000

console.log "Express server listening on port %d in %s mode", server.address().port, app.settings.env
