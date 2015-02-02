define (require) ->
  Marionette = require 'marionette'
  tplDoc = require 'text!templates/doc.html'

  Marionette.ItemView.extend
    template: _.template(tplDoc)
