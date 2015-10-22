var Sequelize, sequelize;

Sequelize = require('sequelize');

sequelize = require('../sequelize');

module.exports = (function() {
  var Snippit;
  Snippit = sequelize.define('snippit', {
    name: Sequelize.STRING,
    code: Sequelize.TEXT,
    type: Sequelize.STRING
  });
  return Snippit;
})();
