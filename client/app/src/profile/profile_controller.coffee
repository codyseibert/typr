module.exports = [
  '$scope'
  '$timeout'
  '$filter'
  'lodash'
  'reportsService'
  'snippitsService'
  (
    $scope
    $timeout
    $filter
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

    $scope.currentLanguage = 'javascript'
    $scope.chartType = 'accuracy'
    $scope.charts = {}

    $scope.setChartType = (type) ->
      $scope.chartType = type

      console.log $scope.charts[$scope.currentLanguage][$scope.chartType]
      # $scope.$apply()

    $scope.setLanguage = (language) ->
      $scope.currentLanguage = language
      # $scope.$apply()

    reports = null
    snippits = null
    reportsService.index()
      .then (r) ->
        reports = r
        snippitIds = reports.map (favorite) -> favorite.snippit_id
        snippitsService.index '_id$in': snippitIds.join ','
      .then (s) ->
        snippits = s
        reports.forEach (report) ->
          report.snippit = _.find snippits, _id: report.snippit_id

        # seperate by language
        languageMap = {}
        reports.forEach (report) ->
          languageMap[report.snippit.language] ?= []
          languageMap[report.snippit.language].push report

        for key, arr of languageMap
          languageMap[key] = _.sortBy arr, 'date'

        for key, arr of languageMap
          $scope.charts[key] =
            accuracy:
              data: [arr.map (val) -> val.accuracy]
              labels: arr.map (val) -> $filter('amCalendar') val.date
              series: 'accuracy'
            charsPerMin:
              data: [arr.map (val) -> val.charsPerMin]
              labels: arr.map (val) -> $filter('amCalendar') val.date
              series: 'Characters Per Minute'
            tokensPerMin:
              data: [arr.map (val) -> val.tokensPerMin]
              labels: arr.map (val) -> $filter('amCalendar') val.date
              series: 'Tokens Per Minute'

        $scope.languages = []
        for key, arr of languageMap
          $scope.languages.push key

        # sort by date

        # $scope.languages = _.uniq snippits.map (snippit) -> snippit.language
        # $scope.languages.push 'ruby'
        # $scope.languages.push 'coffeescript'
        # $scope.languages.push 'bash'
        # $scope.languages.push 'c++'
        # $scope.languages.push 'c#'

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
