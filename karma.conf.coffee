module.exports = (config) ->
  config.set
    frameworks: ['browserify', 'mocha', 'chai']
    browsers: if process.env.TRAVIS then ['Firefox'] else ['Chrome']

    preprocessors:
      '**/*.spec.coffee': ['browserify']

    browserify:
      transform: ['coffeeify']
      extensions: ['.coffee']
      noParse: ['coffee-errors']
      watch: true
      debug: true

    files: [
      'test/**/*.spec.coffee'
    ]
