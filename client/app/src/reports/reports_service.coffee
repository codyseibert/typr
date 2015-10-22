Guid = require 'guid'

module.exports = [
  'snippitsService',
  (
    snippitsService
  ) ->

    snippit = null

    class Report
      constructor: (name, code) ->
        @id = Guid.raw()
        @averageTokenLen = 0
        @charsPerMin = 0
        @secElapsed = 0
        @accuracy = 0
        @strokes = 0
        @correct = 0
        @date = new Date()

    getAll = ->
      snippit.reports

    create = ->
      report = new Report()
      snippit.reports.push report
      snippitsService.persist()
      report

    setSnippit = (pSnippit) ->
      snippit = pSnippit

    getAll: getAll
    create: create
    setSnippit: setSnippit
  ]
