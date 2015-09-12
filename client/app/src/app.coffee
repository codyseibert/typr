app = require('angular').module('typr', [
  require 'angular-ui-router'
])

app.config require './routes'

require './type'
