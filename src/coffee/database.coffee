client = require('mongodb').MongoClient

db = null

module.exports = (cb) ->
  if db then cb(db)
  else
    client.connect 'mongodb://localhost:27017/wikiDev', (err, connected) ->
      throw err if err
      db = connected
      cb(db)
