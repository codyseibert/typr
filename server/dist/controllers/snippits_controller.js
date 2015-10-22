var Promise, Snippit, _;

Promise = require('bluebird');

Snippit = require('../models/snippit');

_ = require('underscore');

module.exports = (function() {
  var TYPE_REGEX, destroy, getType, index, post, put, show, stripType;
  index = void 0;
  show = void 0;
  post = void 0;
  put = void 0;
  destroy = void 0;
  TYPE_REGEX = /_([a-z]+)_/g;
  getType = function(code) {
    var matches;
    matches = TYPE_REGEX.exec(code);
    if (matches && matches.length > 0) {
      return matches[1];
    } else {
      return 'magic';
    }
  };
  stripType = function(code) {
    return code.replace(TYPE_REGEX, '');
  };
  index = function(req, res) {
    return Snippit.findAll({
      where: req.query
    }).then(function(tasks) {
      res.status(200);
      return res.send(tasks);
    });
  };
  show = function(req, res) {
    return Snippit.findById(req.params.id).then(function(task) {
      res.status(200);
      return res.send(task);
    });
  };
  put = function(req, res) {
    return Snippit.findById(req.params.id).then(function(task) {
      task = _.extend(task, req.body);
      return task.save().then(function() {
        res.status(200);
        return res.send(task);
      });
    });
  };
  post = function(req, res) {
    req.body.type = getType(req.body.code);
    req.body.code = stripType(req.body.code);
    return Snippit.create(_.pick(req.body, ['name', 'code', 'type'])).then(function(task) {
      res.status(200);
      return res.send(task);
    });
  };
  destroy = function(req, res) {
    return Snippit.findById(req.params.id).then(function(task) {
      if (task == null) {
        res.status(400);
        return res.send('snippit not found');
      } else {
        return task.destroy().then(function(task) {
          res.status(200);
          return res.send(task);
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
