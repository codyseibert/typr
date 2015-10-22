var Sequelize;

Sequelize = require('sequelize');

module.exports = (function() {
  return new Sequelize('recipe', 'root', 'testing', {
    host: 'localhost'
  });
})();
