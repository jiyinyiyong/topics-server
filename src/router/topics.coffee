
db = require '../db'

exports.route = (req, res) ->
  db.all (docs) ->
    res.json docs