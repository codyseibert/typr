app = require('angular').module 'typr'

app.controller 'LoginCtrl', require './login_controller'
app.service 'LoginService', require './login_service'
