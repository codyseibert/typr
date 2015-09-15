module.exports = [
  '$window',
  '$interval',
  '$timeout',
  'codeService',
  'reportsService'
  'snippitsService'
  (
    $window,
    $interval,
    $timeout,
    codeService,
    reportsService,
    snippitsService
  ) ->
    restrict: 'E'

    templateUrl: 'typing/typing_directive.html'

    scope:
      snippit: '='
      isTyping: '='
      done: '='

    link: (scope, elem, attr) ->
      elem[0].querySelector('.type').focus()

      id = 1

      # TODO: Refactor (see below)
      scope.averageTokenLen = 1
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
      interval = null

      createInterval = ->
        $interval.cancel interval if interval?
        interval = $interval ->
          scope.secElapsed++
          scope.charsPerMin = parseInt ((scope.correct / scope.secElapsed) * 60)
          scope.tokensPerMin = scope.charsPerMin / codeService.getAverageTokenLength()
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

      checkIfDone = ->
        if codeService.isDone()
          report = reportsService.create()
          report.averageTokenLen = codeService.getAverageTokenLength()
          report.charsPerMin = scope.charsPerMin
          report.tokensPerMin = scope.tokensPerMin or 0
          report.secElapsed = scope.secElapsed
          report.strokes = scope.strokes
          report.correct = scope.correct
          report.accuracy = scope.accuracy
          snippitsService.persist()
          $interval.cancel interval
          scope.isTyping = false
          scope.$parent.doneWithPractice()

      # TODO: Look into why I am using watch
      scope.$watch ->
        codeService.getCode()
      , (newValue, oldValue) ->
        setFirstAsRed()

      scope.blur = ->
        if !scope.paused
          elem[0].querySelector('.type').focus()

      scope.$parent['typrStart'] = ->
        setTimeout ->
          elem[0].querySelector('.type').focus()
        , 100
        setFirstAsRed()
        createInterval()
        return true

      scope.keypress = ($event) ->
        scope.strokes++

        code = $event.keyCode or $event.which
        char = String.fromCharCode code
        next = codeService.nextChar()

        if (code is SPACE and next is '\n') or char is next
          scope.correct++
          step()
          codeService.step()
          checkIfDone()

        scope.accuracy = (scope.correct / scope.strokes) * 100
  ]
