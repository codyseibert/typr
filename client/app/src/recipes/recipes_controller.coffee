module.exports = [
  '$scope'
  'RecipesService'
  (
    $scope
    RecipesService
  ) ->

    $scope.attributes =
      name: true
      title: true
      directions: true
      ingredients: true
      description: true
      servings: true
      juice: true
      image: true

    RecipesService.getAll()
      .then (recipes) ->
        $scope.recipes = recipes

    $scope.update = (recipe) ->
      RecipesSerivce.update recipe

    $scope.newRecipe = ->
      RecipesService.create()
        .then (recipe) ->
          $scope.recipes.push recipe

    $scope.$on 'delete', (evt, recipe) ->
      $scope.recipes.splice $scope.recipes.indexOf(recipe), 1

]
