require './routes'
require './models/recipe'
require('./sequelize').sync().then ->
  require('./app').listen 8081
