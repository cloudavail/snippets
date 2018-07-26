#!/usr/bin/env ruby

require 'erb'

user_home_template = ERB.new("Users $HOME is: <%= ENV['HOME'] %>")
puts user_home_template.result(binding)
