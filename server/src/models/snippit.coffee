Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  Snippit = sequelize.define 'snippit',
    name: Sequelize.STRING
    code: Sequelize.TEXT
    type: Sequelize.STRING
  Snippit
