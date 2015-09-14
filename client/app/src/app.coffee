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
require './typing'
require './upload'
require './code'
require './snippits'
require './reports'
