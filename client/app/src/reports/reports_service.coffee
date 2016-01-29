
module.exports = [
  '$resource'
  'BACKEND_URL'
  (
    $resource
    BACKEND_URL
  ) ->
    Reports = $resource "#{BACKEND_URL}/reports"

    create: (report) ->
      Reports.save(report).$promise

  ]
