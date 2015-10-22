require('./routes');

require('./models/snippit');

require('./sequelize').sync().then(function() {
  return require('./app').listen(8081);
});
