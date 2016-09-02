module.exports =
  path:
    src: 'src'
    dest: 'public/assets'
  js:
    dir: 'js'
    minify: ['**/*.js']
    concat:
      'all.js' : ['**/*.js']
  css:
    dir: 'css'
    minify: ['**/*.css']
    concat:
      'all.css' : ['**/*.css']
  image:
    dir: 'images'
    # imagemin-pngquant設定
    options:
      quality: '60-80'
      speed: 1
    sprite:
      dir: 'images/sprite'
      # gulp-spritesmith設定
      options:
        imgName: 'sprite.png'
        cssName: 'sprite.css'
  bower:
    dir: 'lib'
  # browser-sync設定
  browser:
    server:
      baseDir: 'public'
    ghostMode:
      clicks: false
      location: false
      forms: false
      scroll: false