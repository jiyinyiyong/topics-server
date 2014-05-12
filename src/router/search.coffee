
db = require '../db'

exports.route = (req, res) ->
  keyword = req.query.query or 'haskell'
  db.search keyword, (docs) ->
    res.json docs