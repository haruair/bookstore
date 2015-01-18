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

class BookShelf
  constructor: ->
    @books = []
    @count = 0

  add: (book) ->
    if typeof book is 'string'
      @books.push new Book book
    else
      @books.push book
    @count = @books.length

  remove: (book) ->
    i = @books.indexOf book
    @books = @books[0...i].concat @books[i+1..] if i > -1
    @count = @count.length

  print: ->
    str = "Books\n\n"
    for book in @books
      str += "- #{book.title}"
      str += " (sequel of '#{book.original.title}')" if book.original?
      str += " (original of '#{book.sequel.title}')" if book.sequel?
      str += " (used)" if book.status is 'used'
      str += "\n"
    str

root = exports ? window
root.Book = Book
root.BookShelf = BookShelf
