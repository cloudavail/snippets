#!/usr/bin/env ruby

# to test the "redis" gem of a particular version
# you can do gem install redis -v 4.1.0.beta1 = has cluster support
# note that the earliest ruby gem that supports cluster mode is version 4.1.0.beta1
# I have confirmed that "sets" using this gem go to either node in a given cluster

require "redis"

redis_cluster = Redis.new(cluster: %w[redis://elrhk36dzgod30d.dthl4f.clustercfg.usw2.cache.amazonaws.com:6379])

for key in 0..999
  # creates a random value
  value = rand(0..99999)
  puts "Putting Key: #{key} with Value: #{value}"
  # sets key in redis
  redis_cluster.set(key, value)
end
