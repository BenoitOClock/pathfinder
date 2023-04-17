const express = require('express');
const mainController = require('../controllers/mainController.js');
const trekController = require('../controllers/trekController.js');
// ...

const router = express.Router();

router.get('/', mainController.homePage);

router.get('/trek/:id', trekController.renderOneTrek);

router.get('/trek/:id/photos', trekController.renderTrekPhotos);




module.exports = router;
