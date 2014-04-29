// objective:
// if my_argument is provided, echo it
// else echo 'no argument provided'
// example usage:
// grunt --my_argument='Giants WS Champs in 2010 and 2012/'
// result: Giants WS Champs in 2010 and 2012.
// grunt
// result: no argument provided.

module.exports = function (grunt) {

  grunt.task.registerTask('echo', 'echo a passed argument.', function() {
    var argument = grunt.option('my_argument') || 'no argument provided.';;
    grunt.log.write(argument)
  });

  grunt.task.registerTask('default',['echo']);

};
