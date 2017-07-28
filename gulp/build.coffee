# ∴

'use strict'

gulp = require('gulp')
jetpack = require('fs-jetpack')
bundle = require('./bundle')
babel = require('gulp-babel')
minify = require('gulp-minify')
srcDir = jetpack.cwd('./src')
destDir = jetpack.cwd('./app')

paths = 
  SRC_SCRIPTS: [
    './src/scripts/*.js'
    './src/scripts/**/*.js'
  ]
  DEST_SCRIPTS: './app/scripts'
  SRC_COMPONENTS: [
    './src/components/*.js'
    './src/components/**/*.js'
  ]
  DEST_COMPONENTS: './app/components'
  SRC_HTML: './src/*.html'
  DEST_HTML: './app'
  SRC_APPSRC: './src/*.js'
  DEST_APPSRC: './app'
  ELECTRON_SCRIPTS: './app/*.js'
  
gulp.task 'bundle', ->
  Promise.all [
    bundle(srcDir.path('bootstrap.js'), destDir.path('bootstrap.js'))
    bundle(srcDir.path('background.js'), destDir.path('background.js'))
  ]
  gulp.src(paths.SRC_HTML).pipe gulp.dest(paths.DEST_HTML)
  return

gulp.task 'compile_es6_to_standardjs_and_copy', ->
  gulp.src(paths.SRC_SCRIPTS).pipe(babel(presets: [ 'es2015' ])).pipe(minify(ext:
    src: '-debug.js'
    min: '.js')).pipe gulp.dest(paths.DEST_SCRIPTS)
  gulp.src(paths.SRC_COMPONENTS).pipe(babel(presets: [ 'es2015' ])).pipe(minify(ext:
    src: '-debug.js'
    min: '.js')).pipe gulp.dest(paths.DEST_COMPONENTS)
  return

gulp.task 'build', [
  'bundle'
  'compile_es6_to_standardjs_and_copy'
  'compile_scss_to_cssand_copy'
]