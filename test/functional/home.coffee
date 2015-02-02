casper.test.begin 'Home page', 2, (test) ->
  casper
    .start 'http://localhost:3000', ->
      @waitForSelector('ul#docs')
    .then ->
      test.assertTitleMatch(/Wiki/, 'Title should contain Wiki')
      test.assertUrlMatch(/#docs$/, 'URL should be #docs')
    .run -> test.done()
