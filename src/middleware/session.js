const session = require("express-session");
const pgSession = require('connect-pg-simple')(session);
const { Client } = require("pg");

const client = new Client(process.env.PG_url);
client.connect();

const sessionMiddleware = session({
  store: new pgSession({
    pool : client,                // Instance de connexion à la BDD
    tableName : 'user_sessions',   // Use another table-name than the default "session" one
    createTableIfMissing : true
  }),
  secret: 'sapristi', // Quand on gènère l'ID de la session, on utilise un seed different afin de rendre plus difficile de deviner les uuid de session
  resave: false, // Pas la peine de réenregistrer la session s'il n'y a pas eu de changement dans l'objet
  saveUninitialized: true, // Enregistre les infos de la session même s'il n'y a rien dedans
  cookie: { 
    secure: process.env.NODE_ENV === "prod", // On fait du HTTP pour le moment, donc secure false
   maxAge: 30 * 24 * 60 * 60 * 1000 // 30 jours
  } 
});

module.exports = sessionMiddleware;