app = require('./app')

snippitsCtrl = require './controllers/snippits_controller'
reportsCtrl = require './controllers/reports_controller'
usersCtrl = require './controllers/users_controller'

auth = require('./middleware/auth')

module.exports = do ->
  app.get '/snippits', snippitsCtrl.index
  app.get '/snippits/:id', snippitsCtrl.show
  app.post '/snippits', snippitsCtrl.post
  app.put '/snippits/:id', snippitsCtrl.put
  app.delete '/snippits/:id', snippitsCtrl.destroy

  app.get '/reports', reportsCtrl.index
  app.get '/reports/:id', reportsCtrl.show
  app.post '/reports', auth, reportsCtrl.post
  app.delete '/reports/:id', reportsCtrl.destroy

  app.get '/users', usersCtrl.index
  app.get '/users/:id', usersCtrl.show
  app.post '/users', usersCtrl.post
