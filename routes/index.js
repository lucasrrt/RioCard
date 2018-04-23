var express = require('express');
var router = express.Router();

var db = require('../queries');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/api/cards', db.getAllCards);
router.get('/api/cards/:id', db.getSingleCard);
router.post('/api/cards', db.createCard);
router.put('/api/cards/:id', db.updateCard);
router.delete('/api/cards/:id', db.removeCard);

module.exports = router;