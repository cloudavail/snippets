#!/usr/bin/env ruby

begin
  File.open("file_not_exist.txt", "r")
rescue Errno::ENOENT => e
  # note: this should be a logging statement - did not implement today, however
  puts "File Does Not Exist, error is: \"#{e.message}\""
end

puts "Ruby Program Continues"
