var Sequelize;

Sequelize = require('sequelize');

module.exports = (function() {
  return new Sequelize('typr', 'typr', 'test', {
    host: '192.168.1.11'
  });
})();
