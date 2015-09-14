angular = require 'angular'
require 'angular-scroll'

app = require('angular').module('typr', [
  require 'angular-ui-router'
  require 'angular-sanitize'
  require 'angular-bootstrap-npm'
  'duScroll'
  require 'angular-moment'
])
app.config require './routes'
require './typing'
require './upload'
require './code'
require './snippits'
require './reports'
