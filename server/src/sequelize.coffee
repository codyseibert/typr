Sequelize = require 'sequelize'
module.exports = do ->
  new Sequelize 'typr', 'typr', 'test',
    host: '192.168.1.11'
