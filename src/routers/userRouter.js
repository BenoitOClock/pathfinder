const { Router } = require("express");
const userController = require("../controllers/admin/userController.js");
const bookmarkController = require('../controllers/bookmarkController.js');

const router = Router();

// Gestion inscription/connexion
router.get('/signup', userController.renderSignupPage);
router.post('/signup', userController.actionSignup);

router.get('/login', userController.renderLoginPage);
router.post('/login', userController.actionLogin);

router.get('/logout', userController.actionLogout);

router.get('/profil', userController.renderProfilPage);

router.post('/profil', userController.actionDelete);


// Gestion des favoris
router.get('/bookmark', bookmarkController.renderBookmarkPage);
router.get('/bookmark/add/:id', bookmarkController.addOnBookmark);
router.get('/bookmark/delete/:id', bookmarkController.deleteFromBookmark);

module.exports = router;
