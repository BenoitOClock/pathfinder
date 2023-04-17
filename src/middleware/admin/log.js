// Middleware pour insérer dans la base de donnée des informations de visiteurs
// la date de la visite, l'url de la page visitée et l'ip du visiteur
// Il faut une table "log" dans la base de donnée

const { Log } = require("../../models/index");


// A décommenter si base de donnée active

const log = async function(req, res, next){
    try {
      const logValues = await Log.create({
        time: new Date(),
        url: req.url,
        ip: req.ip
      });
      next();
    } catch (error) {
      console.error(error);
      next(error);
    }
  };

module.exports = log
