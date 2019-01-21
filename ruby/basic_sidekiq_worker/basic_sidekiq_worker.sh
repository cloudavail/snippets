#!/bin/bash
apt update

apt -y install redis

apt -y install ruby ruby-bundler

cd /vagrant
bundle install
sidekiqctl status
