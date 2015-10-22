var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var Recipe;
  Recipe = sequelize.define('recipe', {
    name: Sequelize.STRING,
    title: Sequelize.STRING,
    directions: Sequelize.TEXT,
    ingredients: Sequelize.TEXT,
    description: Sequelize.TEXT,
    servings: Sequelize.INTEGER,
    juice: Sequelize.STRING,
    image: Sequelize.STRING
  });
  return Recipe;
})();
