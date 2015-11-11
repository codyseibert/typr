Promise = require 'bluebird'
_ = require 'underscore'
Report = require '../models/report'

module.exports = do ->
  index = undefined
  show = undefined
  post = undefined
  destroy = undefined

  index = (req, res) ->
    Report.findAll where: req.query
      .then (reports) ->
        res.status 200
        res.send reports

  show = (req, res) ->
    Report.findById req.params.id
      .then (report) ->
        res.status 200
        res.send report

  post = (req, res) ->
    req.body.date = new Date()
    Report.create req.body
      .then (report) ->
        res.status 200
        res.send report

  destroy = (req, res) ->
    Report.findById req.params.id
      .then (report) ->
        if not report?
          res.status 400
          res.send 'report not found'
        else
          report.destroy().then (report) ->
            res.status 200
            res.send report

  index: index
  show: show
  post: post
  destroy: destroy
