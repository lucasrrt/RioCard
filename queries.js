var promise = require('bluebird');

var options = {
    // Initialization Options
    promiseLib: promise
};

var pgp = require('pg-promise')(options);
var connectionString = 'postgres://localhost:5432/riocard';
var db = pgp(connectionString);

// add query functions

module.exports = {
    getAllCards: getAllCards,
    getSingleCard: getSingleCard,
    createCard: createCard,
    updateCard: updateCard,
    removeCard: removeCard,
    getAllUsers: getAllUsers,
    getSingleUser: getSingleUser,
    createUser: createUser,
    updateUser: updateUser,
    removeUser: removeUser
};

function getAllCards(req, res, next) {
    db.any('select * from cards')
        .then(function (data){
            res.status(200)
                .render('card_index', {data: data});
        })
        .catch(function(err){
            return next(err);
        });
}

function getSingleCard(req,res,next){
    var cardID = parseInt(req.params.id);
    db.one('select * from cards where id = $1', cardID)
        .then(function(data) {
            res.status(200)
                .json({
                    status: 'success',
                    data: data,
                    message: 'Retrieved ONE card'
                });
        })
        .catch(function(err) {
            return next(err);
        });
}

function createCard(req,res,next) {
    db.none('insert into cards(code, user_id)' +
                'values($1, $2)', [req.body.code, req.body.user_id || null])
        .then(function(){
            res.status(200)
                .json({
                    status: 'success',
                    message: 'Inserted ONE card'
                });
        })
        .catch(function(err) {
            return next(err);
        });
}

function updateCard(req,res,next) {
    var cardID = parseInt(req.params.id)
    db.one('select * from users where user_id=$1', req.body.user_id)
        .then(
            db.none('update cards set user_id=$1 where id=$2',
                [req.body.code, cardID])
                .then(function(){
                    res.status(200)
                        .json({
                            status: 'success',
                            message: 'updated card'
                        });
                })
                .catch(function(err) {
                    return next(err);
                })
    )
}

function removeCard(req,res,next) {
    var cardID = parseInt(req.params.id);
    db.result('delete from cards where id = $1', cardID)
        .then(function(result) {
            res.status(200)
                .json({
                    status: 'success',
                    message: `Removed ${result.rowCount} card`
                });
        })
        .catch(function(err) {
            next(err);
        });
}

function getAllUsers(req, res, next) {
    db.any('select * from users')
        .then(function (data){
            res.status(200)
                .render('user_index', {data: data});
        })
        .catch(function(err){
            return next(err);
        });
}

function getSingleUser(req,res,next){
    var userID = parseInt(req.params.id);
    db.one('select * from users where id = $1', userID)
        .then(function(data) {
            res.status(200)
                .json({
                    status: 'success',
                    data: data,
                    message: 'Retrieved ONE user'
                });
        })
        .catch(function(err) {
            return next(err);
        });
}

function createUser(req,res,next) {
    db.none('insert into users(name, age)' +
                'values(${name}, ${age})', req.body)
        .then(function(){
            res.status(200)
                .json({
                    status: 'success',
                    message: 'Inserted ONE user'
                });
        })
        .catch(function(err) {
            return next(err);
        });
}

function updateUser(req,res,next) {
    var userID = parseInt(req.params.id)
    db.none('update users set name=$1, age=$2 where id=$3',
        [req.body.code, parseInt(req.body.age), userID])
        .then(function(){
            res.status(200)
                .json({
                    status: 'success',
                    message: 'updated user'
                });
        })
        .catch(function(err) {
            return next(err);
        });
}

function removeUser(req,res,next) {
    var userID = parseInt(req.params.id);
    db.result('delete from users where id = $1', userID)
        .then(function(result) {
            res.status(200)
                .json({
                    status: 'success',
                    message: `Removed ${result.rowCount} user`
                });
        })
        .catch(function(err) {
            next(err);
        });
}
