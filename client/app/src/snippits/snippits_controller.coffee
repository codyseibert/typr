module.exports = [
  '$scope'
  '$modal'
  '$filter'
  'snippitsService'
  (
    $scope
    $modal
    $filter
    snippitsService
  ) ->

    modalInstance = null
    $scope.filter = ''
    $scope.snippits = []

    getTypes = (snippits) ->
      $filter('unique')(snippits, 'type').map (snippit) ->
        name: snippit.type

    loadSnippits = ->
      snippitsService.index()
        .then (snippits) ->
          $scope.snippits = snippits
          $scope.types = getTypes snippits

          if $scope.filter is ''
            $scope.select $scope.types[0]

    loadSnippits()

    $scope.select = (type) ->
      angular.forEach $scope.types, (type) ->
        type.selected = false
      type.selected = true
      $scope.filter = type.name

    snippitUploaded = ->
      modalInstance.close()
      loadSnippits()

    $scope.showUpload = ->
      modalInstance = $modal.open
        animation: true
        controller: 'UploadModalCtrl'
        templateUrl: 'upload/upload_modal.html'
        size: 'md'
        resolve:
          upload: ->
            snippitUploaded

]
