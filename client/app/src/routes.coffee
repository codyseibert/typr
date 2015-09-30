module.exports = (
  $stateProvider,
  $urlRouterProvider
) ->
  $urlRouterProvider.otherwise '/'

  $stateProvider
    .state 'main',
      url: '/'
      views:
        'main':
          controller: 'MainCtrl'
          templateUrl: 'main/main.html'

    .state 'main.about',
      url: 'about'
      views:
        'page':
          controller: 'AboutCtrl'
          templateUrl: 'about/about.html'

    .state 'main.snippits',
      url: 'snippits'
      views:
        'page':
          controller: 'SnippitsCtrl'
          templateUrl: 'snippits/snippits.html'

    .state 'main.profile',
      url: 'profile'
      views:
        'page':
          controller: 'ProfileCtrl'
          templateUrl: 'profile/profile.html'

    .state 'main.global',
      url: 'global'
      views:
        'page':
          controller: 'GlobalCtrl'
          templateUrl: 'global/global.html'

  return this
