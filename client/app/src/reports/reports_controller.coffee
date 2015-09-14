module.exports = [
  '$scope'
  '$state'
  'codeService'
  'snippitsService'
  'reportsService'
  (
    $scope
    $state
    codeService
    snippitsService
    reportsService
  ) ->
    $scope.snippits = snippitsService.getAll()
    $scope.isShowUpload = false
    $scope.snippit = null
    $scope.report = null
    $scope.reports = []
    $scope.uploadClicked = false

    $scope.snippitClicked = (snippit) ->
      angular.forEach $scope.snippits, (value) ->
        value.selected = false
      snippit.selected = true
      reportsService.setSnippit snippit
      $scope.reports = reportsService.getAll()
      codeService.setCode snippit.code
      $scope.snippit = snippit

      $scope.labels = []
      $scope.series = ['Accuracy', 'CPM']
      accuracy = []
      cpm = []

      angular.forEach $scope.snippit.reports, (value) ->
        $scope.labels.push 'test' #value.date
        accuracy.push value.accuracy
        cpm.push value.charsPerMin
      $scope.data = [
        accuracy
        cpm
      ]
      console.log $scope.data, $scope.labels, $scope.series

    $scope.reportClicked = (report) ->
      angular.forEach $scope.reports, (value) ->
        value.selected = false
      report.selected = true
      $scope.visible = report
      $scope.report = report

    $scope.showUpload = ->
      $scope.isShowUpload = not $scope.isShowUpload

    $scope.upload = ->
      $scope.isShowUpload = not $scope.isShowUpload

    $scope.start = ->
      $scope.isTyping = true


]
