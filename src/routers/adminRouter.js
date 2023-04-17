const { Router } = require("express");

const adminController = require("../controllers/admin/adminController");
const adminVerify = require("../middleware/admin/adminVerify");


const router = Router();

// pour toutes les routes commençant par "/admin" (et toutes les méthodes HTTP)
// On utilisera le middleware qui verifie le role de l'utilisateur
router.use("/admin", adminVerify);
router.get('/admin', adminController.renderAdminPage);

module.exports = router;
