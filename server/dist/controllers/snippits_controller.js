var ObjectId, Snippits, classifier, lodash, log4js, logger, models;

models = require('../models/models');

Snippits = models.Snippits;

ObjectId = require('mongoose').Types.ObjectId;

lodash = require('lodash');

classifier = require('language-classifier');

log4js = require('log4js');

logger = log4js.getLogger('app');

module.exports = (function() {
  return {
    index: function(req, res) {
      return Snippits.find().then(function(obj) {
        res.status(200);
        return res.send(obj);
      });
    },
    show: function(req, res) {
      return Snippits.findById(req.params.id).then(function(obj) {
        res.status(200);
        return res.send(obj);
      });
    },
    post: function(req, res) {
      req.body.user_id = req.user._id;
      req.body.language = classifier(req.body.code);
      return Snippits.create(req.body).then(function(obj) {
        res.status(200);
        return res.send(obj);
      });
    },
    put: function(req, res) {
      return Snippits.update({
        _id: new ObjectId(req.params.id)
      }, req.body).then(function(obj) {
        res.status(200);
        return res.send(obj);
      });
    },
    destroy: function(req, res) {
      return Snippits.findById(req.params.id).remove().then(function(obj) {
        res.status(200);
        return res.send(obj);
      });
    }
  };
})();
