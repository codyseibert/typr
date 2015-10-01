var bodyParser, cors, express;

express = require('express');

bodyParser = require('body-parser');

cors = require('cors');

module.exports = (function() {
  var app;
  app = express();
  app.use(bodyParser.json());
  app.use(cors());
  return app;
})();
