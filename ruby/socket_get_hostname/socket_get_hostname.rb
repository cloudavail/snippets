#!/usr/bin/env ruby

require 'socket'

hostname = Socket.gethostname

puts hostname
