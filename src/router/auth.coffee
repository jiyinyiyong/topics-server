
db = require '../db'

exports.route = (req, res) ->
  password = req.body.password
  origin = req.headers.origin
  domain = origin.match(/\.\w+\.\w+$/)?[0]
  console.log 'cookie domain:', domain
  if (typeof password) isnt 'string'
    res.json error: 'no password'
  else db.auth password, (token) ->
    if token?
      data =
        name: token.name
        status: 'ok'
      console.log data
      res.cookie 'token', token.hash,
        maxAge: 7 * 3600 * 24 * 1000
        httpOnly: no
        domain: domain or '.tiye.me'
        path: '/'
      res.json data
    else
      res.json error: 'auth failed'
