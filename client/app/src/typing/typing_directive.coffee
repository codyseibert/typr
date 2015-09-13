module.exports = [
  '$window',
  '$interval',
  '$timeout',
  'codeService',
  (
    $window,
    $interval,
    $timeout,
    codeService
  ) ->
    restrict: 'E'

    templateUrl: 'typing/typing_directive.html'

    scope:
      reports: '='
      report: '='

    link: (scope, elem, attr) ->
      elem[0].querySelector('.type').focus()

      id = 1
      scope.paused = true

      # TODO: Refactor (see below)
      scope.report.id = id++
      scope.report.averageTokenLen = codeService.getAverageTokenLength()
      scope.report.charsPerMin = 0
      scope.report.secElapsed = 0
      scope.report.strokes = 0
      scope.report.correct = 0

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
          scope.report.secElapsed++
          scope.report.charsPerMin = parseInt ((scope.report.correct / scope.report.secElapsed) * 60)
          scope.report.tokensPerMin = scope.report.charsPerMin / scope.report.averageTokenLen
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
          # TODO: Refactor
          scope.report = {}
          scope.report.id = id++
          scope.report.averageTokenLen = codeService.getAverageTokenLength()
          scope.report.charsPerMin = 0
          scope.report.secElapsed = 0
          scope.report.strokes = 0
          scope.report.correct = 0

          scope.paused = true

          $interval.cancel interval

      # TODO: Look into why I am using watch
      scope.$watch ->
        codeService.getCode()
      , (newValue, oldValue) ->
        setFirstAsRed()

      scope.blur = ->
        if !scope.paused
          elem[0].querySelector('.type').focus()

      scope.start = ->
        # TODO: Refactor
        elem[0].querySelector('.type').focus()
        scope.paused = false
        scope.reports.unshift scope.report
        setFirstAsRed()
        createInterval()
        return true

      scope.keypress = ($event) ->
        scope.report.strokes++

        code = $event.keyCode or $event.which
        char = String.fromCharCode code
        next = codeService.nextChar()

        if (code is SPACE and next is '\n') or char is next
          scope.report.correct++
          step()
          codeService.step()
          checkIfDone()

        scope.accuracy = (scope.report.correct / scope.report.strokes) * 100
  ]
