#!/bin/bash

# from
# https://jenkins.io/download/

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "deb https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list
apt -y update
apt -y install jenkins
systemctl restart jenkins

# access Jenkins: http://192.168.2.2:8080/
