class Book
  constructor: (@title) ->
    true

root = exports ? window
root.Book = Book
