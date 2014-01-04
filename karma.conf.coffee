module.exports = (config) ->
  browsers = if process.env.TRAVIS
    ['Firefox']
  else
    ['Chrome']

  config.set
    frameworks: ['mocha', 'chai', 'browserify']
    browsers: browsers

    preprocessors:
      'test/**/*.spec.coffee': ['coffee', 'browserify']

    browserify:
      transform: ['coffeeify']
      extensions: ['.coffee']
      watch: true
      debug: true

    files: [
      'test/**/*.spec.coffee'
    ]
