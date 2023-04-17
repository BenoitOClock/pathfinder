const { DataTypes, Model } = require('sequelize');

const sequelize = require('../client/client');


class Difficulty extends Model {}

Difficulty.init({
  name : {
    type: DataTypes.STRING,
    allowNull: false,
   }
}, {
  sequelize,
  tableName: 'difficulty',
});

module.exports = Difficulty;
