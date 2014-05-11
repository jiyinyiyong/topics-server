
db = require '../db'

exports.route = (req, res, next) ->
  if req.cookies?.token?
    db.findByToken req.cookies.token, (user) ->
      if user?
        req.user = user
        next()
      else
        res.writeHeader 400
        res.end 'token failed to recognize'
  else
    res.writeHeader 400
    res.end 'need token'