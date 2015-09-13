module.exports = [ ->
  class Code
    constructor: ->
      @code = ''
      @index = 0

    setCode: (code) ->
      @code = code

    getCode: ->
      @code

    reset: ->
      @index = 0

    nextChar: ->
      @code.charAt @index

    step: ->
      @index++

    getAverageTokenLength: ->
      tmpCode = @code + ''
      tmpCode = tmpCode.replace(/ +(?= )/g,'')
      split = @code.split(/\s|\n/)
      counts = 0
      angular.forEach split, (value) ->
        counts += value.length
      counts / split.length

    isDone: ->
      @index >= @code.length

    getHtml: ->
      html = ''
      for i in [0..@code.length]
        char = @code.charAt i
        if char is '\n'
          html += "<span class='char break'>&nbsp;</span><br>"
        else if char is ' '
          html += "<span class='char icon-level-up'>&nbsp;</span>"
        else
          html += "<span class='char'>" + char + "</span>"
      html

  new Code()
]
