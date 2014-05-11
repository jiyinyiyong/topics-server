
module.exports = (req, res, next) ->
  if req.headers.origin
    res.header("Access-Control-Allow-Origin", req.headers.origin)
    res.header("Access-Control-Allow-Credentials", true)
    res.header('Access-Control-Allow-Methods', 'PUT, GET, POST, DELETE, OPTIONS')
    res.header("Access-Control-Allow-Headers", "X-Requested-With, AUTHORIZATION")
  next()
