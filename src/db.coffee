
mongoose = require 'mongoose'

host = 'mongodb://topics:topics@localhost:27017/topics'
mongoose.connect host

topicSchema = require('./topic').Schema

Topic = mongoose.model 'Topic', topicSchema

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