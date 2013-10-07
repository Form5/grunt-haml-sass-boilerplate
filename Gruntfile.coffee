module.exports = (grunt) ->
  grunt.initConfig

    rubyHaml:
      dist:
        files: grunt.file.expandMapping(['views/*.haml'], 'dist/',
          rename: (base, path) ->
            base + path.replace(/\.haml$/, '.html').replace('views/', '')
        )

    sass:
      dist:
        files:
          'dist/assets/stylesheets/main.css': 'assets/stylesheets/main.scss'

    coffeelint:
      app:
        files:
          src: ['assets/javascript/**/*.coffee']

    coffee:
      options:
        sourceMap: true

      compile:
        files:
          'dist/assets/javascript/app.js': ['assets/javascript/**/*.coffee']

    imagemin:
      all:
        files: [
          expand: true
          cwd: 'assets/images/'
          src: ['**/*.{png,jpg,jpeg}']
          dest: 'dist/assets/images/'
        ]

    svgmin:
      all:
        files: [
          expand: true
          cwd: 'assets/images/'
          src: ['**/*.svg']
          dest: 'dist/assets/images/'
        ]

    copy:
      main:
        files: [
          {
            expand: true
            cwd: 'assets/webfonts'
            src: '**'
            dest: 'dist/assets/webfonts'
          }
        ]


    watch:
      haml:
        files: ['views/**/*.haml']
        tasks: ['rubyHaml', 'notify:watch']

      coffee:
        files: ['assets/javascript/**/*.coffee']
        tasks: ['coffeelint', 'coffee', 'notify:watch']

      sass:
        files: ['assets/stylesheets/**/*.scss']
        tasks: ['sass', 'notify:watch']

      img:
        files: ['assets/images/**/*.{jpg,png,jpeg}']
        tasks: ['imagemin', 'notify:watch']

      webfonts:
        files: ['assets/webfonts/**']
        tasks: ['copy', 'notify:watch']

      dist:
        files: ['dist/assets/stylesheets/**/*.css', 'dist/**/*.html', 'dist/assets/images/**/*', 'dist/assets/javascript/**/*.js']
        options:
          livereload: true

    connect:
      server:
        options:
          port: 1337
          base: 'dist'

    open:
      dev:
        path: 'http://localhost:1337/'
        app: 'Google Chrome'

    notify_hooks:
      enabled: true

    notify:
      watch:
        options:
          title: 'Task complete'
          message: 'Dist files successfully updated'

      server:
        options:
          title: 'Server started'
          message: 'Server started at http://localhost:1337'

  grunt.loadNpmTasks 'grunt-notify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-ruby-haml'
  grunt.loadNpmTasks 'grunt-sass'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-open'
  grunt.loadNpmTasks 'grunt-svgmin'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-coffeelint'

  grunt.registerTask 'default', ['rubyHaml', 'sass', 'imagemin', 'svgmin', 'coffeelint', 'coffee', 'copy']
  grunt.registerTask 'server', ['default', 'connect', 'notify:server', 'open:dev', 'watch']