
mongoose = require 'mongoose'
Schema = mongoose.Schema

exports.Schema = new Schema
  title: String
  url: String
  favIconUrl: String
  note: String
,
  versionKey: no
