module.exports = [
  '$scope'
  '$state'
  'codeService'
  (
    $scope
    $state
    codeService
  ) ->
    if codeService.code is ''
      $state.go 'upload'

    $scope.reports = []
    $scope.report = {}

    $scope.click = (report) ->
      angular.forEach $scope.reports, (value) ->
        value.selected = false
        
      report.selected = true
      $scope.visible = report
]
