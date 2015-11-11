require './routes'
Snippit = require './models/snippit'
Report = require './models/report'
User = require './models/user'

User.hasMany Report
Snippit.hasMany Report
Report.belongsTo User
Report.belongsTo Snippit

# User.create
#   email: 'test'
#   password: 'test'

require('./sequelize').sync().then ->
  require('./app').listen 8081
