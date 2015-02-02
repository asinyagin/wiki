router = require('express').Router()
exec = require '../database'
ObjectID = require('mongodb').ObjectID

router.get '/', (req, res, next) ->
  exec (db) ->
    db.collection('docs').find({}).toArray (err, docs) ->
      throw err if err
      res.json docs.map (doc) ->
        id: doc._id
        title: doc.title
        body: doc.body

router.get '/:id', (req, res, next) ->
  exec (db) ->
    db.collection('docs').find(_id: ObjectID(req.params.id))
      .toArray (err, docs) ->
        throw err if err
        res.json
          id: docs[0]._id
          title: docs[0].title
          body: docs[0].body

router.post '/', (req, res, next) ->
  exec (db) ->
    db.collection('docs').insert req.body, (err, docs) ->
      throw err if err
      res.json(id: docs[0]._id)

module.exports = router
