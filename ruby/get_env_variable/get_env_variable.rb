#!/usr/bin/env ruby

# objective:
# if an environment variable exists, print the variable to stdout
# else print that the variable does not exist to stderr

# resources:
# http://www.ruby-doc.org/core-2.1.2/ENV.html

if ENV.include?('my_variable')
  $stdout.puts "my_variable is: #{ENV['my_variable']}"
else
  $stderr.puts 'Environment variable \'my_variable\' does not exist.'
end
