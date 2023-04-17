const notFound = function(req, res){
    res.status(404).render('error/404');
};

module.exports = notFound;
