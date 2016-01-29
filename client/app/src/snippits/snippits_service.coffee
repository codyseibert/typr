_ = require 'lodash'

module.exports = [
  '$resource'
  'BACKEND_URL'
  (
    $resource
    BACKEND_URL
  ) ->
    Snippits = $resource "#{BACKEND_URL}/snippits"
    
    index: ->
      Snippits.query().$promise

    post: (snippit) ->
      Snippits.save(snippit).$promise
]
