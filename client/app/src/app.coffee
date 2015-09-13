

angular = require 'angular'
require 'angular-scroll'

app = require('angular').module('typr', [
  require 'angular-ui-router'
  require 'angular-sanitize'
  require 'angular-bootstrap-npm'
  'duScroll'
])
app.config require './routes'
require './typing'
require './upload'
require './code'
