module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-karma'

  grunt.config.init
    karma:
      options: configFile: 'karma.conf.coffee'
      test: singleRun: true
      dev: autoWatch: true

  grunt.registerTask 'test', ['karma:test']
  grunt.registerTask 'dev', ['karma:dev']
