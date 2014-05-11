
express = require 'express'
bodyParser = require 'body-parser'
cookieParser = require 'cookie-parser'

cors = require './src/cors'

port = process.env.PORT or 3000

app = express()

db = require './src/db'
router = require './src/router'

app.all '*', cors
app.use cookieParser()
app.use bodyParser()


app.get '/topics', router.topics
app.post '/auth', router.auth

app.use router.token

app.get '/name', router.name
app.delete '/topic/:id', router.delete
app.post '/topic', router.create
app.put '/topic/:id', router.update
app.post '/logout', router.logout

app.listen port
console.log "server started at #{port}"