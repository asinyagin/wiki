router = require('express').Router()

router.get '/', (req, res, next) ->
  res.render('index', title: 'Wiki')

module.exports = router
