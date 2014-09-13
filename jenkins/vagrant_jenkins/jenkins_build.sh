#!/bin/bash

# installs of all jenkins dependencies
sudo apt-get -y install jenkins

# Restart jenkins service
sudo service jenkins restart

# update Jenkins to latest version
sudo service jenkins stop
cd /usr/share/jenkins
rm jenkins.war
wget http://updates.jenkins-ci.org/latest/jenkins.war
sudo service jenkins start
sudo service jenkins restart
