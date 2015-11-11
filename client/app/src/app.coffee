angular = require 'angular'
require 'angular-scroll'
require 'angular-filter'
require 'angular-chart.js'


app = require('angular').module('typr', [
  require 'angular-ui-router'
  require 'angular-sanitize'
  require 'angular-bootstrap-npm'
  'duScroll'
  'chart.js'
  'angular.filter'
  require 'angular-moment'
])
app.config require './routes'
app.config [
  '$httpProvider'
  'ChartJsProvider'
  (
    $httpProvider
    ChartJsProvider
  ) ->
    ChartJsProvider.setOptions
      animation: false
      showTooltips: false
]

app.service 'HttpHelper', [
  '$q'
  '$http'
  (
    $q
    $http
  ) ->

    (url = '', method = 'get', data = {}) ->
      deferred = $q.defer()
      $http.defaults.headers.common['Authorization'] = 'Basic dGVzdDp0ZXN0==';
      $http[method] "http://localhost:8081#{url}", data
        .then (ret) ->
          deferred.resolve ret.data
      deferred.promise
]

require './typing'
require './upload'
require './code'
require './global'
require './snippits'
require './reports'
require './header'
require './about'
require './main'
require './button'
require './profile'
