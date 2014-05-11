
express = require 'express'
bodyParser = require 'body-parser'

port = process.env.PORT or 3000

app = express()

db = require './src/db'

app.get '/topics', (req, res) ->
  db.all (docs) ->
    res.json docs

app.delete '/topic/:id', (req, res) ->
  db.del req.params.id
  res.json status: 'ok'

app.use bodyParser()

app.post '/topic', (req, res) ->
  console.log req.body
  db.save req.body
  res.json status: 'ok'

app.put '/topic/:id', (req, res) ->
  console.log req.body
  db.change req.params.id, req.body, ->
    res.json status: 'ok'

app.listen port
console.log "server started at #{port}"