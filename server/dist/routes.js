var app, snippitsCtrl;

app = require('./app');

snippitsCtrl = require('./controllers/snippits_controller');

module.exports = (function() {
  app.get('/snippits', snippitsCtrl.index);
  app.get('/snippits/:id', snippitsCtrl.show);
  app.post('/snippits', snippitsCtrl.post);
  app.put('/snippits/:id', snippitsCtrl.put);
  return app["delete"]('/snippits/:id', snippitsCtrl.destroy);
})();
