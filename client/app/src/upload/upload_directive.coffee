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

      scope.languages = [
        name: "jade"
        value: "jade"
      ,
        name: "sass"
        value: "sass"
      ,
        name: "coffeescript"
        value: "coffeescript"
      ,
        name: "shell"
        value: "shell"
      ,
        name: "c"
        value: "c"
      ,
        name: "javascript"
        value: "javascript"
      ,
        name: "c++"
        value: "c++"
      ,
        name: "ruby"
        value: "ruby"
      ,
        name: "python"
        value: "python"
      ,
        name: "css"
        value: "css"
      ]
      scope.language = scope.languages[0]

      scope.upload = ->
        snippitsService.post
          name: scope.name
          code: scope.code
          language: scope.language.value
        .then (snippit) ->
          scope.uploadClicked snippit

      scope.canUpload = ->
        scope.code isnt '' and scope.name isnt ''

    templateUrl: 'upload/upload_directive.html'
  ]
