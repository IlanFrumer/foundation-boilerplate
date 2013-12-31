module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    sass:
      options:
        includePaths: ["bower_components/foundation/scss"]

      dist:
        options:
          outputStyle: "nested"

        files:
          "dist/css/app.css": "src/scss/app.scss"

    jade:
      dev:
        options:
          pretty: true

        expand: true
        cwd: 'src/'
        src: ['{,**/}*.jade']
        dest: 'dist/'
        ext: '.html'

    connect:
      server:
        options:
          hostname: "*"
          base: "./dist"

    watch:
      options:
        livereload: true

      grunt:
        files: ["Gruntfile.coffee"]

      jade: 
        files: ['{,**/}*.jade']
        tasks: ["jade"]

      sass:
        files: "src/scss/**/*.scss"
        tasks: ["sass"]

  grunt.loadNpmTasks "grunt-sass"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-jade"
  grunt.registerTask "build", ["sass", "jade"]
  grunt.registerTask "default", [ "build" , "connect" , "watch" ]