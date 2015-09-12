module.exports = [ 'codeService', (codeService) ->
  restrict: 'E'

  link: (scope, elem, attr) ->

    elem[0].querySelector('.type').focus()

    scope.text = ''

    SPACE = 13
    scope.code =
      html: ''

    setFirstAsRed = ->
      angular.element(elem[0].querySelector('.code')).html codeService.getHtml()
      codeService.reset()
      code = elem[0].querySelector('.code')
      first = angular.element(code).children()[0]
      angular.element(first).addClass 'red'

    scope.$watch ->
      codeService.getCode()
    , (newValue, oldValue) ->
      setFirstAsRed()

    # TODO: Rethink this logic....
    scope.$watch ->
      codeService.index
    , (newValue, oldValue) ->
      cur = angular.element elem[0].querySelector('.red')
      cur.removeClass 'red'
      cur = cur.next()
      if cur[0].tagName is 'BR'
        cur = cur.next()

        while cur.html() is '&nbsp;'
          cur = cur.next()
          scope.keypress
            keyCode: 32
            which: 32

      cur.addClass 'red'

    scope.$watch ->
      codeService.isDone()
    , ->
      setFirstAsRed()

    scope.blur = ->
      elem[0].querySelector('.type').focus()

    scope.keypress = ($event) ->
      code = $event.keyCode or $event.which
      char = String.fromCharCode code
      next = codeService.nextChar()

      if (code is SPACE and next is '\n') or char is next
        codeService.step()



  templateUrl: 'typing/typing_directive.html'
]
