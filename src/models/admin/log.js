const { DataTypes, Model } = require("sequelize");

const sequelize = require("../../client/client");

class Log extends Model {} // Remplacer les `___` par le nom de la class à creer

Log.init(
  {
    // Remplacer les `___` par le nom de la class à creer
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    url: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    time: {
      type: DataTypes.TIME,
      allowNull: false,
    },
    ip: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    sequelize,
    tableName: "log_table", // Remplacer les `___` par le nom de la class à creer
  }
);

module.exports = Log; // Remplacer les `___` par le nom de la class à creer
