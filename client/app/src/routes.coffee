module.exports = (
  $stateProvider,
  $urlRouterProvider
) ->
  $urlRouterProvider.otherwise '/reports'

  $stateProvider
    .state 'reports',
      url: '/reports'
      views:
        'main':
          controller: 'ReportsCtrl'
          templateUrl: 'reports/reports.html'

  return this
