var Report, Snippit, User;

require('./routes');

Snippit = require('./models/snippit');

Report = require('./models/report');

User = require('./models/user');

User.hasMany(Report);

Snippit.hasMany(Report);

Report.belongsTo(User);

Report.belongsTo(Snippit);

require('./sequelize').sync().then(function() {
  return require('./app').listen(8081);
});
