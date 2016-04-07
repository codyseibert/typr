app = require('angular').module 'typr'

app.controller 'FavoritesCtrl', require './favorites_controller'
app.service 'favoritesService', require './favorites_service'
