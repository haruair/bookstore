chai = require 'chai'
chai.should()

{Book} = require '../src/bookstore'

describe 'Book', ->
  it 'should have a title', ->
    book1 = new Book 'Colorless Tsukuru Tazaki'
    book1.title.should.equal 'Colorless Tsukuru Tazaki'
