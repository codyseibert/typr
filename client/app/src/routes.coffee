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

    .state 'main.logout',
      url: 'logout'
      views:
        'page':
          controller: 'LogoutCtrl'
          templateUrl: 'logout/logout.html'

    .state 'main.login',
      url: 'login'
      views:
        'page':
          controller: 'LoginCtrl'
          templateUrl: 'login/login.html'

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

    .state 'main.recent',
      url: 'recent'
      views:
        'page':
          controller: 'RecentCtrl'
          templateUrl: 'recent/recent.html'

    .state 'main.favorites',
      url: 'favorites'
      views:
        'page':
          controller: 'FavoritesCtrl'
          templateUrl: 'favorites/favorites.html'

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
