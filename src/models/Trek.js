const { DataTypes, Model } = require('sequelize');

const sequelize = require('../client/client');


class Trek extends Model {} 

Trek.init({ 


  name : {
    type: DataTypes.STRING,
    allowNull: false,
   },
   time_length : {
    type: DataTypes.STRING,
    allowNull: false,
   },
   distance : {
    type: DataTypes.INTEGER,
    allowNull: false,
   },
   max_height : {
    type: DataTypes.INTEGER,
    allowNull: false,
   },
   min_height : {
    type: DataTypes.INTEGER,
    allowNull: false,
   },
   denivele : {
    type: DataTypes.INTEGER,
    allowNull: false,
   },
   start_point : {
    type: DataTypes.STRING,
    allowNull: false,
   },
   gps_coordonate : {
    type: DataTypes.STRING,
    allowNull: false,
   },
   gpx : {
    type: DataTypes.STRING,
    allowNull: false,
   },
   description : {
    type: DataTypes.TEXT,
    allowNull: false,
   },
   resume : {
    type: DataTypes.TEXT,
    allowNull: false,
   },
   boucle : {
    type: DataTypes.STRING,
    allowNull: false,
   },
   map : {
    type: DataTypes.TEXT,
    allowNull: false,
   }
}, {
  sequelize,
  tableName: 'trek', 
});

module.exports = Trek; 