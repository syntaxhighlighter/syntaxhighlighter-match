require 'coffee-errors'

chai = require 'chai'
parser = require '..'
expect = chai.expect

REGEX_LIST = [
  {regex: /hello|world/g, css: 'greeting'}
  {regex: /\w+/g, css: 'word'}
]

describe 'syntaxhighlighter-parser', ->
  matches = null

  describe '.parse', ->
    before ->
      matches = parser.parse "hello all world", REGEX_LIST

    describe 'matches', ->
      it 'is an array', ->
        expect(matches).to.be.instanceof Array

      it 'has items', ->
        expect(matches).to.have.length.above 0

    describe 'first match', ->
      it 'is `hello`', -> expect(matches[0].value).to.equal 'hello'
      it 'is a greeting', -> expect(matches[0].css).to.equal 'greeting'

    describe 'second match', ->
      it 'is `all`', -> expect(matches[1].value).to.equal 'all'
      it 'is a word', -> expect(matches[1].css).to.equal 'word'

    describe 'third match', ->
      it 'is `world`', -> expect(matches[2].value).to.equal 'world'
      it 'is a greeting', -> expect(matches[2].css).to.equal 'greeting'
