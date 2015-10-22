require './routes'
require './models/snippit'
require('./sequelize').sync().then ->
  require('./app').listen 8081
