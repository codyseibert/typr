app = require('angular').module 'typr'

app.directive 'typrTyping', require './typing_directive'
app.controller 'TypingModalCtrl', require './typing_modal_controller'
