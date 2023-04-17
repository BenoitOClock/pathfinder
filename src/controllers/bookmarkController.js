const { Trek } = require("../models/index");


const bookmarkController = {
        async renderBookmarkPage(req, res) {
            const treks = await Trek.findAll({
                include: [
                    {
                        association: 'difficulty',
                        attributes: ['name'],
                    },
                    {
                        association: 'summit',
                        attributes: ['name'],
                    },
                    {
                        association: 'tags',
                        attributes: ['name'],
                        through: { attributes: [] },
                    }
                ]
            });
        const session = req.session.bookmark;
        try {
            res.render("admin/bookmark", {session, treks, meta: "Favoris"});
        } catch (error) {
            console.trace(error)
            res.status(500).send("Impossible d'afficher la page");
        }
    },
    async addOnBookmark(req, res) {
        const id = Number(req.params.id);
        try {
            if (!req.session.bookmark){
                req.session.bookmark = [];
            }
            if (!req.session.bookmark.includes(id)){
            req.session.bookmark.push(id);
        }
            res.redirect('/bookmark')
        } catch (error) {
            console.trace(error)
            res.status(500).send("Impossible d'afficher la page");
        }},
    deleteFromBookmark(req, res) {
        const id = Number(req.params.id);
        const index = req.session.bookmark.indexOf(id);
        if (index > -1) {
          req.session.bookmark.splice(index, 1);
          }
          res.redirect('/bookmark');
        }
};



module.exports = bookmarkController;
