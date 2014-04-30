// objective:
// echo an environment variable
//
// to configure:
// npm install
//
// to run without an environment variable set:
// grunt
// to run with an environment variable set:
// export MY_VAR='Giants won the World Series in 2010 and 2012.'
// grunt

module.exports = function (grunt) {

  grunt.task.registerTask('echo', 'echo an environment variable.', function() {
    var environment_variable = process.env.MY_VAR || 'No environment variable found.';;
    grunt.log.write(environment_variable)
  });

  grunt.task.registerTask('default',['echo']);

};
