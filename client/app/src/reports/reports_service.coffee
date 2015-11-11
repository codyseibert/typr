_ = require 'underscore'

module.exports = [
  'HttpHelper'
  (
    HttpHelper
  ) ->

    index = ->
      HttpHelper '/reports'

    show = (id) ->
      HttpHelper "/reports/#{id}"

    post = (report) ->
      HttpHelper '/reports', 'post', report

    remove = (report) ->
      HttpHelper "/reports/#{id}", 'delete'

    index: index
    show: show
    post: post
    delete: remove
]
