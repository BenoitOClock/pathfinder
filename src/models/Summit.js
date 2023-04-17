const { DataTypes, Model } = require('sequelize');

const sequelize = require('../client/client');


class Summit extends Model {}

Summit.init({


  name : {
    type: DataTypes.STRING,
    allowNull: false,
   }
}, {
  sequelize,
  tableName: 'summit',
});

module.exports = Summit;