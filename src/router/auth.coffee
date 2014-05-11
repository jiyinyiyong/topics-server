
db = require '../db'

exports.route = (req, res) ->
  password = req.body.password
  console.log 'password', password
  if (typeof password) isnt 'string'
    res.json error: 'no password'
  else db.auth password, (user) ->
    if user?
      data =
        name: user.name
        status: 'ok'
      console.log data
      res.cookie 'token', user.token,
        maxAge: 90000000
        httpOnly: no
        domain: '.tiye.me'
        path: '/'
      res.json data
    else
      res.json error: 'auth failed'
