
db = require '../db'

exports.route = (req, res) ->
  time = new Date (Number req.params.time)
  db.more time, (docs) ->
    res.json docs