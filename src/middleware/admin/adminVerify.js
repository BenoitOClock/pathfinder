const adminVerify = (req, res, next) => {
    if (!req.user) {
      return res.redirect("/login");
    }
    if (req.user.role !== "admin") {
      return res.status(403).render("error/403");
    }
    // Si tout se passe
    next();
  };

module.exports = adminVerify;
