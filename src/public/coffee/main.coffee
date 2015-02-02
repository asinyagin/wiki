requirejs.config
  paths:
    jquery: 'lib/jquery/dist/jquery'
    underscore: 'lib/underscore/underscore'
    backbone: 'lib/backbone/backbone'
    marionette: 'lib/marionette/lib/backbone.marionette'
    text: 'lib/text/text'

    app: 'app'
    templates: '../templates'

require ['app/wiki'], (wiki) -> wiki.start()
