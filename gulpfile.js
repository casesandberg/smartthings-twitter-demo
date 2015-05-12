var path = require('path');
var gulp = require('gulp');
var nodemon = require('nodemon');
var chalk = require('chalk');



gulp.task('start', function() {
  return nodemon({
    script: 'src/index.coffee',
    ext: 'js html coffee',
    env: { 'NODE_ENV': 'development' }
  }).on('restart', function() {
    return console.log(chalk.dim('REFRESHED'));
  });
});
