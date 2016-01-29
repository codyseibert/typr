var LoginCtrl, ReportsCtrl, SnippitsCtrl, UsersCtrl, app, auth;

app = require('./app');

SnippitsCtrl = require('./controllers/snippits_controller');

UsersCtrl = require('./controllers/users_controller');

ReportsCtrl = require('./controllers/reports_controller');

LoginCtrl = require('./controllers/login_controller');

auth = require('./helpers/auth');

module.exports = (function() {
  app.get('/snippits', SnippitsCtrl.index);
  app.get('/snippits/:id', SnippitsCtrl.show);
  app.post('/snippits', auth, SnippitsCtrl.post);
  app.put('/snippits/:id', SnippitsCtrl.put);
  app["delete"]('/snippits/:id', SnippitsCtrl.destroy);
  app.get('/users', UsersCtrl.index);
  app.get('/users/:id', UsersCtrl.show);
  app.post('/users', UsersCtrl.post);
  app.put('/users/:id', UsersCtrl.put);
  app["delete"]('/users/:id', UsersCtrl.destroy);
  app.get('/reports', ReportsCtrl.index);
  app.get('/reports/:id', ReportsCtrl.show);
  app.post('/reports', auth, ReportsCtrl.post);
  app.put('/reports/:id', ReportsCtrl.put);
  app["delete"]('/reports/:id', ReportsCtrl.destroy);
  return app.post('/login', LoginCtrl.post);
})();
