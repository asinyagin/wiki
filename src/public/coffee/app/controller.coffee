define (require) ->
  Backbone = require 'backbone'
  Marionette = require 'marionette'
  DocsView = require './view/docs'
  DocView = require './view/doc'
  NewDocView = require './view/new_doc'
  globalChannel = Backbone.Wreqr.radio.channel('global')

  Marionette.Object.extend
    initialize: (options) ->
      @layout = options.layout
      @documents = globalChannel.reqres.request('documents')

    docs: ->
      @documents.fetch()
      @layout.getRegion('main').show(new DocsView(collection: @documents))

    doc: (id) ->
      doc = @documents.get(id)
      @layout.getRegion('main').show(new DocView(model: doc))

    newDoc: ->
      @layout.getRegion('main').show(new NewDocView)
