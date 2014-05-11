
mongoose = require 'mongoose'

userSchema = require('./user').Schema
{generate} = require './hash'
User = mongoose.model 'User', userSchema

owner = new User
  name: 'jiyinyiyong'
  password: generate('')
  token: generate((new Date).toString())

owner.save()

console.log 'new user created'