_ = require 'underscore'

module.exports = [
  'HttpHelper'
  (
    HttpHelper
  ) ->

    index = ->
      HttpHelper '/snippits'

    post = (snippit) ->
      HttpHelper '/snippits', 'post', snippit

    index: index
    post: post

]
