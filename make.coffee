
require 'shelljs/make'

mission = require 'mission'

target.user = ->

  mongoose = require 'mongoose'
  config = require './config'

  u = config.dbUser
  p = config.dbPass
  n = config.dbName
  host = "mongodb://#{u}:#{p}@localhost:27017/#{n}"
  mongoose.connect host

  userSchema = require('./src/user').Schema
  {generate} = require './src/hash'
  User = mongoose.model 'User', userSchema

  owner = new User
    name: config.name
    password: generate(config.password)
    token: generate((new Date).toString())

  owner.save()

  console.log 'new user created', owner