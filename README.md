# taskrunner

jsのメタ言語のコンパイルとコードの圧縮(minify)と結合(concat)、
cssのメタ言語のコンパイルとコードの圧縮(minify)と結合(concat)、
画像の圧縮と、sprite画像の生成、sprite画像を使用する為のcssの生成を行います。
これらのファイルの変更を監視し、自動でビルドします。
また、簡易サーバーを立ち上げたり、HeadlessブラウザとしてPhantomJSを用い、mocha/chai構文でテストを実行できます。

下記のコンパイルに対応します。

- coffeescript(.coffee)
- es6(.js)
- typescript(.ts)
- sass(.sass)
- scss(.scss)
- less(.less)
- stylus(.styl)

## Usage

####はじめに

gulpとbowerをグローバルインストールし、必要モジュールをインストールします

    $ npm install -g bower gulp
    $ cd path/to/gulp-runners && npm install

フロントエンドのパッケージ管理ツールにbowerを使用しています。
適宜必要なフロントエンドライブラリをインストールしてください。

    $ bower install angular

####ビルド設定

    /gulp/config.coffee

    module.exports =
      path:
        src: 'src'                  # 開発ディレクトリ
        dest: 'public/assets'       # 出力先ディレクトリ
      js:
        dir: 'js'                   # jsディレクトリ(この中のファイルはコンパイルされます)
        minify: ['**/*.js']         # コンパイル後、圧縮するファイルの指定
        concat:                     # コンパイル後、結合するファイルの指定
          'all.js' : ['**/*.js']    # key = 結合後のファイル、value = 結合するファイルの指定
      css:
        dir: 'css'                  # cssディレクトリ(この中のファイルはコンパイルされます)
        minify: ['**/*.css']        # コンパイル後、圧縮するファイルの指定
        concat:                     # コンパイル後、結合するファイルの指定
          'all.css' : ['**/*.css']  # key = 結合後のファイル、value = 結合するファイルの指定
      image:
        dir: 'images'               # 画像ディレクトリ(この中の画像は圧縮されます)
        options:                    # imagemin-pngquantの画像圧縮設定
          quality: '60-80'
          speed: 1
        sprite:
          dir: 'images/sprite'      # sprite画像ディレクトリ(この中の画像は一つのsprite画像になります)
          options:                  # gulp-spritesmithのsprite画像出力設定
            imgName: 'sprite.png'   # sprite画像名
            cssName: 'sprite.css'   # spritecss名 sprite/sample.pngの場合<i class="icon-sample"></i>で表示されます
      bower:
        dir: 'lib'                  # bowerライブラリの出力先
      browser:                      # browser-sync設定
        server:
          baseDir: 'public'         # 簡易サーバーを実行した際のルート
        ghostMode:
          clicks: false
          location: false
          forms: false
          scroll: false

####テスト設定

    /karma.conf.coffee

####タスクの実行

######デフォルトタスク実行(build, watch, server)

    $ gulp

######ビルド

    $ gulp build

######ビルドディレクトリの削除

    $ gulp clean

######ファイルの監視とコンパイル、(簡易サーバーの同期)

    $ gulp watch

######簡易サーバー立ち上げ

    $ gulp server

######テスト

    $ gulp test

## Development

## Contributing

## License

