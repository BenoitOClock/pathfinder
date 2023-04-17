// Remplacer le class1 par les modeles de classe disponible
const Log = require('./admin/log')
const User = require('./admin/User')

const Difficulty = require('./Difficulty')
const Summit = require('./Summit')
const Trek = require('./Trek');
const Tag = require('./Tag');



// Associatins

Summit.hasMany(Trek, {
    foreignKey: "summit_id",
    as: "treks"
  });
Trek.belongsTo(Summit, {
    foreignKey: "summit_id",
    as: "summit"
  });


Difficulty.hasMany(Trek, {
    foreignKey: "difficulty_id",
    as: "treks"
  });
Trek.belongsTo(Difficulty, {
    foreignKey: "difficulty_id",
    as: "difficulty"
  });


  Trek.belongsToMany(Tag, {
    through: 'tag_has_trek',
    as: "tags",
    foreignKey: "trek_id",
    otherKey: "tag_id"
  });
  Tag.belongsToMany(Trek, {
    through: 'tag_has_trek',
    as: "treks",
    foreignKey: "tag_id",
    otherKey: "trek_id"
  });
  






module.exports = {
    Log,
    User,
    Trek,
    Difficulty,
    Summit,
    Tag
};

