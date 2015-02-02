define (require) ->
  _ = require 'underscore'
  Backbone = require 'backbone'
  Marionette = require 'marionette'
  Document = require '../model/document'
  tplNewDoc = require 'text!templates/new_doc.html'
  globalChannel = Backbone.Wreqr.radio.channel('global')

  Marionette.ItemView.extend
    template: _.template(tplNewDoc)

    ui:
      form: 'form#new-doc'
      title: 'form#new-doc input[name=title]'
      body: 'form#new-doc textarea[name=body]'

    triggers:
      'submit @ui.form': 'createDocument'

    initialize: ->
      @model = new Document
      @documents = globalChannel.reqres.request('documents')

    onCreateDocument: ->
      @model.set(title: @ui.title.val(), body: @ui.body.val())
      @documents.create @model,
        success: (doc) ->
          Backbone.history.navigate("/docs/#{doc.id}", true)
