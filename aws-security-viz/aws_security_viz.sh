#!/bin/bash -

access_key="enter_here"
secret_key="enter_here"

apt-get -y install git
git clone https://github.com/anaynayak/aws-security-viz.git
cd aws-security-viz

apt-get -y update
apt-get -y install bundler
apt-get -y install ruby2.0
apt-get -y install graphviz

bundle install
bundle exec ruby lib/visualize_aws.rb -r us-west-2 -a $access_key -s $secret_key -f /vagrant/viz.svg --color=true
