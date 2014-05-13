// objective:
// compress a given directory named "directory_to_be_compressed"
// in tar.gz format

'use strict';

module.exports = function (grunt) {

    grunt.initConfig({

        compress: {
            main: {
                options: {
                	archive: 'compressed_directory.tar.gz',
                    mode: 'tgz', //use tgz to compress
                },
                files: [
                    {
                    	// use of "expand" is described here:
                    	// http://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
                        expand: true,
                        // match all files and directories within
                        // directory_to_be_compressed
                        src: './directory_to_be_compressed/**', 
                        // dst: is not defined - defining a destination creates
                        // a directory at the root of a given directory
                        // example: defining dst: testing would create a directory
                        // /testing/directory_to_be_compressed/<directories>
                        // when the compressed archive was expanded
                    }
                ]
            },
        },
    });

grunt.loadNpmTasks('grunt-contrib-compress');
grunt.registerTask('default', ['compress']);

}
