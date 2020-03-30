#!/usr/bin/env ruby

record_exist = { stream: "stdout" }
record_not_exist = {}

puts record_exist[:stream] # stdout
puts record_not_exist[:stream] # 
puts record_not_exist[:stream] || "Not Defined"