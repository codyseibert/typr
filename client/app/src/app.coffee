angular = require 'angular'

app = require('angular').module('recipes', [
  require 'angular-ui-router'
  require 'angular-sanitize'
])
app.config require './routes'

require './recipes'
require './model'
require './editable'
