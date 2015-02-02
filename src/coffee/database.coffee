client = require('mongodb').MongoClient

db = null

module.exports = (cb) ->
  if db then cb(db)
  else
    client.connect 'mongodb://localhost:27017/wikiDev', (err, db) ->
      throw err if err
      cb(db)
