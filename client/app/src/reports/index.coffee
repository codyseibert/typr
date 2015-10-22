app = require('angular').module 'typr'

app.controller 'ReportsCtrl', require './reports_controller'
app.controller 'ModalCtrl', require './modal_controller'
app.service 'reportsService', require './reports_service'
