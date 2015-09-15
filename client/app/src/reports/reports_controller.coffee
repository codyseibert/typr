module.exports = [
  '$scope'
  '$state'
  '$modal'
  'codeService'
  'snippitsService'
  'reportsService'
  (
    $scope
    $state
    $modal
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

      $scope.labels = []
      $scope.series = ['Accuracy', 'CPM']
      accuracy = []
      cpm = []

      # TODO: Fix Chart Stuff
      angular.forEach $scope.snippit.reports, (value) ->
        $scope.labels.push 'test'
        accuracy.push value.accuracy
        cpm.push value.charsPerMin
      $scope.data = [
        accuracy
        cpm
      ]

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

    lastSnippit = snippitsService.getLastSnippit()
    $scope.snippitClicked(lastSnippit) if lastSnippit?
]
