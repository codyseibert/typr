module.exports = [
  '$scope'
  '$timeout'
  'lodash'
  'reportsService'
  'snippitsService'
  (
    $scope
    $timeout
    _
    reportsService
    snippitsService
  ) ->

    $scope.animate =
      filters: false
      charts: false

    $timeout ->
      $scope.animate.filters = true
    $timeout ->
      $scope.animate.charts = true
    , 100

    $scope.charts =
      accuracy:
        labels: [
          "1/1/2016"
          "1/2/2016"
          "1/3/2016"
          "1/4/2016"
          "1/5/2016"
        ]
        series: [
          'php'
        ]
        data: [
          [
            100
            104
            98
            111
            120
          ]
        ]

      tokensPerMin:
        labels: [
          "1/1/2016"
          "1/2/2016"
          "1/3/2016"
          "1/4/2016"
          "1/5/2016"
        ]
        series: [
          'php'
        ]
        data: [
          [
            100
            104
            98
            111
            120
          ]
        ]

      charsPerMin:
        labels: [
          "1/1/2016"
          "1/2/2016"
          "1/3/2016"
          "1/4/2016"
          "1/5/2016"
        ]
        series: [
          'php'
        ]
        data: [
          [
            100
            104
            98
            111
            120
          ]
        ]

    reportsService.index()
      .then (reports) ->
        console.log reports
        snippitIds = reports.map (favorite) -> favorite.snippit_id
        snippitsService.index '_id$in': snippitIds.join ','

      .then (snippits) ->
        snippitMap = {}
        for snippit in snippits
          snippitMap[snippit._id] = snippit

        $scope.languages = _.uniq snippits.map (snippit) -> snippit.language
        $scope.languages.push 'ruby'
        $scope.languages.push 'coffeescript'
        $scope.languages.push 'bash'
        $scope.languages.push 'c++'
        $scope.languages.push 'c#'

    # createAccuracyChart = ->
    #   $scope.charts.accuracy.labels = []
    #   $scope.charts.accuracy.series = ['Accuracy']
    #   accuracy = []
    #
    #   angular.forEach $scope.snippit.reports, (value) ->
    #     $scope.charts.accuracy.labels.push $filter('amCalendar')(value.date)
    #     accuracy.push value.accuracy
    #   $scope.charts.accuracy.data = [
    #     accuracy
    #   ]
    #
    # createCPMChart = ->
    #   $scope.charts.cpm.labels = []
    #   $scope.charts.cpm.series = ['CPM']
    #   cpm = []
    #
    #   angular.forEach $scope.snippit.reports, (value) ->
    #     $scope.charts.cpm.labels.push $filter('amCalendar')(value.date)
    #     cpm.push value.charsPerMin
    #   $scope.charts.cpm.data = [
    #     cpm
    #   ]
    #
    # createTimeChart = ->
    #   $scope.charts.time.labels = []
    #   $scope.charts.time.series = ['Accuracy']
    #   time = []
    #
    #   angular.forEach $scope.snippit.reports, (value) ->
    #     $scope.charts.time.labels.push $filter('amCalendar')(value.date)
    #     time.push value.secElapsed
    #   $scope.charts.time.data = [
    #     time
    #   ]

    # createAccuracyChart()
    # createCPMChart()
    # createTimeChart()
]
