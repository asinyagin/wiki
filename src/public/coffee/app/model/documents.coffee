define (require) ->
  Backbone = require 'backbone'
  Document = require './document'

  Backbone.Collection.extend
    model: Document
    url: '/docs'
