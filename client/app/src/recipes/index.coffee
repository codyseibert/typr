app = require('angular').module 'recipes'

app.controller 'RecipesController', require './recipes_controller'
app.service 'RecipesService', require './recipes_service'
