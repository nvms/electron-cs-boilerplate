# ∴

'use strict'

electron = require('electron')
gulp = require('gulp')
sass = require('gulp-sass')
cp = require('child_process')

gulp.task 'compile_scss_to_cssand_copy', ->
  gulp.src('./src/scss/**/*.scss').pipe(sass(outputStyle: 'compressed')).on('error', sass.logError).pipe(gulp.dest('./app/css')).resume()

gulp.task 'copy_html', ->
  gulp.src('./src/*.html').pipe gulp.dest('./app')
  return
  
gulp.task 'start', [ 'build' ], ->
  gulp.watch './src/scss/**/*.scss', [ 'compile_scss_to_cssand_copy' ]
  gulp.watch './src/*.html', [ 'copy_html' ]
  cp.spawn(electron, [ '.' ], stdio: 'inherit').on 'close', ->
    process.exit()
    return
  return