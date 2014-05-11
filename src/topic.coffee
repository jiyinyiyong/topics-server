
mongoose = require 'mongoose'
Schema = mongoose.Schema

exports.Schema = new Schema
  title: String
  url: String
  favIconUrl: String
  note: String
  time: Date
,
  versionKey: no
  autoIndex: yes

exports.Schema.index time: 1