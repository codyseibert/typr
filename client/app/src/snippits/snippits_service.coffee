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

    index: (filter) ->
      $q (resolve, reject) ->
        $http.get("#{BACKEND_URL}/snippits", params: filter).then (data) ->
          resolve data.data

    post: (snippit) ->
      $q (resolve, reject) ->
        $http.post("#{BACKEND_URL}/snippits", snippit).then (data) ->
          resolve data.data
]
