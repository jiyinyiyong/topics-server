
express = require 'express'
bodyParser = require 'body-parser'
cookieParser = require 'cookie-parser'

cors = require './src/cors'

port = process.env.PORT or 3000

app = express()

db = require './src/db'

app.all '*', cors
app.use cookieParser()
app.use bodyParser()

app.get '/topics', (req, res) ->
  console.log req.cookies
  db.all (docs) ->
    data =
      list: docs
    if req.cookies?.token?
      db.findByToken req.cookies.token, (user) ->
        data.name = user.name
        res.json data
    else res.json data

app.delete '/topic/:id', (req, res) ->
  db.del req.params.id
  res.json status: 'ok'

app.post '/topic', (req, res) ->
  console.log req.body
  db.save req.body
  res.json status: 'ok'

app.put '/topic/:id', (req, res) ->
  console.log req.body
  db.change req.params.id, req.body, ->
    res.json status: 'ok'

app.post '/auth', (req, res) ->
  password = req.body.password
  console.log 'password', password
  if (typeof password) isnt 'string'
    res.json error: 'no password'
  else db.auth password, (user) ->
    if user?
      data =
        name: user.name
        status: 'ok'
      console.log data
      res.cookie 'token', user.token,
        maxAge: 900000
        httpOnly: no
        domain: '.tiye.me'
        path: '/'
      res.json data
    else
      res.json error: 'auth failed'

app.post '/logout', (req, res) ->
  res.clearCookie 'token',
    domain: '.tiye.me'
    path: '/'
  res.json status: 'ok'

app.listen port
console.log "server started at #{port}"