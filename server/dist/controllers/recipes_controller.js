var Promise, Recipe, _;

Promise = require('bluebird');

Recipe = require('../models/recipe');

_ = require('underscore');

module.exports = (function() {
  var destroy, index, post, put, show;
  index = function(req, res) {
    return Recipe.findAll({
      where: req.query
    }).then(function(recipes) {
      res.status(200);
      return res.send(recipes);
    });
  };
  show = function(req, res) {
    return Recipe.findById(req.params.id).then(function(recipe) {
      res.status(200);
      return res.send(recipe);
    });
  };
  put = function(req, res) {
    return Recipe.findById(req.params.id).then(function(recipe) {
      recipe = _.extend(recipe, req.body);
      return recipe.save().then(function() {
        res.status(200);
        return res.send(recipe);
      });
    });
  };
  post = function(req, res) {
    return Recipe.create(req.body).then(function(recipe) {
      return Recipe.findById(recipe.id).then(function(recipe) {
        res.status(200);
        return res.send(recipe);
      });
    });
  };
  destroy = function(req, res) {
    return Recipe.findById(req.params.id).then(function(recipe) {
      if (recipe == null) {
        res.status(400);
        return res.send('recipe not found');
      } else {
        return recipe.destroy().then(function(recipe) {
          res.status(200);
          return res.send(recipe);
        });
      }
    });
  };
  return {
    index: index,
    show: show,
    put: put,
    post: post,
    destroy: destroy
  };
})();
