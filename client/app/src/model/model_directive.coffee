module.exports = [
  'RecipesService'
  (
    RecipesService
  ) ->

    restrict: 'E'

    scope:
      model: '='
      key: '@'
      display: '@'
      attributes: '='

    link: (scope, elem, attr) ->

      scope.expanded = {}

      scope.toggle = (model) ->
        scope.expanded[model[scope.key]] = not scope.expanded[model[scope.key]]

      scope.save = (model) ->
        RecipesService.update model

      scope.delete = (model) ->
        RecipesService.delete model
        scope.$emit 'delete', model

    templateUrl: 'model/model.html'
]
