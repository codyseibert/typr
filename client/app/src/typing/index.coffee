app = require('angular').module 'typr'

app.controller 'TypingCtrl', require './typing_controller'
app.directive 'typrTyping', require './typing_directive'
