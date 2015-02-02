define ['marionette'], (Marionette) ->
  Marionette.AppRouter.extend
    appRoutes:
      'docs': 'docs'
      'docs/:id': 'doc'
      'new-doc': 'newDoc'
