mongoose = require 'mongoose'
mongoose.Promise = require 'bluebird'
mongoose.connect 'mongodb://localhost/typr'
mongoose
