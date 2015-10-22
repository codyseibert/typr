module.exports = [
  '$q'
  '$http'
  (
    $q
    $http
  ) ->

    baseUrl = 'http://192.168.1.19:8081'

    @getAll = ->
      $q (resolve, reject) ->
        $http.get "#{baseUrl}/recipes", {}
          .success (recipes) ->
            resolve recipes

    @update = (recipe) ->
      $q (resolve, reject) ->
        $http.put "#{baseUrl}/recipes/#{recipe.id}", recipe
          .success (recipe) ->
            resolve recipe

    @delete = (recipe) ->
      $q (resolve, reject) ->
        $http.delete "#{baseUrl}/recipes/#{recipe.id}", {}
          .success (recipe) ->
            resolve recipe

    @create = ->
      $q (resolve, reject) ->
        $http.post "#{baseUrl}/recipes", {}
          .success (recipe) ->
            console.log recipe
            resolve recipe

    return this

]
