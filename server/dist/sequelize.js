var Sequelize;

Sequelize = require('sequelize');

module.exports = (function() {
  return new Sequelize('typr', 'root', 'testing', {
    host: 'localhost'
  });
})();
