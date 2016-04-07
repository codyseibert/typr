module.exports = [
  '$scope'
  'favoritesService'
  'snippitsService'
  (
    $scope
    favoritesService
    snippitsService
  ) ->

    favoritesService.index().then (favorites) ->
      snippits = favorites.map (favorite) -> favorite.snippit
      snippitsService.index '_id$in': snippits.join ','
    .then (snippits) ->
      $scope.snippits = snippits

]
