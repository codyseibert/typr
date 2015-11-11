Promise = require 'bluebird'
_ = require 'underscore'
Snippit = require '../models/snippit'

module.exports = do ->
  index = undefined
  show = undefined
  post = undefined
  put = undefined
  destroy = undefined

  TYPE_REGEX = /_([a-z]+)_/g
  getType = (code) ->
    matches = TYPE_REGEX.exec code
    if matches and matches.length > 0
      matches[1]
    else
      'magic'

  stripType = (code) ->
    code.replace TYPE_REGEX, ''

  index = (req, res) ->
    Snippit.findAll where: req.query
      .then (tasks) ->
        res.status 200
        res.send tasks

  show = (req, res) ->
    Snippit.findById req.params.id
      .then (task) ->
        res.status 200
        res.send task

  put = (req, res) ->
    Snippit.findById req.params.id
      .then (task) ->
        task = _.extend task, req.body
        task.save().then ->
          res.status 200
          res.send task

  post = (req, res) ->
    req.body.type = getType req.body.code
    req.body.code = stripType req.body.code
    Snippit.create req.body
      .then (task) ->
        res.status 200
        res.send task

  destroy = (req, res) ->
    Snippit.findById req.params.id
      .then (task) ->
        if not task?
          res.status 400
          res.send 'snippit not found'
        else
          task.destroy().then (task) ->
            res.status 200
            res.send task

  index: index
  show: show
  put: put
  post: post
  destroy: destroy
