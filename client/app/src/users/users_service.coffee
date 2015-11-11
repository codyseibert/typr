_ = require 'underscore'

module.exports = [
  'HttpHelper'
  (
    HttpHelper
  ) ->

    index = ->
      HttpHelper '/users'

    show = ->
      HttpHelper "/users/#{user.id}"

    post = (user) ->
      HttpHelper '/users', 'post', user

    index: index
    show: show
    post: post

]
