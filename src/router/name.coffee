
db = require '../db'

exports.route = (req, res) ->
  res.json name: req.user.name
