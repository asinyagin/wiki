define (require) ->
  Marionette = require 'marionette'

  DocView = Marionette.ItemView.extend
    tagName: 'li'
    template: _.template('<a href="#docs/<%= id %>"><%= title %></a>')

  Marionette.CompositeView.extend
    template: _.template('<ul id="docs"></ul>')
    childView: DocView
    childViewContainer: 'ul#docs'
