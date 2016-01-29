angular = require 'angular'
require 'angular-scroll'
require 'angular-chart.js'
require 'angular-filter'
require 'angular-local-storage'

app = require('angular').module('typr', [
  require 'angular-ui-router'
  require 'angular-sanitize'
  require 'angular-bootstrap-npm'
  require 'angular-resource'
  'duScroll'
  'chart.js'
  'angular.filter'
  'LocalStorageModule'
  require 'angular-moment'
])
app.config require './routes'
app.config [
  'ChartJsProvider'
  'localStorageServiceProvider'
  (
    ChartJsProvider
    localStorageServiceProvider
  ) ->
    ChartJsProvider.setOptions
      animation: false
      showTooltips: false

    localStorageServiceProvider
      .setPrefix 'typr'
]
require './typing'
require './upload'
require './code'
require './snippits'
require './reports'
require './header'
require './about'
require './main'
require './button'
require './profile'
require './login'
require './logout'
require './util'

app.run [
  'LoginService'
  '$rootScope'
  (
    LoginService
    $rootScope
  ) ->
    LoginService.verify()

    $rootScope.isLoggedIn = ->
      LoginService.isLoggedIn()
]
