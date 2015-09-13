module.exports = [
  'codeService'
  '$state'
  (
    codeService
    $state
  ) ->
    restrict: 'E'

    link: (scope, elem, attr) ->
      elem[0].querySelector('.type').focus()

      scope.upload = ->
        codeService.setCode scope.code
        $state.go 'typing'

      scope.hasCode = ->
        scope.code? and scope.code isnt ''

    templateUrl: 'upload/upload_directive.html'
  ]
