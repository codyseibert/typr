module.exports = [
  '$scope'
  '$modal'
  '$filter'
  '$q'
  'snippitsService'
  'favoritesService'
  (
    $scope
    $modal
    $filter
    $q
    snippitsService
    favoritesService
  ) ->

    modalInstance = null
    $scope.filter = ''
    $scope.snippits = []

    getTypes = (snippits) ->
      $filter('unique')(snippits, 'language').map (snippit) ->
        name: snippit.language

    $q.all([
      snippitsService.index()
      favoritesService.index()
    ]).then ([snippits, favorites]) ->
      favorites = favorites.map (favorite) -> favorite.snippit
      for snippit in snippits
        snippit.isFavorite = true if snippit._id in favorites

      $scope.snippits = snippits
      $scope.types = getTypes snippits

      if $scope.filter is ''
        $scope.select $scope.types[0]

    $scope.select = (type) ->
      angular.forEach $scope.types, (type) ->
        type.selected = false
      type.selected = true
      $scope.filter = type.name

    $scope.openSnippit = (snippit) ->
      modalInstance = $modal.open
        animation: true
        controller: 'TypingModalCtrl'
        templateUrl: 'typing/typing_modal.html'
        size: 'md'
        resolve:
          snippit: -> snippit
          isTyping: -> true
          cb: ->
            ->
              console.log 'here'
          done: ->
            ->
              modalInstance.close()
              console.log 'done'

    snippitUploaded = (snippit) ->
      $scope.snippits.push snippit
      modalInstance.close()

    $scope.showUpload = ->
      modalInstance = $modal.open
        animation: true
        controller: 'UploadModalCtrl'
        templateUrl: 'upload/upload_modal.html'
        size: 'md'
        resolve:
          upload: ->
            snippitUploaded

    $scope.unsetAsFavorite = (snippit) ->
      favoritesService.delete snippit._id
      snippit.isFavorite = false

    $scope.setAsFavorite = (snippit) ->
      favoritesService.post snippit
      snippit.isFavorite = true

]
