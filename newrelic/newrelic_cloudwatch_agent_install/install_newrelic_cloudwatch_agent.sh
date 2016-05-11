#!/usr/bin/env bash

gem install bundler
cd /var/tmp
wget https://github.com/newrelic-platform/newrelic_aws_cloudwatch_plugin/archive/latest.tar.gz
tar xvf latest.tar.gz
cp /vagrant/newrelic_plugin.yml /var/tmp/newrelic_aws_cloudwatch_plugin-latest/config/newrelic_plugin.yml 
cd newrelic_aws_cloudwatch_plugin-latest


apt-get -y install build-essential patch
apt-get -y install ruby-dev zlib1g-dev liblzma-dev
apt-get -y install libxml2-dev
apt-get -y install libxslt1-dev
gem install nokogiri

bundle install

#In order to run NewRelic Agent, run line below.
#bundle exec ./bin/newrelic_aws
