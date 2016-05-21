#!/bin/bash

apt -y install ruby
# required to gem install fluentd
# resolves the following error:
# mkmf.rb can't find header files for ruby at /usr/lib/ruby/include/ruby.h
apt -y install ruby-dev
# resolves the following error:
# sh: 1: make: not found
apt -y install build-essential
gem install fluentd

# and test
# from: http://docs.fluentd.org/articles/install-by-gem#step3-run
#
# fluentd --setup ./fluent
# fluentd -c ./fluent/fluent.conf -vv &
# echo '{"json":"message"}' | fluent-cat debug.test
