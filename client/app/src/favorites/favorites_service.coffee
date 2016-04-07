_ = require 'lodash'

module.exports = [
  '$http'
  '$q'
  'BACKEND_URL'
  (
    $http
    $q
    BACKEND_URL
  ) ->

    index: ->
      $q (resolve, reject) ->
        $http.get("#{BACKEND_URL}/favorites").then (data) ->
          resolve data.data

    post: (snippit) ->
      $q (resolve, reject) ->
        $http.post("#{BACKEND_URL}/favorites", snippit).then (data) ->
          resolve data.data

    delete: (snippitId) ->
      $q (resolve, reject) ->
        $http.delete("#{BACKEND_URL}/favorites/#{snippitId}").then (data) ->
          resolve data.data

]
