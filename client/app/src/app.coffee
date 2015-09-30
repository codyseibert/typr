angular = require 'angular'
require 'angular-scroll'
require 'angular-chart.js'

app = require('angular').module('typr', [
  require 'angular-ui-router'
  require 'angular-sanitize'
  require 'angular-bootstrap-npm'
  'duScroll'
  'chart.js'
  require 'angular-moment'
])
app.config require './routes'
app.config [
  'ChartJsProvider'
  (
    ChartJsProvider
  ) ->
    ChartJsProvider.setOptions
      animation: false
      showTooltips: false
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
