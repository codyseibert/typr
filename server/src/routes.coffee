app = require('./app')

recipesController = require('./controllers/recipes_controller')

module.exports = do ->
  app.get '/recipes', recipesController.index
  app.get '/recipes/:id', recipesController.show
  app.post '/recipes', recipesController.post
  app.put '/recipes/:id', recipesController.put
  app.delete '/recipes/:id', recipesController.destroy
