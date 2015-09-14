Guid = require 'guid'

module.exports = [ ->

  snippits = JSON.parse localStorage.getItem('snippits') or '[]'

  class Snippit
    constructor: (name, code) ->
      @id = Guid.raw()
      @name = name
      @code = code
      @reports = []

    addReport: (report) ->
      @reports.push report

  persist = ->
    localStorage.setItem 'snippits', JSON.stringify snippits

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

  getAll: getAll
  remove: remove
  create: create
  persist: persist

]
