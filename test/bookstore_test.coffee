chai = require 'chai'
chai.should()
expect = chai.expect

{Book, BookShelf} = require '../src/bookstore'

describe 'Book', ->
  book1 = book2 = null

  it 'should have a title', ->
    book1 = new Book 'Colorless Tsukuru Tazaki'
    book1.title.should.equal 'Colorless Tsukuru Tazaki'

  it 'should be a series of books', ->
    book1 = new Book "Harry Potter and the Philosopher's Stone"
    book2 = new Book "Harry Potter and the Chamber of Secrets"
    
    book2.seriesOf book1

    book2.volume.should.equal 'series'
    book2.original.should.equal book1
    book1.sequel.should.equal book2

  it 'should be initially new', ->
    book1.status.should.equal 'new'

  it 'should be used', ->
    book1.use().should.be.true
    book1.status.should.equal 'used'

describe 'Bookshelf', ->
  shelf = null

  it 'should be initially empty', ->
    shelf = new BookShelf
    shelf.books.length.should.be.equal 0
    shelf.count.should.be.equal 0

  it 'should accept new book', ->
    book = new Book 'Thinking, Fast and Slow'
    shelf.add book
    shelf.books[0].title.should.equal 'Thinking, Fast and Slow'
    shelf.count.should.equal 1

  it 'should accept new book title as a new book', ->
    shelf.add 'The Media Equation'
    shelf.books[1].title.should.equal 'The Media Equation'
    shelf.count.should.equal 2

  it 'should remove books', ->
    i = shelf.length - 1
    shelf.remove shelf.books[i]
    expect(shelf.books[i]).to.not.be.ok

  it 'should print out the list of books', ->
    shelf = new BookShelf
    book1 = new Book '1Q84 1'
    book2 = new Book '1Q84 2'
    book3 = new Book 'Hard-boiled Wonderland and the End of the World'
    book4 = new Book 'Kafka on the shore'
    book5 = new Book 'Norwegian wood'

    shelf.add book1
    shelf.add book2
    shelf.add book3
    shelf.add book4
    shelf.add book5

    book2.seriesOf book1

    book5.use()

    desiredOutput = """Books

- 1Q84 1 (original of '1Q84 2')
- 1Q84 2 (sequel of '1Q84 1')
- Hard-boiled Wonderland and the End of the World
- Kafka on the shore
- Norwegian wood (used)

"""
    shelf.print().should.equal desiredOutput



