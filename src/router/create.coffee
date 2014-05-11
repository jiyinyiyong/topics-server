
db = require '../db'

exports.route = (req, res) ->
  data = req.body
  data.time = new Date
  db.save data
  res.json status: 'ok'