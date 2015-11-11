User = require '../models/user'

decode = require('base64').decode

module.exports = (req, res, next) ->
  try
    creds = decode(req.headers.authorization.split(' ')[1]).split ':'
  catch
    res.status 401
    res.send 'invalid login'
    return

  filter =
    email: creds[0]
    password: creds[1]

  User.findOne where: filter
    .then (user) ->
      if user?
        req.user = user
        next()
      else
        res.status 401
        res.send 'invalid login'
