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
      elapsed: '='
      countdown: '='

    link: (scope, elem, attr) ->
      elem[0].querySelector('.type').focus()

      id = 1

      WAIT_TIME = 3000

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

      createWaitInterval = ->
        countdown = $interval ->
          scope.countdown--
        , 1000

        $timeout ->
          $interval.cancel countdown
          scope.countdown = null
          createPracticeInterval()
        , WAIT_TIME

      createPracticeInterval = ->
        $interval.cancel interval if interval?
        interval = $interval ->
          scope.secElapsed++
          scope.elapsed = scope.secElapsed
          scope.charsPerMin = parseInt ((scope.correct / scope.secElapsed) * 60)
          scope.tokensPerMin = scope.charsPerMin / codeService.getAverageTokenLength()
        , 1000

      setFirstAsRed = ->
        $timeout ->
          elem.scrollTopAnimated 0
        , 100

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
          reportsService.post
            averageTokenLength: codeService.getAverageTokenLength()
            charsPerMin: parseInt scope.charsPerMin
            tokensPerMin: parseInt(scope.tokensPerMin or 0)
            secElapsed: scope.secElapsed
            strokes: scope.strokes
            correct: scope.correct
            accuracy: scope.accuracy
          $interval.cancel interval
          scope.isTyping = false
          scope.done()

      # TODO: Look into why I am using watch
      # scope.$watch ->
      #   codeService.getCode()
      # , (newValue, oldValue) ->
      codeService.setCode scope.snippit.code
      setTimeout ->
        elem[0].querySelector('.type').focus()
      , 100
      setFirstAsRed()
      scope.elapsed = 0
      scope.countdown = 3
      createWaitInterval()

      scope.blur = ->
        if !scope.paused
          elem[0].querySelector('.type').focus()

      # scope.$parent.cb['typrStart'] = ->
      #   setTimeout ->
      #     elem[0].querySelector('.type').focus()
      #   , 100
      #   setFirstAsRed()
      #   scope.elapsed = 0
      #   scope.countdown = 3
      #   createWaitInterval()
      #   return true

      scope.keypress = ($event) ->
        return if scope.countdown?

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
