#!/bin/bash

# install ruby
apt -y install ruby
# ruby-dev is required to build and install nokogiri

# install rails
# rails requires sqlite3 gem - this requires libsqlite3-dev to build
apt -y install libsqlite3-dev
gem install sqlite3
# rails requires nokogiri - nokogiri install instructions are here:
# https://www.nokogiri.org/tutorials/installing_nokogiri.html
apt -y install build-essential patch ruby-dev zlib1g-dev liblzma-dev
gem install rails

# and run a rails app
cd /vagrant/helloworld
bundle install
# resolve an issue where the following error is presented when running `bin/rails server`
# /var/lib/gems/2.5.0/gems/execjs-2.7.0/lib/execjs/runtimes.rb:58:in `autodetect': Could not find a JavaScript runtime. See https://github.com/rails/execjs for a list of available runtimes. (ExecJS::RuntimeUnavailable)
apt update
apt -y install nodejs
bin/rails server
