module.exports = [ 'codeService', (codeService) ->
  restrict: 'E'

  link: (scope, elem, attr) ->

    elem[0].querySelector('.type').focus()

    scope.text = ''
    index = 0

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


    onBreak = false
    step = ->
      cur = angular.element elem[0].querySelector('.red')
      cur.removeClass 'red'
      cur.addClass 'complete'
      cur.removeClass 'glyphicon glyphicon-arrow-left'

      cur = cur.next()
      cur.addClass 'red'

      if cur.hasClass 'break'
        cur.addClass 'glyphicon glyphicon-arrow-left'

      if cur[0].tagName is 'BR'
        onBreak = true
        step()

      if onBreak
        if cur.html() is '&nbsp;'
          codeService.step()
          step()
        else
          onBreak = false

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
        step()
        codeService.step()

  templateUrl: 'typing/typing_directive.html'
]
