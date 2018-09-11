#!/usr/bin/env ruby

require 'rest-client'

url = 'www.google.com'

response = RestClient.get(url, headers={})

puts response
