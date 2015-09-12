app = require('angular').module 'typr'

app.controller 'UploadCtrl', require './upload_controller'
app.directive 'typrUpload', require './upload_directive'


# upload is jacked up
