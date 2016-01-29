module.exports = [
  '$state'
  '$filter'
  '$rootScope'
  (
    $state
    $filter
    $rootScope
  ) ->
    restrict: 'E'

    templateUrl: 'header/header.html'

    scope:
      links: '='

    link: (scope, elem, attr) ->

      scope.select = (link) ->
        angular.forEach scope.links, (link) ->
          link.selected = false
        link.selected = true

      scope.isLoggedIn = $rootScope.isLoggedIn
      # scope.select $filter('filter')(scope.links, state: $state.$current.name)[0]

  ]
