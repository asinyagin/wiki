define (require) ->
  Backbone = require 'backbone'
  Marionette = require 'marionette'
  Router = require './router'
  Controller = require './controller'
  Documents = require './model/documents'

  new Marionette.Application
    onStart: ->
      documents = new Documents
      channel = Backbone.Wreqr.radio.channel('global')
      channel.reqres.setHandler 'documents', -> documents

      layout = new Marionette.LayoutView
        el: 'body'
        regions:
          main: '#main'

      new Router(controller: new Controller(layout: layout))

      Backbone.history.start()
      Backbone.history.navigate('docs', trigger: true)
