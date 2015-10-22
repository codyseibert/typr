Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  Recipe = sequelize.define 'recipe',
    name: Sequelize.STRING
    title: Sequelize.STRING
    directions: Sequelize.TEXT
    ingredients: Sequelize.TEXT
    description: Sequelize.TEXT
    servings: Sequelize.INTEGER
    juice: Sequelize.STRING
    image: Sequelize.STRING

  Recipe
