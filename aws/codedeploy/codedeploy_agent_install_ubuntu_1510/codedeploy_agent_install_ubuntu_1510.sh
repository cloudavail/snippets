#!/bin/bash

region='us-west-2'

cat > /etc/apt/sources.list.d/trusty.list <<EOF
deb http://archive.ubuntu.com/ubuntu trusty main restricted
deb-src http://archive.ubuntu.com/ubuntu trusty main restricted
deb http://archive.ubuntu.com/ubuntu trusty-updates main restricted
deb-src http://archive.ubuntu.com/ubuntu trusty-updates main restricted
deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse
EOF
apt-get -y update
apt-get -y install python-pip
apt-get -y install ruby2.0
pip install awscli
cd /var/tmp
mkdir -p ~/.aws
cp /vagrant/aws_credentials ~/.aws/credentials
aws s3 cp s3://aws-codedeploy-${region}/latest/install . --region ${region}
chmod +x ./install
./install auto
