module.exports = (
  $stateProvider,
  $urlRouterProvider
) ->
  $urlRouterProvider.otherwise '/reports'

  $stateProvider
    .state 'typing',
      url: '/typing'
      views:
        'main':
          controller: 'TypingCtrl'
          templateUrl: 'typing/typing.html'

    .state 'reports',
      url: '/reports'
      views:
        'main':
          controller: 'ReportsCtrl'
          templateUrl: 'reports/reports.html'

  return this
