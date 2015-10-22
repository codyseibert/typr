var app, recipesController;

app = require('./app');

recipesController = require('./controllers/recipes_controller');

module.exports = (function() {
  app.get('/recipes', recipesController.index);
  app.get('/recipes/:id', recipesController.show);
  app.post('/recipes', recipesController.post);
  app.put('/recipes/:id', recipesController.put);
  return app["delete"]('/recipes/:id', recipesController.destroy);
})();
