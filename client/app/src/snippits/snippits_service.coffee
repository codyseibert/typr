_ = require 'underscore'

module.exports = [
  '$http'
  '$q'
  (
    $http
    $q
  ) ->

    BASE_URL = 'http://localhost:8081'

    helper = (url, method = 'get', data) ->
      deferred = $q.defer()
      $http[method] "#{BASE_URL}/snippits", data
        .then (ret) ->
          deferred.resolve ret.data
      deferred.promise

    index = ->
      helper '/snippits'

    post = (snippit) ->
      console.log 'posting', snippit
      helper '/snippits', 'post', snippit

    index: index
    post: post

]
