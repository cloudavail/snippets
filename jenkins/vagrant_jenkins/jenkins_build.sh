#!/bin/bash

# from
# https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Ubuntu

apt -y update
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list
apt -y update
apt -y install jenkins
systemctl restart jenkins

# access Jenkins: http://192.168.2.2:8080/

# update Jenkins to latest version
# systemctl stop jenkins
# cd /usr/share/jenkins
# rm jenkins.war
# wget http://updates.jenkins-ci.org/latest/jenkins.war
# systemctl stop start
