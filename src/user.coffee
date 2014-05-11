
mongoose = require 'mongoose'
Schema = mongoose.Schema

exports.Schema = new Schema
  name: String
  password: String
  token: String