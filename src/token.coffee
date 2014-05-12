
mongoose = require 'mongoose'
Schema = mongoose.Schema

exports.Schema = new Schema
  name: String
  hash: String
  time:
    type: Date
    expires: 3600 * 24 * 30