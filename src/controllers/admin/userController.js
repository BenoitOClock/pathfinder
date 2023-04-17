const validator = require("validator");
const bcrypt = require("bcrypt");
const { User } = require("../../models/index");

const userController = {
  renderSignupPage(req, res) {
    res.render("admin/signup", { meta: "Inscription" });
  },
  renderLoginPage(req, res) {
    const successMessage = req.session.message;
    req.session.message = null;
    res.render("admin/login", { meta: "Connexion", successMessage });
  },
  renderProfilPage(req, res) {
    // On vérif que le user est connecté (via la session)
    const user = req.user;
    if (!user) {
      return res.status(401).render("error/401");
    }
    res.render("admin/profil", { meta: "Mon profil" });
  },
  async actionSignup(req, res) {
    //* On recup les infos du formulaire
    const { firstname, password, confirmation } = req.body;

    //! ===== VALIDATION DES DONNEES ====
    //* 1- On vérifie que tout est bien renseigné
    if (!firstname || !password || !confirmation) {
      return res.render("admin/signup", {
        errorMessage: "Veuillez renseigner tous les champs",
      });
    }

    //* 2- vérif confirmation du mdp
    if (password !== confirmation) {
      return res.render("admin/signup", {
        errorMessage:
          "Le mot de passe et sa confirmation ne correspondent pas.",
      });
    }

    //* 3- vérif que le mdp est assez fort
    if (!validator.isStrongPassword(password)) {
      return res.render("admin/signup", {
        errorMessage: "Veuillez renseigner un mot de passe plus fort",
      });
    }

    //* 5- Vérif l'email est libre en DB
    const existingUser = await User.findOne({ where: { firstname: firstname } });
    if (existingUser) {
      return res.render("admin/signup", {
        errorMessage: "Ce pseudo est déjà utilisé.",
      });
    }

    //? ===== INSERTION DU USER ====
    // PS : parti pris : après le signup, l'utilisateur doit TOUT DE MEME se LOGIN manuellement.

    //* 7- On hash le mot de passe grace à bcrypt
    const saltRounds = parseInt(process.env.SALT_ROUNDS); // Généralement 10 et planqué pour éviter que qqun tombe sur le code.
    const hashedPassword = await bcrypt.hash(password, saltRounds);

    //* 8- Enrigstrement du nouvel user en DB
    await User.create({ firstname, password: hashedPassword });

    //* 9- On redirige sur la page de connexion
    // On redirige vers la page de login pour que l'utilisateur fraichement inscrit puisse se connecter
    req.session.message =
      `Vous êtes bien enregistré.
      Veuillez maintenant vous authentifier.`;
    res.redirect("/login");
  },
  async actionLogin(req, res) {
    //* On récupère les inputs (email, password)
    const { firstname, password } = req.body;

    //* 1. On peut vérifier la présence de l'email et du password
    if (!firstname || !password) {
      res.render("admin/login", {
        errorMessage: "Identifiant ou mot de passe incorrect.",
      });
      return;
    }

    //* 2. On récupère l'utilisateur par son email dans la BDD (avec son mot de passe hashé).
    const user = await User.findOne({
      where: { firstname },
      // attributes: ["id", "password"]
    });

    //* 3. S'il y a pas d'utilisateur, on l'indique à notre client. =>  "identifiants ou mot de passe incorrect"
    if (!user) {
      res.render("admin/login", {
        errorMessage: "Identifiant ou mot de passe incorrect.",
      });
      return;
    }

    //* 4. On compare le 'password' (fourni par le user) avec le mot de passe hashé (stockée en BDD) ('user.password')
    const isMatching = await bcrypt.compare(password, user.password);

    //* 5. Si différent
    if (!isMatching) {
      res.render("admin/login", {
        errorMessage: "Identifiant ou mot de passe incorrect.",
      });
      return;
    }

    //* 6. SI OK (ie. l'utilisateur et le mot de passe sont correcte)
    // On stocke les données de utilisateur courant dans la boite de l'utilisateur (req.session.user = USER{ ... })
    // Si, quand qqun fait une requête, SI dans sa session il y a un userID, ça veut dire qu'il est authentifié
    req.session.userId = user.id; // Je PEUX rajouter tout l'user, mais pour des soucis de "NON REDONDANCE DES DONNEES" je ne stock que l'ID

    //* Rediriger vers la home page
    res.redirect("/");
  },
  actionLogout(req, res) {
    req.session.userId = null;
    res.redirect("/");
  },
  async actionDelete(req, res) {
    const id = res.locals.user.id;
    const user = await User.findByPk(id);
    try {
      await user.destroy();
      req.session.message =`Votre compte a bien été supprimé`;
      res.redirect("/");
    } catch (error) {
      console.log(error);
      res.status(500).send("Server Error");
    }
  }
};

module.exports = userController;
