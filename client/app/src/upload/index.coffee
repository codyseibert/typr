app = require('angular').module 'typr'

app.directive 'typrUpload', require './upload_directive'
app.controller 'UploadModalCtrl', require './upload_modal_controller'
