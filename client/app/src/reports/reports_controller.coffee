module.exports = [
  '$scope'
  '$state'
  '$modal'
  '$filter'
  '$timeout'
  'codeService'
  'snippitsService'
  'reportsService'
  (
    $scope
    $state
    $modal
    $filter
    $timeout
    codeService
    snippitsService
    reportsService
  ) ->
    $scope.snippits = snippitsService.getAll()

    $scope.snippit = null
    $scope.report = null
    $scope.reports = []
    $scope.uploadClicked = false

    modalInstance = null
    $scope.cb =
      typrStart: null

    # TODO: Rethink this logic
    $scope.doneWithPractice = ->
      modalInstance.close()
      reports = $scope.snippit.reports
      $scope.reportClicked reports[reports.length - 1]
      $scope.snippitClicked $scope.snippit

    $scope.snippitClicked = (snippit) ->
      snippitsService.setLastSnippit snippit

      $scope.reports = null
      $scope.report = null
      $scope.selected = null

      angular.forEach $scope.snippits, (value) ->
        value.selected = false
      snippit.selected = true
      reportsService.setSnippit snippit
      $scope.reports = reportsService.getAll()
      codeService.setCode snippit.code
      $scope.snippit = snippit

      if $scope.reports.length > 0
        $scope.reportClicked $scope.reports[$scope.reports.length - 1]

      $scope.charts =
        accuracy: {}
        cpm: {}
        time: {}

      createAccuracyChart = ->
        $scope.charts.accuracy.labels = []
        $scope.charts.accuracy.series = ['Accuracy']
        accuracy = []

        angular.forEach $scope.snippit.reports, (value) ->
          $scope.charts.accuracy.labels.push $filter('amCalendar')(value.date)
          accuracy.push value.accuracy
        $scope.charts.accuracy.data = [
          accuracy
        ]

      createCPMChart = ->
        $scope.charts.cpm.labels = []
        $scope.charts.cpm.series = ['CPM']
        cpm = []

        angular.forEach $scope.snippit.reports, (value) ->
          $scope.charts.cpm.labels.push $filter('amCalendar')(value.date)
          cpm.push value.charsPerMinute
        $scope.charts.cpm.data = [
          cpm
        ]

      createTimeChart = ->
        $scope.charts.time.labels = []
        $scope.charts.time.series = ['Accuracy']
        time = []

        angular.forEach $scope.snippit.reports, (value) ->
          $scope.charts.time.labels.push $filter('amCalendar')(value.date)
          time.push value.secElapsed
        $scope.charts.time.data = [
          time
        ]

      createAccuracyChart()
      createCPMChart()
      createTimeChart()

    $scope.reportClicked = (report) ->
      angular.forEach $scope.reports, (value) ->
        value.selected = false
      report.selected = true
      $scope.visible = report
      $scope.report = report

    $scope.upload = ->
      $scope.report = null
      $scope.snippitClicked $scope.snippits[$scope.snippits.length - 1]
      modalInstance.close()

    $scope.openModal = ->
      modalInstance = $modal.open
        animation: true
        controller: 'ModalCtrl'
        templateUrl: 'reports/upload_modal.html'
        size: 'lg'
        resolve:
          upload: ->
            $scope.upload

    $scope.openTypingModal = ->
      $scope.isTyping = true

      modalInstance = $modal.open
        animation: true
        controller: 'TypingModalCtrl'
        templateUrl: 'typing/typing_modal.html'
        size: 'lg'
        resolve:
          isTyping: ->
            $scope.isTyping
          snippit: ->
            $scope.snippit
          done: ->
            $scope.doneWithPractice
          cb: ->
            $scope.cb

      # TODO: Refactor
      $timeout ->
        $scope.cb.typrStart()
      , 100

    lastSnippit = snippitsService.getLastSnippit()
    $scope.snippitClicked(lastSnippit) if lastSnippit?
]
