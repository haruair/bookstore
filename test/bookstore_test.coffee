chai = require 'chai'
chai.should()

{Book} = require '../src/bookstore'

describe 'Book', ->
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

