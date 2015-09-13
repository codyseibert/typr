module.exports = (
  $stateProvider,
  $urlRouterProvider
) ->
  $urlRouterProvider.otherwise '/typing'

  $stateProvider
    .state 'typing',
      url: '/typing'
      views:
        'main':
          controller: 'TypingCtrl'
          templateUrl: 'typing/typing.html'

    .state 'upload',
      url: '/upload'
      views:
        'main':
          controller: 'UploadCtrl'
          templateUrl: 'upload/upload.html'

  return this
