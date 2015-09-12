module.exports = (
  $stateProvider,
  $urlRouterProvider
) ->
  $urlRouterProvider.otherwise '/'

  $stateProvider
    .state 'type',
      url: '/'
      views:
        'main':
          controller: 'TypeCtrl'
          templateUrl: 'type/type.html'

  return this
