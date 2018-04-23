var express = require('express');
var router = express.Router();

var db = require('../queries');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

// Cards routes
router.get('/api/cards', db.getAllCards);
router.get('/api/cards/:id', db.getSingleCard);
router.get('/api/new_card', function(req,res,next){res.render('card_create')});
router.post('/api/cards', db.createCard);
router.put('/api/cards/:id', db.updateCard);
router.delete('/api/cards/:id', db.removeCard);

// User routes
router.get('/api/users', db.getAllUsers);
router.get('/api/users/:id', db.getSingleUser);
router.get('/api/new_user', function(req,res,next){res.render('user_create')});
router.post('/api/users', db.createUser);
router.put('/api/users/:id', db.updateUser);
router.delete('/api/users/:id', db.removeUser);


module.exports = router;