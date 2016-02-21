#!/bin/bash

sudo apt-get update
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get -y install jenkins
service jenkins restart

# access Jenkins: http://192.168.2.2:8080/

# update Jenkins to latest version
# service jenkins stop
# cd /usr/share/jenkins
# rm jenkins.war
# wget http://updates.jenkins-ci.org/latest/jenkins.war
# sudo service jenkins start
# sudo service jenkins restart
