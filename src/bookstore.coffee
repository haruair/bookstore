class Book
  constructor: (@title) ->
    @volume = 'single'
    true

  seriesOf: (@original) ->
    @original.sequel = @
    @volume = 'series'

root = exports ? window
root.Book = Book
