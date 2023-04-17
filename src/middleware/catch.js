const catchMid = (err, req, res, next) => {
    console.trace(err);
    res.status(500).render('Une erreur est survenue sur le serveur !');
  };