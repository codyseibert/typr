Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  User = sequelize.define 'user',
    email: Sequelize.STRING
    password: Sequelize.STRING
  User
