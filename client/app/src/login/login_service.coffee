
module.exports = [
  '$resource'
  '$http'
  '$state'
  'BACKEND_URL'
  'localStorageService'
  'Base64'
  (
    $resource
    $http
    $state
    BACKEND_URL
    localStorageService
    Base64
  ) ->
    Login = $resource "#{BACKEND_URL}/login"

    AUTHORIZATION = 'authorization'
    LOGIN_REDIRECT = 'main.login'
    AFTER_LOGIN_REDIRECT = 'main.snippits'
    LOGOUT_REDIRECT = 'main.snippits'
    loggedIn = false

    isLoggedIn: ->
      loggedIn

    logout: ->
      loggedIn = false
      localStorageService.remove AUTHORIZATION
      delete $http.defaults.headers.common.Authorization
      $state.go LOGOUT_REDIRECT

    login: (creditials) ->
      Login.save(creditials).$promise.then (res) ->
        encoded = Base64.encode "#{creditials.email}:#{creditials.password}"
        basic = "Basic #{encoded}"
        localStorageService.set AUTHORIZATION, basic
        $http.defaults.headers.common.Authorization = basic
        loggedIn = true
        $state.go AFTER_LOGIN_REDIRECT

    verify: ->
      if (basic = localStorageService.get AUTHORIZATION)?
        console.log basic
        $http.defaults.headers.common.Authorization = basic
        loggedIn = true
        $state.go AFTER_LOGIN_REDIRECT
      else
        $state.go LOGIN_REDIRECT
  ]
