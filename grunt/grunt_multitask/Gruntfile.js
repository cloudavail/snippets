// objective:
// create a task that acccepts inputs from a grunt config object

module.exports = function (grunt) {

  grunt.initConfig({
    echo: {
      target_one: 'target_one called',
      target_two: 'target_two called',
    }
  });

  grunt.task.registerMultiTask('echo', 'echo a passed argument.', function() {
    grunt.log.write(this.data)
  });

  grunt.task.registerTask('default',['echo']);

};
