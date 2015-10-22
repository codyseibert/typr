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
        snippitsService.post
          name: scope.name
          code: scope.code
        .then ->
          scope.uploadClicked()

      scope.canUpload = ->
        scope.code isnt '' and scope.name isnt ''

    templateUrl: 'upload/upload_directive.html'
  ]
