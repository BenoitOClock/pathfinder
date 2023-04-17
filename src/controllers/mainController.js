const { Trek } = require("../models/index");
const path = require('path');
const fs = require("fs");

const mainController = {
    async homePage(req, res){
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
                    attributes: ['name', 'id'],
                    through: { attributes: [] },
                }
            ]
        });
        try {
            const successMessage = req.session.message;
            req.session.message = null;
            res.render('home', { treks, meta: "Accueil", successMessage});
        } catch (error) {
            console.trace(error);
            res.status(500).render("error/500");
        }
    }
};


module.exports = mainController;


    // const selectedTags = req.query.tags ? req.query.tags.split(',') : [];
  
    // let query = 'SELECT * FROM treks';
  
    // if (selectedTags.length > 0) {
    //   query += ' INNER JOIN tag_has_trek ON treks.id = tag_has_trek.trek_id';
    //   query += ' WHERE tag_has_trek.tag_id IN (' + selectedTags.map(tagId => parseInt(tagId)).join(',') + ')';
    //   query += ' GROUP BY treks.id';
    // }
  
    // db.query(query, (error, results) => {
    //   if (error) {
    //     console.log(error);
    //     res.status(500).send('Error retrieving treks from database');
    //   } else {
    //     res.render('treks', { treks: results });
    //   }
    // });