class Book
  constructor: (@title) ->
    @volume = 'single'
    @status = 'new'
    true

  seriesOf: (@original) ->
    @original.sequel = @
    @volume = 'series'

  use: ->
    @status = 'used'
    true

root = exports ? window
root.Book = Book
