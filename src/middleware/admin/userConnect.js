const { User } = require("../../models");

// Un petit middleware pour tester si un utilisateur est connecté
// Si c'est le cas, on le rajoute dans res.locals
// ce qui nous permettra d'utiliser la variable "user" dans toutes les views sans se poser de questions

const userConnect = async (req, res, next) => {
  if (req.session.userId) {
    const userId = parseInt(req.session.userId);
    const user = await User.findByPk(userId, { attributes: { exclude: ["password"] } }); // On récupère tout le user sauf son mdp
    req.user = user; // - on met le user dans `req` (=> objectif, tous les controlleurs suivant auront accès à req.user)
    res.locals.user = user; // - on met le user dans `res.locals` (=> objectif, toutes les views auront accès à locals.user)
  }

  next(); // On passe la main à la suite du programme
};


module.exports = userConnect;
