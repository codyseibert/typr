Guid = require 'guid'
_ = require 'underscore'

module.exports = [ ->

  snippits = JSON.parse localStorage.getItem('typr.snippits') or '[]'
  _.each snippits, (snippit) ->
    snippit.selected = false

  class Snippit
    constructor: (name, code) ->
      @id = Guid.raw()
      @name = name
      @code = code
      @reports = []

    addReport: (report) ->
      @reports.push report

  getLastSnippit = ->
    _.findWhere snippits, {id: localStorage.getItem 'typr.snippit.last'}

  setLastSnippit = (snippit) ->
    localStorage.setItem 'typr.snippit.last', snippit.id

  persist = ->
    localStorage.setItem 'typr.snippits', JSON.stringify snippits

  getAll = ->
    snippits

  remove = (snippit) ->
    snippits.splice snippit.id, 1
    persist()

  create = (name, code) ->
    snippit = new Snippit name, code
    snippits.push snippit
    persist()
    snippit

  getLastSnippit: getLastSnippit
  setLastSnippit: setLastSnippit
  getAll: getAll
  remove: remove
  create: create
  persist: persist

]
