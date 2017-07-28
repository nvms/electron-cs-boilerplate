# ∴

'use strict'

gulp = require('gulp')
del = require('del')
toDelete = [
  'app/**/*'
  'dist/'
  'src/*.js'
  'src/**/*.js'
  'gulp/*.js'
]

gulp.task 'clean_bundled', ->
  del(toDelete).then (paths) ->
    console.log 'Deleted files/folders:'
    console.log paths.join '\n'
    return
  return

gulp.task 'clean', [ 'clean_bundled' ]