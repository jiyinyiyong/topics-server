
db = require '../db'

exports.route = (req, res) ->
  console.log 'to remove id', req.params
  db.del req.params.id
  res.json status: 'ok'