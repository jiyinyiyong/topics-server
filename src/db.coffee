
mongoose = require 'mongoose'
{generate} = require './hash'

host = 'mongodb://topics:topics@localhost:27017/topics'
mongoose.connect host

topicSchema = require('./topic').Schema
userSchema = require('./user').Schema

Topic = mongoose.model 'Topic', topicSchema
User = mongoose.model 'User', userSchema

exports.all = (res) ->
  Topic.find {}, (err, docs) ->
    console.log err if err?
    res docs

exports.del = (id, res) ->
  Topic.where().findOneAndRemove _id: id, (err, docs) ->
    console.log err if err?
    console.log docs

exports.save = (data) ->
  topic = new Topic data
  console.log topic, data
  topic.save (err, docs) ->
    console.log err if err?
    console.log docs

exports.change = (id, data, cb) ->
  Topic.update _id: id, data, (err, count) ->
    console.log err if err?
    console.log 'updated count:', count
    cb()

exports.auth = (password, cb) ->
  hash = generate password
  User.where().findOne password: hash, (err, user) ->
    if err? or (not user?)
      console.log err
      cb null
    else
      console.log user
      user.token = generate (new Date).toString()
      user.save()
      cb user

exports.findByToken = (token, cb) ->
  User.where().findOne {token}, (err, user) ->
    if err? or (not user?)
      console.log err
      cb null
    else
      console.log user
      cb user