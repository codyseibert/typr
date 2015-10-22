Sequelize = require 'sequelize'
module.exports = do ->
  new Sequelize 'recipe', 'root', 'testing',
    host: 'localhost'
