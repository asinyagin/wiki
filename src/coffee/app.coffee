express = require 'express'
path = require 'path'
favicon = require 'serve-favicon'
logger = require 'morgan'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'

index = require './routes/index'
docs = require './routes/docs'

app = express()
app.set('views', path.join(__dirname, '../views'))
app.set('view engine', 'jade')

# app.use(favicon(__dirname + '/public/favicon.ico'))
app.use(logger('dev'))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded(extended: false))
app.use(cookieParser())
app.use(express.static(path.join(__dirname, '../public')))

app.use('/', index)
app.use('/docs', docs)

app.use (req, res, next) ->
  err = new Error('Not Found')
  err.status = 404
  next(err)

# development error handler
if app.get('env') == 'development'
  app.use (err, req, res, next) ->
    res.status(err.status || 500)
    res.render 'error',
      message: err.message
      error: err

# production error handler
app.use (err, req, res, next) ->
  res.status(err.status || 500)
  res.render 'error',
    message: err.message
    error: {}

module.exports = app
