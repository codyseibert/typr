module.exports = [
  '$window',
  '$interval',
  'codeService',
  (
    $window,
    $interval,
    codeService
  ) ->
    restrict: 'E'

    link: (scope, elem, attr) ->
      elem[0].querySelector('.type').focus()

      scope.averageTokenLen = codeService.getAverageTokenLength()
      scope.charsPerMin = 0
      scope.secElapsed = 0
      scope.strokes = 0
      scope.correct = 0
      scope.text = ''
      scope.code =
        html: ''

      index = 0
      SPACE = 13
      onBreak = false

      $interval ->
        scope.secElapsed++
        scope.charsPerMin = parseInt ((scope.correct / scope.secElapsed) * 60)
        scope.tokensPerMin = scope.charsPerMin / scope.averageTokenLen
      , 1000

      setFirstAsRed = ->
        angular.element(elem[0].querySelector('.code')).html codeService.getHtml()
        codeService.reset()
        code = elem[0].querySelector('.code')
        first = angular.element(code).children()[0]
        angular.element(first).addClass 'red'

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

          # We just entered a line break, so scroll
          yPos = cur.prop('offsetTop')
          height = elem[0].offsetHeight
          half = height / 2
          if yPos > half
            elem.scrollToElementAnimated cur, half - 100, 500

      scope.$watch ->
        codeService.isDone()
      , ->
        setFirstAsRed()

      scope.$watch ->
        codeService.getCode()
      , (newValue, oldValue) ->
        setFirstAsRed()

      scope.blur = ->
        elem[0].querySelector('.type').focus()

      scope.keypress = ($event) ->
        scope.strokes++

        code = $event.keyCode or $event.which
        char = String.fromCharCode code
        next = codeService.nextChar()

        if (code is SPACE and next is '\n') or char is next
          scope.correct++
          step()
          codeService.step()

        scope.accuracy = (scope.correct / scope.strokes) * 100

    templateUrl: 'typing/typing_directive.html'
  ]
