#!/bin/bash

# install ruby
apt -y install ruby
# ruby-dev is required to build and install nokogiri

# install rails
# rails requires nokogiri - nokogiri install instructions are here:
# https://www.nokogiri.org/tutorials/installing_nokogiri.html
apt -y install build-essential patch ruby-dev zlib1g-dev liblzma-dev
gem install rails
