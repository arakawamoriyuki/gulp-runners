gulp = require 'gulp'
$ = require('gulp-load-plugins')()
requireDir = require 'require-dir'

requireDir './gulp/tasks', {recurse: true}

gulp.task 'default', (callback)->
  $.runSequence(
    'build',
    'server',
    'watch',
    callback,
  )