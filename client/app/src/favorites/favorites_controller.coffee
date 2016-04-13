module.exports = [
  '$scope'
  'lodash'
  'favoritesService'
  'snippitsService'
  'reportsService'
  (
    $scope
    _
    favoritesService
    snippitsService
    reportsService
  ) ->

    favoritesService.index().then (favorites) ->
      snippits = favorites.map (favorite) -> favorite.snippit
      snippitsService.index '_id$in': snippits.join ','
    .then (snippits) ->
      $scope.snippits = snippits
      reportsService.index '_id$in': snippits.join ','
    .then (reports) ->
      _.each reports, (report) ->
        _.find($scope.snippits, _id: report.snippit_id)?.reports ?= []
        _.find($scope.snippits, _id: report.snippit_id)?.reports.push report

      _.each $scope.snippits, (snippit) ->
        return if not snippit.reports?
        snippit.bestTPM = (_.reduce snippit.reports, (tpm, report) ->
          Math.max tpm, report.tokensPerMin
        , -1e9)
        snippit.bestCPM = (_.reduce snippit.reports, (cpm, report) ->
          Math.max cpm, report.charsPerMin
        , -1e9)
        snippit.bestACC = (_.reduce snippit.reports, (acc, report) ->
          Math.max acc, report.accuracy
        , -1e9)
]
