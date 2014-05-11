
db = require '../db'

exports.route = (req, res) ->
  console.log req.body
  db.change req.params.id, req.body, ->
    res.json status: 'ok'