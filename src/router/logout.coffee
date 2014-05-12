
db = require '../db'

exports.route = (req, res) ->
  origin = req.headers.origin
  domain = origin.match(/\.\w+\.\w+$/)?[0]
  res.clearCookie 'token',
    domain: domain
    path: '/'
  res.json status: 'ok'