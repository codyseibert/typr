module.exports = [
  '$scope'
  (
    $scope
  ) ->

    class Link
      constructor: (title, state, icon) ->
        @title = title
        @state = state
        @icon = icon

    $scope.links = [
      new Link 'Snippits', 'main.snippits', 'glyphicon glyphicon-th'
      new Link 'Global', 'main.global', 'glyphicon glyphicon-globe'
      new Link 'Profile', 'main.profile', 'glyphicon glyphicon-user'
      new Link 'About', 'main.about', 'glyphicon glyphicon-info-sign'
    ]

]
