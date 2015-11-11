Sequelize = require 'sequelize'
sequelize = require '../sequelize'

module.exports = do ->
  Report = sequelize.define 'report',
    averageTokenLength: Sequelize.DECIMAL
    charsPerMin: Sequelize.INTEGER
    tokensPerMin: Sequelize.INTEGER
    secElapsed: Sequelize.INTEGER
    accuracy: Sequelize.DECIMAL
    strokes: Sequelize.INTEGER
    correct: Sequelize.INTEGER
    date: Sequelize.DATE
  Report
