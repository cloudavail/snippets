#!/usr/bin/ruby

my_file = '/path/to/file'

if File.exists?(my_file) == true
  puts 'File Exists'
else
  puts 'File Does Not Exist'
end
