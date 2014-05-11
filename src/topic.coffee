
mongoose = require 'mongoose'
Schema = mongoose.Schema

exports.Schema = new Schema
  title: String
  url: String
  favIconUrl: String
  note: String
  time:
    type: Date
    index: yes
,
  versionKey: no
  autoIndex: no
