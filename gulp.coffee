'use strict'

gulp = require 'gulp'
mocha = require 'gulp-mocha'
watch = require 'gulp-watch'
gutil = require 'gulp-util'

testSources = './tests/*.coffee'
assestSources = [ './**/*.coffee', './app/views/**/*' ]

gulp.task 'test', ->
  gulp.src testSources, { read: false }
  .pipe mocha
    reporter: 'list'
    globals: 
      supertest: require 'supertest'
      should: require 'should'
  .on 'error', (err) ->
    gutil.log "#{gutil.colors.red(err.name)} in plugin #{gutil.colors.cyan(err.plugin)} \n #{err}"

gulp.task 'watch', ->
  watch(
    assestSources, ['test']
  )

gulp.task 'default', ['test', 'watch']