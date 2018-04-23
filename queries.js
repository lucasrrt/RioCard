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
    removeCard: removeCard
};

function getAllCards(req, res, next) {
    db.any('select * from cards')
        .then(function (data){
            res.status(200)
                .json({
                    status: 'success',
                    data: data,
                    message: 'Retrieved ALL cards'
                });
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
    db.none('insert into cards(code)' +
                'values(${code})', req.body)
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
    db.none('update cards set code=$1 where id=$2',
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
        });
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