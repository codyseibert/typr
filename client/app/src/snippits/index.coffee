app = require('angular').module 'typr'

app.service 'snippitsService', require './snippits_service'

app.controller 'SnippitsCtrl', require './snippits_controller'
