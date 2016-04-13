
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
        $http.get("#{BACKEND_URL}/reports", params: filter).then (data) ->
          resolve data.data

    create: (report) ->
      $q (resolve, reject) ->
        $http.post("#{BACKEND_URL}/reports", report).then (data) ->
          resolve data.data

  ]
