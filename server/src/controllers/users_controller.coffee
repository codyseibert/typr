Promise = require 'bluebird'
_ = require 'underscore'
User = require '../models/user'

module.exports = do ->
  index = undefined
  show = undefined
  post = undefined
  login = undefined

  index = (req, res) ->
    User.findAll where: req.query
      .then (users) ->
        res.status 200
        res.send users

  show = (req, res) ->
    User.findById req.params.id
      .then (user) ->
        res.status 200
        res.send user

  post = (req, res) ->
    User.create req.body
      .then (user) ->
        res.status 200
        res.send user

  login = (req, res) ->
    User.findOne where: req.query
      .then (user) ->
        res.status 200
        res.send 'success'

  index: index
  show: show
  post: post
  login: login
