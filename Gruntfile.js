/*global module:false*/
module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    // Metadata.
    pkg: grunt.file.readJSON('package.json'),
    banner: '/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %> - ' +
      '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
      '<%= pkg.homepage ? "* " + pkg.homepage + "\\n" : "" %>' +
      '* Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>;' +
      ' Licensed <%= _.pluck(pkg.licenses, "type").join(", ") %> */\n',
    // Task configuration.
    concat: {
      options: {
        banner: '<%= banner %>',
        stripBanners: true
      },
      dist: {
        src: ['lib/<%= pkg.name %>.js'],
        dest: 'dist/<%= pkg.name %>.js'
      }
    },
    uglify: {
      options: {
        banner: '<%= banner %>'
      },
      dist: {
        src: '<%= concat.dist.dest %>',
        dest: 'dist/<%= pkg.name %>.min.js'
      }
    },
    coffee: {
      compileServer: {
        files: [{
          expand: true,
          cwd: 'src/coffee',
          src: ['**/*.coffee'],
          dest: 'target/js',
          ext: '.js'
        }]
      },
      compileClient: {
        files: [{
          expand: true,
          cwd: 'src/public/coffee',
          src: ['**/*.coffee'],
          dest: 'target/public/js',
          ext: '.js'
        }]
      }
    },
    copy: {
      views: {
        files: [{
          expand: true,
          cwd: 'src/views',
          src: ['**'],
          dest: 'target/views'
        }]
      },
      templates: {
        files: [{
          expand: true,
          cwd: 'src/public/templates',
          src: ['**'],
          dest: 'target/public/templates'
        }]
      },
      styles: {
        files: [{
          expand: true,
          cwd: 'src/public/css',
          src: ['**'],
          dest: 'target/public/css'
        }]
      }
    },
    casperjs: {
      files: ['test/functional/**/*.coffee']
    },
    watch: {
      coffeeServer: {
        files: 'src/coffee/**/*.coffee',
        tasks: 'coffee:compileServer'
      },
      compileClient: {
        files: 'src/public/coffee/**/*.coffee',
        tasks: 'coffee:compileClient'
      },
      views: {
        files: 'src/views/**',
        tasks: 'copy:views'
      },
      templates: {
        files: 'src/public/templates/**',
        tasks: 'copy:templates'
      },
      styles: {
        files: 'src/public/css/**',
        tasks: 'copy:styles'
      }
    }
  });

  // These plugins provide necessary tasks.
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-qunit');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-casperjs');

  // Default task.
  grunt.registerTask('default', ['jshint', 'qunit', 'concat', 'uglify']);
  grunt.registerTask('compile', ['coffee', 'copy']);
};
