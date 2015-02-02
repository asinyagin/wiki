casper.test.begin 'New document page', 3, (test) ->
  title = 'Test document'
  body = 'A new test document.'

  casper
    .start('http://localhost:3000')
    .then ->
      @waitForSelector('ul#docs')
    .thenClick('a[href="#new-doc"]')
    .then ->
      @waitForSelector('form#new-doc')
    .then ->
      test.assertUrlMatch(/#new-doc$/, 'URL should be #new-doc')
      @fill 'form#new-doc',
        title: title
        body: body,
        true
    .then ->
      @waitForUrl(/#docs\//)
    .then ->
      test.assertSelectorHasText('h3', title, 'Page should contain the title')
      test.assertSelectorHasText('p', body, 'Page should contain the body')
    .run -> test.done()
