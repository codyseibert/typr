module.exports = [
  'codeService'
  '$state'
  'snippitsService'
  (
    codeService
    $state
    snippitsService
  ) ->
    restrict: 'E'

    scope:
      uploadClicked: '='

    link: (scope, elem, attr) ->
      elem[0].querySelector('.type').focus()

      scope.name = ''
      scope.code = ''

      scope.upload = ->
        snippitsService.create scope.name, scope.code
        scope.uploadClicked()

      scope.canUpload = ->
        scope.code isnt '' and scope.name isnt ''

    templateUrl: 'upload/upload_directive.html'
  ]
