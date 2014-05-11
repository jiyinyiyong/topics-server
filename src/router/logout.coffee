
db = require '../db'

exports.route = (req, res) ->
  res.clearCookie 'token',
    domain: '.tiye.me'
    path: '/'
  res.json status: 'ok'