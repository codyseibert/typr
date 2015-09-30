module.exports = [
  '$scope'
  '$modal'
  'snippitsService'
  (
    $scope
    $modal
    snippitsService
  ) ->

    modalInstance = null

    class Filter
      constructor: (name) ->
        @name = name

    $scope.filters = [
      new Filter 'CoffeeScript'
      new Filter 'JavaScript'
      new Filter 'Python'
      new Filter 'Ruby'
      new Filter 'Java'
      new Filter 'C++'
      new Filter 'C#'
    ]

    $scope.select = (filter) ->
      angular.forEach $scope.filters, (filter) ->
        filter.selected = false
      filter.selected = true

    $scope.snippits = snippitsService.getAll()

    snippitUploaded = ->
      modalInstance.close()
      $scope.snippits = snippitsService.getAll()

    $scope.showUpload = ->
      modalInstance = $modal.open
        animation: true
        controller: 'UploadModalCtrl'
        templateUrl: 'upload/upload_modal.html'
        size: 'lg'
        resolve:
          upload: ->
            snippitUploaded

]
