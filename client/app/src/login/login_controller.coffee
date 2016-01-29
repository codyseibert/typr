module.exports = [
  '$scope'
  'LoginService'
  '$http'
  'Base64'
  'localStorageService'
  (
    $scope
    LoginService
    $http
    Base64
    localStorageService
  ) ->

    reset = ->
      $scope.email = ''
      $scope.password = ''
    reset()

    $scope.login = ->
      creditials =
        email: $scope.email
        password: $scope.password

      LoginService.login(creditials).then ->
        reset()

]
