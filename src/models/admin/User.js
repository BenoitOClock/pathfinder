const { Model, DataTypes } = require("sequelize");
const sequelize = require("../../client/client");

class User extends Model {}

User.init({
  firstname: {
    type: DataTypes.STRING,
    allowNull: false
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false
  },
  role: {
    type: DataTypes.STRING,
    defaultValue: "user",
  }
}, {
  sequelize,
  tableName: "user_table"
});


module.exports = User;
