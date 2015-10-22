Promise = require 'bluebird'
Recipe = require '../models/recipe'
_ = require 'underscore'

module.exports = do ->

  index = (req, res) ->
    Recipe.findAll where: req.query
      .then (recipes) ->
        res.status 200
        res.send recipes

  show = (req, res) ->
    Recipe.findById req.params.id
      .then (recipe) ->
        res.status 200
        res.send recipe

  put = (req, res) ->
    Recipe.findById req.params.id
      .then (recipe) ->
        recipe = _.extend recipe, req.body
        recipe.save().then ->
          res.status 200
          res.send recipe

  post = (req, res) ->
    Recipe.create req.body
      .then (recipe) ->
        Recipe.findById recipe.id
          .then (recipe) ->
            res.status 200
            res.send recipe

  destroy = (req, res) ->
    Recipe.findById req.params.id
      .then (recipe) ->
        if not recipe?
          res.status 400
          res.send 'recipe not found'
        else
          recipe.destroy().then (recipe) ->
            res.status 200
            res.send recipe

  index: index
  show: show
  put: put
  post: post
  destroy: destroy
